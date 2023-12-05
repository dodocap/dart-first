import 'hero.dart';
import 'slime.dart';

class PoisonSlime extends Slime {
  int _poisonCount = 5;

  PoisonSlime(super.suffix);

  @override
  void attack(Hero hero) {
    super.attack(hero);

    if (_poisonCount > 0) {
      print('추가로, 독 포자를 살포했다!');

      int additionalDamage = hero.hp ~/ 5;
      print('$additionalDamage포인트의 데미지');
      _poisonCount--;

      hero.hp -= additionalDamage;
    }
  }
}