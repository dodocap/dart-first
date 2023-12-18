import 'dart:math';

bool isEven(int number) => number % 2 == 0;

int findMax(List<int> list) => list.reduce((v1, v2) => max(v1, v2));

String reverseString(String string) {
  return string.split('').reversed.join('');
}
