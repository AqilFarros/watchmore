import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watchmore/model/model.dart';
import 'package:watchmore/service/service.dart';

part 'playing_movie_state.dart';

class PlayingMovieCubit extends Cubit<PlayingMovieState> {
  PlayingMovieCubit() : super(PlayingMovieInitial());

  Future<void> getPlayingMovie() async {
    ApiReturnValue<List<PlayingMovie>> result =
        await MovieService.getPlayingMovie(page: 1);

    emit(PlayingMovieInitial());
    if (result.value != null) {
      emit(PlayingMovieLoaded(result.value!));
    } else {
      emit(PlayingMovieLoadingFailed(result.message!));
    }
  }
}
