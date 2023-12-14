import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:typed_data';

Future<void> main() async {
  print('다운로드 시작');
  final Stopwatch stopwatch = Stopwatch()..start();

  final String directoryPath = Directory(Platform.script.toFilePath()).parent.path;
  final String fileName = '$directoryPath/icon.ico';

  final Uint8List downloadBytes = await downloadImage('https://alimipro.com/favicon.ico');
  final File file = await saveFile(downloadBytes, fileName);
  final int fileSize = await file.length();

  print('다운로드 끝');
  print('=========');
  print('소요시간 : ${stopwatch.elapsed}');
  print('용량 : ${fileSize}bytes');
}

Future<Uint8List> downloadImage(String url) async {
  final http.Response response = await http.get(Uri.parse(url));
  return response.bodyBytes;
}

Future<File> saveFile(Uint8List bytes, String fileName) async {
  final file = File(fileName).writeAsBytes(bytes);
  return file;
}