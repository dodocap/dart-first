import 'package:test/test.dart';
import 'package:untitled/23_12_18/practice_2_to_4.dart';

void main() {
  test('연습문제2_짝수 판별 테스트', () {
    // given
    final int odd = 3;
    final int even = 2;

    // when
    final bool expectOdd = isEven(odd);
    final bool expectEven = isEven(even);

    // then
    expect(expectOdd, false);
    expect(expectEven, true);
  });

  test('연습문제3_최댓값 찾기 함수 테스트', () {
    // given
    final List<int> list = [2, 5, 1, 9, 3];

    // when
    final int expectValue = findMax(list);

    // then
    expect(expectValue, 9);
  });

  test('연습문제4_문자열 뒤집기 테스트', () {
    // given
    final String helloString = 'Hello';

    // when
    final expectString = reverseString(helloString);

    // then
    expect(expectString, 'olleH');
  });
}