import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watchmore/model/model.dart';
import 'package:watchmore/service/service.dart';

part 'watchlist_state.dart';

class WacthlistCubit extends Cubit<WacthlistState> {
  WacthlistCubit() : super(const WacthlistInitial());

  Future<void> getWatchlist(String sessionId) async {
    ApiReturnValue<List<Watchlist>> result =
        await MovieService.getWatchlist(sessionId: sessionId);

    emit(const WacthlistInitial());
    if (result.value != null) {
      emit(WacthlistLoaded(result.value!));
    } else {
      emit(WatchlistLoadedFailed(result.message!));
    }
  }
}
