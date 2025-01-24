import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watchmore/model/model.dart';
import 'package:watchmore/service/service.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> login(String username, String password) async {
    ApiReturnValue<Token> token = await AuthenthicationService.getToken();

    if (token.value != null) {
      ApiReturnValue<User> user = await AuthenthicationService.login(username, password, token.value!);
      if (user.value != null) {
        emit(UserLoaded(user.value!));
      } else {
        emit(UserLoadingFailed(user.message!));
      }
    } else {
      emit(UserLoadingFailed(token.message!));
    }
  }
}
