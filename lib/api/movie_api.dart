import 'dart:convert';

import 'model.dart';
import 'package:http/http.dart' show Client, Response;

class MovieApi{
  String apiKey = '7c6fdfab1b9ae6b4cf6d0199fb71c8a3';
  String baseUrl = 'https://api.themoviedb.org/3';
  Client client = Client();
  Future<NewMovie> getNewMovie() async{

    Uri url = Uri.parse('$baseUrl/movie/upcoming/?api_key=$apiKey');

    Response response = await client.get(url);

    if(response.statusCode == 200){
      return NewMovie.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}