import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watchmore/model/model.dart';
import 'package:watchmore/service/service.dart';

part 'rated_movie_state.dart';

class RatedMovieCubit extends Cubit<RatedMovieState> {
  RatedMovieCubit() : super(RatedMovieInitial());

  Future<void> getRatedMovie() async {
    ApiReturnValue<List<MostRatedMovie>> result =
        await MovieService.getMostRatedMovie(page: 1);

    if (result.value != null) {
      emit(RatedMovieLoaded(result.value!));
    } else {
      emit(RatedMovieLoadingFailed(result.message!));
    }
  }
}
