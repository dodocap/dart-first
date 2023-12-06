import '../interfaces.dart';
import 'terran.dart';

class Tank extends TerranUnit implements Mechanic, Attackable {
  int _damage;
  Tank({
    required super.name,
    required super.hp,
    required int damage,
  }) : _damage = damage;

  @override
  void attack(Unit target) {
    print('$name의 퉁퉁포 공격');
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
