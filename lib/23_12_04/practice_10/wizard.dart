import 'wand.dart';

class Wizard {
  String _name;
  int _hp;
  int _mp;
  Wand _wand;

  Wizard({
    required name,
    required hp,
    required mp,
    required wand,
  })  : _name = name,
        _hp = hp,
        _mp = mp,
        _wand = wand {
    _validateName(name);
    _validateHp(hp);
    _validateMp(mp);
  }

  String get name => _name;

  set name(String name) {
    _validateName(name);
    _name = name;
  }

  int get hp => _hp;

  set hp(int hp) {
    _validateHp(hp);
    _hp = hp;
  }

  int get mp => _mp;

  set mp(int mp) {
    _validateMp(mp);
    _mp = mp;
  }

  Wand get wand => _wand;

  set wand(Wand wand) {
    _wand = wand;
  }

  void _validateName(String name) {
    if (name.length < 3) {
      throw Exception('마법사 이름은 3글자 이상이어야 합니다');
    }
  }

  void _validateHp(int hp) {
    if (hp < 0) {
      _hp = 0;
    }
  }

  void _validateMp(int mp) {
    if (mp < 0) {
      throw Exception('마법사의 MP는 0 이상이어야 합니다');
    }
  }
}
