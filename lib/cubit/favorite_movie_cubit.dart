import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watchmore/model/model.dart';
import 'package:watchmore/service/service.dart';

part 'favorite_movie_state.dart';

class FavoriteMovieCubit extends Cubit<FavoriteMovieState> {
  FavoriteMovieCubit() : super(const FavoriteMovieInitial());

  Future<void> getFavoriteMovie(String sessionId) async {
    ApiReturnValue<List<FavoriteMovie>> result =
        await MovieService.getFavoriteMovie(sessionId: sessionId);

    emit(const FavoriteMovieInitial());
    if (result.value != null) {
      emit(FavoriteMovieLoaded(result.value!));
    } else {
      emit(FavoriteMovieLoadingFailed(result.message!));
    }
  }

  Future<void> addFavoriteMovie(
      {required String sessionId, required FavoriteMovie movie}) async {
    ApiReturnValue<FavoriteMovie> result =
        await MovieService.addFavoriteMovie(sessionId: sessionId, movie: movie);

    emit(const FavoriteMovieInitial());
    if (result.value != null) {
      emit(FavoriteMovieLoaded(
          (state as FavoriteMovieLoaded).movie + [result.value!]));
    } else {
      emit(FavoriteMovieLoadingFailed(result.message!));
    }
  }

  Future<void> deleteFavoriteMovie(
      {required String sessionId, required FavoriteMovie movie}) async {
    ApiReturnValue<FavoriteMovie> result =
        await MovieService.deleteFavoriteMovie(
            sessionId: sessionId, movie: movie);

    emit(const FavoriteMovieInitial());
    if (result.value != null) {
      final currentMovies = (state as FavoriteMovieLoaded).movie;

      final updatedMovies =
          currentMovies.where((m) => m.id != result.value!.id).toList();

      emit(FavoriteMovieLoaded(updatedMovies));
    } else {
      emit(FavoriteMovieLoadingFailed(result.message!));
    }
  }
}
