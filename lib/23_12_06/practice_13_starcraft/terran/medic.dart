import '../interfaces.dart';
import 'terran.dart';

class Medic extends TerranBionicUnit implements Movable {
  Medic({
    required super.name,
    required super.hp,
  });

  void heal(Unit target) {
    if(target is Bionic) {
      print('$name의 치료');
      target.hp += 5;
    }
  }

  @override
  void move() {
    print('$name의 이동');
  }
}
