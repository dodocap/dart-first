import '../interfaces.dart';
import 'protoss.dart';

class Nexus extends ProtossUnit implements Bionic, Movable {
  Nexus({
    required super.name,
    required super.hp,
    required super.shield,
  });

  @override
  void attack(Unit target) {
    // TODO: implement attack
  }

  @override
  void move() {
    // TODO: implement move
  }

  @override
  void autoRechargeShield() {
    // TODO: implement autoRechargeShield
  }
}
