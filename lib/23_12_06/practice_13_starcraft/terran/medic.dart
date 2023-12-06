import '../interfaces.dart';
import 'terran.dart';

class Medic extends TerranBionicUnit implements Movable {
  Medic({
    required super.name,
    required super.hp,
  });

  void heal(Unit target) {
    if (target is Bionic) {
      print('$name의 치료');
      target.hp += 5;
    } else {
      print('$name은 생물만 치료 가능합니다');
    }
  }

  @override
  void move() {
    print('$name의 이동');
  }
}
