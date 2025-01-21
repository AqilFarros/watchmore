part of '../page.dart';

class LoadingVideo extends StatefulWidget {
  const LoadingVideo({super.key, required this.movie});

  final Movie movie;

  @override
  State<LoadingVideo> createState() => _LoadingVideoState();
}

class _LoadingVideoState extends State<LoadingVideo> {
  List<Video> _video = [];

  bool isVideoLoaded = false;

  void _checkCondition() {
    if (isVideoLoaded) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => VideoPage(
            name: widget.movie.title!,
            video: _video,
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    context.read<VideoCubit>().getVideo(widget.movie.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VideoCubit, VideoState>(
      listener: (context, state) {
        if (state is VideoLoaded) {
          _video = state.videos;
          isVideoLoaded = true;
          _checkCondition();
        }
      },
      child: Scaffold(
        backgroundColor: blackColor,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: CircularProgressIndicator(
                  color: mainColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
