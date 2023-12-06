import '../interfaces.dart';
import 'terran.dart';

class SCV extends TerranUnit implements Bionic, Mechanic, Attackable {
  int _damage;

  SCV({
    required super.name,
    required super.hp,
    required int damage,
  }) : _damage = damage;

  @override
  void attack(Unit target) {
    print('$name의 용접기 공격');
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
