import '../interfaces.dart';
import 'terran.dart';

class Vulture extends TerranUnit implements Mechanic, Attackable {
  int _damage;
  Vulture({
    required super.name,
    required super.hp,
    required int damage,
  }) : _damage = damage;

  void deploySpiderMine() {
    // TODO
  }

  @override
  void attack(Unit target) {
    print('$name의 수류탄 공격');
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
