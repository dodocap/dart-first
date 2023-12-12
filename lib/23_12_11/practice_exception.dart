void main() {
  final numString = '10.5';

  print(solution1(numString));
  print(solution2(numString));
}

int solution1(String numString) {
  int num;
  try {
    num = int.parse(numString);
  } catch (e) {
    num = 0;
  }

  return num;
}

int solution2(String numString) {
  // 지식이 늘었다
  return int.tryParse(numString) ?? 0;
}
