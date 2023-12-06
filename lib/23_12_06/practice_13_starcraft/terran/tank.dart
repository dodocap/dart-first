import '../interfaces.dart';
import 'terran.dart';

class Tank extends TerranMechanicUnit implements Attackable, Movable {
  int damage;
  bool isSiege = false;

  Tank({
    required super.name,
    required super.hp,
    required this.damage,
  });

  @override
  void attack(Unit target) {
    if (isSiege) {
      print('$name의 시즈모드 공격');
      target.hp -= (damage * 3);
    } else {
      print('$name의 퉁퉁포 공격');
      target.hp -= damage;
    }
  }

  void changeSiegeMode() {
    isSiege = !isSiege;
    print(isSiege ? '시즈모드로 변경' : '시즈모드 해제');
  }

  @override
  void move() {
    if (isSiege) {
      print('$name의 이동을 하려면 시즈모드를 먼저 해제하세요');
    } else {
      print('$name의 이동');
    }
  }
}
