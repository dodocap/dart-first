import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:typed_data';

Future<void> main() async {
  final directoryPath = Directory(Platform.script.toFilePath()).parent.path;
  final imageUrls = [
    'https://unsplash.com/photos/r4ZSR0cKJw8/download?ixid=M3wxMjA3fDF8MXxhbGx8MXx8fHx8fDJ8fDE3MDI1NDA4MjJ8&force=true',
    'https://unsplash.com/photos/JZerhwPHiBI/download?ixid=M3wxMjA3fDF8MXxhbGx8MTF8fHx8fHwyfHwxNzAyNTQwODIyfA&force=true',
    'https://unsplash.com/photos/xXqWVUvf_Gw/download?ixid=M3wxMjA3fDF8MXxhbGx8NzF8fHx8fHwyfHwxNzAyNTM3MjU5fA&force=true'
  ];

  await sequentialDownload(imageUrls, directoryPath);
  print('-----------------------------------------------');
  await parallelDownload(imageUrls, directoryPath);
}

Future<void> sequentialDownload(List<String> imageUrls, String directoryPath) async {
  print('[순차] 다운로드 시작');
  final Stopwatch stopwatch = Stopwatch()..start();

  final List<Uint8List> downloadByteList = [
    await downloadImage(imageUrls[0]),
    await downloadImage(imageUrls[1]),
    await downloadImage(imageUrls[2]),
  ];

  for(int i = 0; i < downloadByteList.length; i++) {
    final File file = await saveFile(downloadByteList[i], '$directoryPath/SequentialImage$i.png');
    print('[순차] 용량 : ${await file.length()}bytes');
  }

  print('[순차] 다운로드 끝');
  print('[순차] ==============================================');
  print('[순차] 총 소요시간 : ${stopwatch.elapsed}');
}

Future<void> parallelDownload(List<String> imageUrls, String directoryPath) async {
  print('[병렬] 다운로드 시작');
  Stopwatch stopwatch = Stopwatch()..start();

  List<Future<Uint8List>> futureJobList = List.generate(imageUrls.length, (i) => downloadImage(imageUrls[i]));
  List<Uint8List> bytesList = await futureJobList.wait;

  List<Future<File>> futureFileList = List.generate(bytesList.length, (i) => saveFile(bytesList[i], '$directoryPath/ParallelImage${i + 1}.png'));
  List<File> fileList = await futureFileList.wait;

  List<Future<int>> futureFileSizeList = List.generate(fileList.length, (i) => fileList[i].length());
  List<int> fileSizeList = await futureFileSizeList.wait;

  for (final fileSize in fileSizeList) {
    print('[병렬] 용량 : ${fileSize}bytes');
  }
  print('[병렬] 다운로드 끝');
  print('[병렬] =========');
  print('[병렬] 총 소요시간 : ${stopwatch.elapsed}');
}

Future<Uint8List> downloadImage(String url) async {
  http.Response response = await http.get(Uri.parse(url));
  return response.bodyBytes;
}

Future<File> saveFile(Uint8List bytes, String fileName) async {
  final file = File(fileName).writeAsBytes(bytes);
  return file;
}
