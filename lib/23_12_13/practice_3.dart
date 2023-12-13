Future<void> main() async {
  String result = await timeoutFuture().timeout(Duration(seconds: 5), onTimeout: () => 'timeout');
  print(result);
}

Future<String> timeoutFuture() async {
  await Future.delayed(Duration(seconds: 6));
  return 'ok';
}