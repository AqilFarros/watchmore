import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watchmore/model/model.dart';
import 'package:watchmore/service/service.dart';

part 'genre_state.dart';

class GenreCubit extends Cubit<GenreState> {
  GenreCubit() : super(GenreInitial());

  Future<void> getGenre() async {
    ApiReturnValue<List<Genre>> result = await GenreService.getGenre();

    emit(GenreInitial());
    if (result.value != null) {
      emit(GenreLoaded(result.value!));
    } else {
      emit(GenreLoadingFailed(result.message!));
    }
  }
}
