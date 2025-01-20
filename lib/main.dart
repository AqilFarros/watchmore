import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchmore/cubit/cast_cubit.dart';
import 'package:watchmore/cubit/detail_movie_cubit.dart';
import 'package:watchmore/cubit/genre_cubit.dart';
import 'package:watchmore/cubit/image_movie_cubit.dart';
import 'package:watchmore/cubit/playing_movie_cubit.dart';
import 'package:watchmore/cubit/popular_movie_cubit.dart';
import 'package:watchmore/cubit/rated_movie_cubit.dart';
import 'package:watchmore/cubit/recommendation_movie_cubit.dart';
import 'package:watchmore/ui/page/page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PopularMovieCubit()),
        BlocProvider(create: (context) => PlayingMovieCubit()),
        BlocProvider(create: (context) => RatedMovieCubit()),
        BlocProvider(create: (context) => GenreCubit()),
        BlocProvider(create: (context) => CastCubit()),
        BlocProvider(create: (context) => RecommendationMovieCubit()),
        BlocProvider(create: (context) => DetailMovieCubit()),
        BlocProvider(create: (context) => ImageMovieCubit()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoadingHomePage(),
      ),
    );
  }
}
