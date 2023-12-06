import '../interfaces.dart';
import 'terran.dart';

class Marine extends TerranBionicUnit implements Attackable, Movable {
  int damage;
  Marine({
    required super.name,
    required super.hp,
    required this.damage,
  });

  @override
  void attack(Unit target) {
    print('$name의 라이플 공격');
    target.hp -= damage;
  }

  @override
  void move() {
    print('$name의 이동');
  }
}
