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
    if (_name.length < 3) {
      throw Exception('마법사 이름은 3글자 이상이어야 합니다');
    }
    if (_hp < 0) {
      throw Exception('마법사의 HP는 0 이상이어야 합니다');
    }
    if (_mp < 0) {
      throw Exception('마법사의 MP는 0 이상이어야 합니다');
    }
  }

  void damage(int damage) {
    _hp -= damage;
    if (_hp < 0) {
      _hp = 0;
    }
    print('마법사 $_name은(는) $damage만큼 피해를 입었다.(남은 체력: $_hp)');
  }
}
