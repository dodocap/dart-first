import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:typed_data';

Future<void> main() async {
  final Uint8List downloadBytes = await downloadImage('https://alimipro.com/favicon.ico');

  final String directoryPath = Directory(Platform.script.toFilePath()).parent.path;
  final String fileName = '$directoryPath/icon.ico';

  final File file = await saveFile(downloadBytes, fileName);
  print('${file.path} 파일이 저장되었습니다.');
}

Future<Uint8List> downloadImage(String url) async {
  final http.Response response = await http.get(Uri.parse(url));
  // 바로 http.readBytes로 하면 코드 절약
  // 하지만 statusCode를 얻을 수 없다(throw ClientException처리로 대신해줌)
  // await http.readBytes(Uri.parse(url));
  return response.bodyBytes;
}

Future<File> saveFile(Uint8List bytes, String fileName) async {
  final File file = File(fileName);
  return await file.writeAsBytes(bytes);
}