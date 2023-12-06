import '../interfaces.dart';

abstract interface class Protoss implements Race {
  void autoRechargeShield();
}

abstract class ProtossUnit extends Unit implements Protoss, Movable {
  int _shield;

  ProtossUnit({
    required super.name,
    required super.hp,
    required int shield,
  }) : _shield = shield;
}

abstract class ProtossStructure extends Unit implements Protoss {
  int _shield;

  ProtossStructure({
    required super.name,
    required super.hp,
    required int shield,
  }) : _shield = shield;
}