import '../interfaces.dart';
import 'terran.dart';

class Vulture extends TerranMechanicUnit implements Attackable, Movable {
  int damage;
  int _remainOfMines = 3;

  Vulture({
    required super.name,
    required super.hp,
    required this.damage,
  });

  @override
  void attack(Unit target) {
    print('$name의 수류탄 공격');
    target.hp -= damage;
  }

  @override
  void move() {
    print('$name의 이동');
  }

  void deploySpiderMine() {
    if(_remainOfMines > 0) {
      print('$name의 마인 설치');
      _remainOfMines--;
    }
  }
}
