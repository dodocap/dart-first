import '../interfaces.dart';

abstract interface class Terran implements Race {}

abstract class TerranBionicUnit extends Unit implements Terran, Bionic {
  TerranBionicUnit({
    required super.name,
    required super.hp,
  });
}

abstract class TerranMechanicUnit extends Unit implements Terran, Mechanic {
  TerranMechanicUnit({
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
