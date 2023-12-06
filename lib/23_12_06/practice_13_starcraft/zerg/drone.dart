import '../interfaces.dart';
import 'zerg.dart';

class Drone extends ZergUnit implements Attackable, Movable {
  int damage;
  Drone({
    required super.name,
    required super.hp,
    required this.damage,
  });

  @override
  void attack(Unit target) {
    print('$name의 침뱉기 공격');
    target.hp -= damage;
  }

  @override
  void move() {
    print('$name의 이동');
  }
}