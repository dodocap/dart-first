import '../interfaces.dart';
import 'terran.dart';

class Marine extends TerranUnit implements Bionic, Attackable {
  int _damage;
  Marine({
    required super.name,
    required super.hp,
    required int damage,
  }) : _damage = damage;

  @override
  void attack(Unit target) {
    print('$name의 라이플 공격');
    target.hp -= damage;
  }

  @override
  void move() {
    // TODO: implement move
  }

  @override
  int get damage => _damage;

  @override
  set damage(int damage) {
    _damage = damage;
  }
}
