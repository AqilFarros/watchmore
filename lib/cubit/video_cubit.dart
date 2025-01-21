import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watchmore/model/model.dart';
import 'package:watchmore/service/service.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit() : super(VideoInitial());

  Future<void> getVideo(int id) async {
    ApiReturnValue<List<Video>> getVideo = await MovieService.getVideo(id: id);

    if (getVideo.value != null) {
      emit(VideoLoaded(getVideo.value!));
    } else {
      emit(VideoLoadingFailed(getVideo.message!));
    }
  }
}
