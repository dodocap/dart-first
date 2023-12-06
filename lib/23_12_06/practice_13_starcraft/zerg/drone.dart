import '../interfaces.dart';
import 'zerg.dart';

class Drone extends ZergUnit implements Attackable {
  int _damage;
  Drone({
    required super.name,
    required super.hp,
    required int damage,
  }) : _damage = damage;

  @override
  void attack(Unit target) {
    print('$name의 침뱉기 공격');
    target.hp -= _damage;
  }

  @override
  void move() {
    // TODO: implement move
  }

  @override
  void autoHeal() {
    // TODO: implement autoHeal
  }

  @override
  int get damage => _damage;

  @override
  set damage(int damage) {
    _damage = damage;
  }
}