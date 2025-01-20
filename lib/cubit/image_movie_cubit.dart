import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watchmore/model/model.dart';
import 'package:watchmore/service/service.dart';

part 'image_movie_state.dart';

class ImageMovieCubit extends Cubit<ImageMovieState> {
  ImageMovieCubit() : super(ImageMovieInitial());

  Future<void> getImageMovie(int id) async {
    ApiReturnValue<List<ImageMovie>> result =
        await MovieService.getImageMovie(id: id);

    if (result.value != null) {
      emit(ImageMovieLoaded(result.value!));
    } else {
      emit(ImageMovieLoadingFailed(result.message!));
    }
  }
}
