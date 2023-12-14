import 'dart:convert';
import 'package:http/http.dart' as http;
import 'movie_info.dart';

Future<void> main() async {
  MovieInfo movieInfo = await getMovieInfo();
  for (final movie in movieInfo.results) {
    print(movie.toJson());
  }
}

Future<MovieInfo> getMovieInfo() async {
  http.Response response =
      await http.get(Uri.parse('https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1'));

  return MovieInfo.fromJson(jsonDecode(response.body));
}
