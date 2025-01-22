import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:watchmore/model/model.dart';
import 'package:http/http.dart' as http;

part 'movie.dart';
part 'genre.dart';
part 'cast.dart';

String baseUrl = "https://api.themoviedb.org/3";
String apiKey = dotenv.env['API_KEY']!;
