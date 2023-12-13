import 'dart:io';

Future<void> main() async {
  final directoryPath = Directory(Platform.script.toFilePath()).parent.path;

  final source = '$directoryPath/sample.csv';
  final target = '$directoryPath/sample_copy.csv';

  String result = await copyAsync(source, target);
  print(result);
}

Future<String> copyAsync(String source, String target) async {
  final sourceFile = File(source);
  final targetFile = File(target);
  try {
    final readString = await sourceFile.readAsString();
    await targetFile.writeAsString(readString.replaceAll('한석봉', '김석봉'));
    return '$source 파일을 $target에 성공적으로 복사했습니다';
  } catch (e) {
    return '파일 복사 도중 오류가 발생했습니다 : $e';
  }
}