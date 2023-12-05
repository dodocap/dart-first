import 'slime.dart';

class Hero {
  String name;
  int _hp;

  Hero({
    required this.name,
    required int hp,
  }) : _hp = hp;

  int get hp => _hp;

  set hp(int value) {
    if (value < 0) {
      throw Exception('hp는 0보다 작을 수 없다');
    }
    _hp = value;
    print('$name의 남은 체력 : $hp');
  }

  void attack(Slime slime) {
    slime.hp -= 10;
    print('10의 데미지!!!');
  }

  void run() {
    print('뛰었다');
  }
}
