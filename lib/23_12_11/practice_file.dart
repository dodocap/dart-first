import 'dart:io';

void main() {
  final directoryPath = Directory(Platform.script.toFilePath()).parent.path;

  final source = '$directoryPath/source.txt';
  final target = '$directoryPath/target.txt';

  copy(source, target);
}

void copy(String source, String target) {
  final sourceFile = File(source);
  final targetFile = File(target);
  try {
    targetFile.writeAsStringSync(sourceFile.readAsStringSync());
    print('$source 파일을 $target에 성공적으로 복사했습니다');
  } catch(e) {
    print('파일 복사 도중 오류가 발생했습니다 : $e');
  }
}