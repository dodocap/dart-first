import '../interfaces.dart';

abstract interface class Terran implements Race {}

abstract class TerranUnit extends Unit implements Terran, Movable {
  TerranUnit({
    required super.name,
    required super.hp,
  });
}

abstract class TerranStructure extends Unit implements Terran {
  TerranStructure({
    required super.name,
    required super.hp,
  });
}
