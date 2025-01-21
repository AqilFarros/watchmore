import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watchmore/model/model.dart';
import 'package:watchmore/service/service.dart';

part 'review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit() : super(ReviewInitial());

  Future<void> getReview(int id) async {
    ApiReturnValue<List<Review>> result = await MovieService.getReview(id: id);

    if (result.value != null) {
      emit(ReviewLoaded(result.value!));
    } else {
      emit(ReviewLoadingFailed(result.message!));
    }
  }
}
