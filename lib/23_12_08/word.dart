class Word {
  String word = '';

  bool isVowel(int i) {
    bool isVowel;
    switch (word.substring(i, i + 1).toLowerCase()) {
      case 'a':
      case 'e':
      case 'i':
      case 'o':
      case 'u':
        isVowel = true;
        break;
      default:
        isVowel = false;
    }
    return isVowel;
  }

  bool isConsonant(int i) {
    // 방법 1
    return !isVowel(i);

    // 방법 2
    /*bool isConsonant;
    switch (word.substring(i, i + 1).toLowerCase()) {
      case 'a':
      case 'e':
      case 'i':
      case 'o':
      case 'u':
        isConsonant = false;
        break;
      default:
        isConsonant = true;
    }
    return isConsonant;*/
  }
}

void main() {
  final word = Word();
  word.word = 'Flutter';

  for (int i = 0; i < word.word.length; i++) {
    print('${word.word[i]} : 모음(${word.isVowel(i) ? 'O' : 'X'}) / 자음(${word.isConsonant(i) ? 'O' : 'X'})');
  }
}
