import '../interfaces.dart';
import 'protoss.dart';

class Dragoon extends ProtossUnit implements Mechanic, Attackable {
  int _damage;
  Dragoon({
    required super.name,
    required super.hp,
    required super.shield,
    required int damage,
  }) : _damage = damage;

  @override
  void attack(Unit target) {
    print('$name의 에너지볼 공격');
    target.hp -= damage;
  }

  @override
  void move() {
    // TODO: implement move
  }

  @override
  void autoRechargeShield() {
    // TODO: implement autoRechargeShield
  }

  @override
  int get damage => _damage;

  @override
  set damage(int damage) {
    _damage = damage;
  }
}
