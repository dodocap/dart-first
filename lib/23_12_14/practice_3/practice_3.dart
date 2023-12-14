import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:typed_data';

Future<void> main() async {
  Uint8List downloadBytes = await downloadImage('https://alimipro.com/favicon.ico');

  final directoryPath = Directory(Platform.script.toFilePath()).parent.path;
  final fileName = '$directoryPath/icon.ico';

  File file = await saveFile(downloadBytes, fileName);
  print('${file.path} 파일이 저장되었습니다.');
}

Future<Uint8List> downloadImage(String url) async {
  http.Response response = await http.get(Uri.parse(url));
  return response.bodyBytes;
}

Future<File> saveFile(Uint8List bytes, String fileName) async {
  final file = File(fileName);
  return await file.writeAsBytes(bytes);
}