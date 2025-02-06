import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watchmore/model/model.dart';
import 'package:watchmore/service/service.dart';

part 'detail_movie_state.dart';

class DetailMovieCubit extends Cubit<DetailMovieState> {
  DetailMovieCubit() : super(DetailMovieInitial());

  Future<void> getDetailMovie(int id) async {
    ApiReturnValue<DetailMovie> result =
        await MovieService.getDetailMovie(id: id);

    emit(DetailMovieInitial());
    if (result.value != null) {
      emit(DetailMovieLoaded(result.value!));
    } else {
      emit(DetailMovieLoadingFailed(result.message!));
    }
  }
}
