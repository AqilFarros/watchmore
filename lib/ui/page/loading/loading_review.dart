part of '../page.dart';

class LoadingReview extends StatefulWidget {
  const LoadingReview({super.key, required this.movie});

  final Movie movie;

  @override
  State<LoadingReview> createState() => _LoadingReviewState();
}

class _LoadingReviewState extends State<LoadingReview> {
  List<Review> _review = [];

  bool isReviewLoaded = false;

  void _checkCondition() {
    if (isReviewLoaded) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ReviewPage(
            name: widget.movie.title!,
            reviews: _review,
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    context.read<ReviewCubit>().getReview(widget.movie.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReviewCubit, ReviewState>(
      listener: (context, state) {
        if (state is ReviewLoaded) {
          _review = state.reviews;
          isReviewLoaded = true;
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
