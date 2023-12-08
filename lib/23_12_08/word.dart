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
}

void main() {
  final word = Word();
  word.word = 'flutter';

  for (int i = 0; i < word.word.length; i++) {
    print('${word.word[i]} : 모음(${word.isVowel(i) ? 'O' : 'X'})');
  }
}
