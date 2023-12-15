import 'dart:convert';
import 'package:http/http.dart' as http;
import 'movie_info.dart';

Future<void> main() async {
  MovieInfo movieInfo = await getMovieInfo();
  for (final MovieData movie in movieInfo.results) {
    print(movie.toJson());
  }

  List<MovieData> movieDataList = await getMovieDataList();
  for (final MovieData movie in movieDataList) {
    print(movie.toJson());
  }
}

Future<MovieInfo> getMovieInfo() async {
  http.Response response =
      await http.get(Uri.parse('https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1'));

  return MovieInfo.fromJson(jsonDecode(response.body));
}

Future<List<MovieData>> getMovieDataList() async {
  http.Response response =
    await http.get(Uri.parse('https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1'));

  // final jsonList = jsonDecode(response.body) as List<dynamic>;
  // 기존 장표 레퍼런스 코드에서 ['results'] 접근을 활용
  final jsonList = jsonDecode(response.body)['results'] as List<dynamic>;
  return jsonList.map((e) => MovieData.fromJson(e)).toList();
}