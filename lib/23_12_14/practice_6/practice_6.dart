import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:typed_data';

Future<void> main() async {
  final Uint8List downloadBytes = await downloadImage('https://blimipro.com/favicon.ico').catchError((bytes) {
    print('서버 접속에 실패하여 기본 이미지를 불러와 저장합니다.');
    return bytes;
  });

  final directoryPath = Directory(Platform.script.toFilePath()).parent.path;
  final fileName = '$directoryPath/icon.ico';

  final File file = await saveFile(downloadBytes, fileName);
  print('${file.path} 파일이 저장되었습니다.');
}

Future<Uint8List> downloadImage(String url) async {
  Uint8List imageBytes;
  try {
    http.Response response = await http.post(Uri.parse(url));
    imageBytes = response.bodyBytes;
  } catch (e) {
    final placeHolderImage = File('${Directory(Platform.script.toFilePath()).parent.path}/favicon.ico');
    imageBytes = await placeHolderImage.readAsBytes();
    return Future.error(imageBytes);
  }
  return imageBytes;
}

Future<File> saveFile(Uint8List bytes, String fileName) async {
  final file = File(fileName);
  return await file.writeAsBytes(bytes);
}
