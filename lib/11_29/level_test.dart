class Question1 {
  checkPalindrome(String word) {
    if(word.isEmpty) {
      print('빈 문자열은 올 수 없습니다');
      return;
    }

    int half = word.length ~/ 2;

    for(int i = 0, wordLength = word.length; i < half; i++, wordLength--) {
      if(word[i] != word[wordLength - 1]) {
        print('"$word"는 회문이 아닙니다');
        return;
      }
    }

    print('"$word"는 회문입니다');
  }
}

class Question2 {
  max2ValuesOfSum(List<int> list) {
    if(list.length <= 2) {
      print('배열의 갯수는 최소 2개 이상이어야 합니다');
      return;
    }
    list.sort();
    int value1 = list[list.length-1];
    int value2 = list[list.length-2];
    print('$value1 + $value2 = ${value1 + value2}');
  }
}

class Question3 {
  calculateFactorial(int num) {
    int calculateValue = _calcFactorial(num);
    print('$num! = $calculateValue');
  }

  int _calcFactorial(int num) {
    if(num > 1) {
      return _calcFactorial(num - 1) * num;
    } else {
      return 1;
    }
  }
}

void main() {
  Question1 question1 = Question1();
  question1.checkPalindrome('hello');
  question1.checkPalindrome('racecar');
  question1.checkPalindrome('');

  print('--------------------------------------');

  Question2 question2 = Question2();
  question2.max2ValuesOfSum([1, 2, 5, 3, 9, 8]);
  question2.max2ValuesOfSum([1, 11, 5, 3, 9, 8]);
  question2.max2ValuesOfSum([-5, -2, 10, 3, -7, 8]);
  question2.max2ValuesOfSum([18, 10, 5, 7, 12]);
  question2.max2ValuesOfSum([18,]);

  print('--------------------------------------');

  Question3 question3 = Question3();
  question3.calculateFactorial(0);
  question3.calculateFactorial(1);
  question3.calculateFactorial(2);
  question3.calculateFactorial(3);
  question3.calculateFactorial(4);
  question3.calculateFactorial(5);

  question3._calcFactorial(3);
}