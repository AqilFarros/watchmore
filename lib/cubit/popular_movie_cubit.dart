import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watchmore/model/model.dart';
import 'package:watchmore/service/service.dart';

part 'popular_movie_state.dart';

class PopularMovieCubit extends Cubit<PopularMovieState> {
  PopularMovieCubit() : super(PopularMovieInitial());

  Future<void> getPopularMovie() async {
    ApiReturnValue<List<PopularMovie>> result =
        await MovieService.getPopularMovie(page: 1);

    if (result.value != null) {
      emit(PopularMovieLoaded(result.value!));
    } else {
      emit(PopularMovieLoadingFailed(result.message!));
    }
  }
}
