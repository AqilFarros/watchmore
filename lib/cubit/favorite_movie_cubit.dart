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
}
