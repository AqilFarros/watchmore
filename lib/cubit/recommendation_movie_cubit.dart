import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watchmore/model/model.dart';
import 'package:watchmore/service/service.dart';

part 'recommendation_movie_state.dart';

class RecommendationMovieCubit extends Cubit<RecommendationMovieState> {
  RecommendationMovieCubit() : super(RecommendationMovieInitial());

  Future<void> getRecommendationMovie(int id) async {
    ApiReturnValue<List<RecommendationMovie>> result =
        await MovieService.getRecommendationMovie(id: id);

    emit(RecommendationMovieInitial());
    if (result.value != null) {
      emit(RecommendationMovieLoaded(result.value!));
    } else {
      emit(RecommendationMovieLoadingFailed(result.message!));
    }
  }
}
