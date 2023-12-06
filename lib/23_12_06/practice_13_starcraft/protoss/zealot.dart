import '../interfaces.dart';
import 'protoss.dart';

class Zealot extends ProtossBionicUnit implements Attackable, Movable {
  int damage;

  Zealot({
    required super.name,
    required super.hp,
    required super.shield,
    required this.damage,
  });

  @override
  void attack(Unit target) {
    print('$name의 광선검 공격');
    target.hp -= damage;
  }

  @override
  void move() {
    print('$name의 이동');
  }
}
