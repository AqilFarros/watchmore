import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watchmore/model/model.dart';
import 'package:watchmore/service/service.dart';

part 'cast_state.dart';

class CastCubit extends Cubit<CastState> {
  CastCubit() : super(CastInitial());

  Future<void> getCast(int id) async {
    ApiReturnValue<List<Cast>> result = await CastService.getCast(id: id);

    emit(CastInitial());
    if (result.value != null) {
      emit(CastLoaded(result.value!));
    } else {
      emit(CastLoadingFailed(result.message!));
    }
  }
}
