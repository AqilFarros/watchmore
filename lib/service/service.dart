import 'dart:convert';

import 'package:watchmore/model/model.dart';
import 'package:http/http.dart' as http;

part 'movie.dart';

String baseUrl = "https://api.themoviedb.org/3";
String apiKey = "65bc57d002bbce4b6ce3f6a210eba566";
String token =
    "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NWJjNTdkMDAyYmJjZTRiNmNlM2Y2YTIxMGViYTU2NiIsIm5iZiI6MTcwNzI3NjgwOS4xNTYsInN1YiI6IjY1YzJmYTA5ZTI2N2RlMDE3ZGJiY2Q4MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lauEHfjlcRXV_Y0Waffx7o23L2udR-Q2iQKaO0xhkLk";
