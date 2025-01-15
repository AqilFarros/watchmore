import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchmore/cubit/playing_movie_cubit.dart';
import 'package:watchmore/cubit/popular_movie_cubit.dart';
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
        BlocProvider(create: (BuildContext context) => PopularMovieCubit()),
        BlocProvider(create: (context) => PlayingMovieCubit(),)
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
