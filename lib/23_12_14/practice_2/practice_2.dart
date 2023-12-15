import 'dart:convert';
import 'package:http/http.dart' as http;
import 'movie_info_details.dart';

Future<void> main() async {
  final List<int> movieIdList = [
    901362, 940721, 983507, 572802, 1113278,
    1022796, 678512, 1192578, 1071215, 940551,
    956920, 839369, 508883, 496450, 1027073,
    792307, 842675, 978870, 840430, 891699,
  ];

  for (final int movieId in movieIdList) {
    final MovieInfoDetails movieInfo = await getMovieInfoDetails(movieId);
    print(movieInfo.toJson());
    print('------------------------------------------------------------------------------------');
  }
}

Future<MovieInfoDetails> getMovieInfoDetails(int movieId) async {
  final http.Response response =
      await http.get(Uri.parse('https://api.themoviedb.org/3/movie/$movieId?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1'));

  return MovieInfoDetails.fromJson(jsonDecode(response.body));
}
