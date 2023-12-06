import '../interfaces.dart';
import 'terran.dart';

class SCV extends Unit implements Terran, Bionic, Mechanic {
  int damage;

  SCV({
    required super.name,
    required super.hp,
    required this.damage,
  });

  @override
  void attack(Unit target) {
    print('$name의 용접기 공격');
    target.hp -= damage;
  }

  @override
  void move() {
    // TODO: implement move
  }

  void repair(Unit target) {
    if(target is Mechanic) {
      print('$name의 수리중');
      target.hp += 3;
    }
  }

  void getResource() {
    print('$name의 자원 채취중..');
  }
}
