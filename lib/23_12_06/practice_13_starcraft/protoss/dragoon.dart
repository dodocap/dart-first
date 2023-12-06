import '../interfaces.dart';
import 'protoss.dart';

class Dragoon extends ProtossMechinicUnit implements Attackable, Movable {
  int damage;

  Dragoon({
    required super.name,
    required super.hp,
    required super.shield,
    required this.damage,
  });

  @override
  void attack(Unit target) {
    print('$name의 에너지볼 공격');
    target.hp -= damage;
  }

  @override
  void move() {
    print('$name의 이동');
  }
}
