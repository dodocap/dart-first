import '../interfaces.dart';
import 'protoss.dart';

class Zealot extends ProtossUnit implements Bionic, Attackable {
  int _damage;
  Zealot({
    required super.name,
    required super.hp,
    required super.shield,
    required int damage,
  }) : _damage = damage;

  @override
  void attack(Unit target) {
    print('$name의 광선검 공격');
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
