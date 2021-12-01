import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'config.dart';
import 'model.dart';
import 'package:http/http.dart' as http;

abstract class MovieDB {

  MovieDB();

  Future<List<Movie>> upcomingMovies();

  factory MovieDB.getInstance() => _MovieRepository();
}

class _MovieRepository extends MovieDB{

  static final _MovieRepository _singleton = new _MovieRepository._internal();

  factory _MovieRepository() => _singleton;

  _MovieRepository._internal();

  static List<Movie> _computeMovies(dynamic body) => List<Movie>.from(body.map((movie) => Movie.fromJson(movie)));
  @override
  Future<List<Movie>> upcomingMovies() async{
    var url = Uri.https(MOVIE_BASE_URL, '/3/movie/upcoming',
        { 'api_key': API_KEY,
          'language': 'en-US'
        });

    var response = await http.get(url);

    var body = json.decode(response.body);

    return compute(_computeMovies, body['results']);
  }
}