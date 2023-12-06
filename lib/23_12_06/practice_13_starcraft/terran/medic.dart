import '../interfaces.dart';
import 'terran.dart';

class Medic extends TerranUnit implements Bionic {
  Medic({
    required super.name,
    required super.hp,
  });

  void heal(Bionic target) {
    // TODO
  }

  @override
  void move() {
    // TODO: implement move
  }
}
