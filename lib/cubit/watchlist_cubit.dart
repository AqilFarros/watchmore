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

  Future<void> addWatchlist(
      {required String sessionId, required Watchlist movie}) async {
    ApiReturnValue<Watchlist> result =
        await MovieService.addWatchlistMovie(sessionId: sessionId, movie: movie);

    if (result.value != null) {
      emit(WacthlistLoaded(
          (state as WacthlistLoaded).movie + [result.value!]));
    } else {
      emit(WatchlistLoadedFailed(result.message!));
    }
  }

  Future<void> deleteWatchlistMovie(
      {required String sessionId, required Watchlist movie}) async {
    ApiReturnValue<Watchlist> result =
        await MovieService.deleteWatchlistMovie(
            sessionId: sessionId, movie: movie);

    if (result.value != null) {
      final currentMovies = (state as WacthlistLoaded).movie;

      final updatedMovies =
          currentMovies.where((m) => m.id != result.value!.id).toList();

      emit(WacthlistLoaded(updatedMovies));
    } else {
      emit(WatchlistLoadedFailed(result.message!));
    }
  }
}
