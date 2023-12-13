import 'dart:convert';

Future<void> main() async {
  final movieInfoString = await getMovieInfo();
  final movieInfo = MovieInfo.fromJson(jsonDecode(movieInfoString));
  print(movieInfo.director);
}

Future<String> getMovieInfo() async {
  await Future.delayed(Duration(seconds: 2));
  final mockData = {
    'title': 'Star Wars',
    'director': 'George Lucas',
    'year': 1997,
  };
  return jsonEncode(mockData);
}

class MovieInfo {
  String title;
  String director;
  int year;

  MovieInfo({
    required this.title,
    required this.director,
    required this.year,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'director': director,
      'year': year,
    };
  }

  factory MovieInfo.fromJson(Map<String, dynamic> map) {
    return MovieInfo(
      title: map['title'],
      director: map['director'],
      year: map['year'],
    );
  }
}
