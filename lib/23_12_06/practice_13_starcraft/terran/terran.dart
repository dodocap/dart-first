import '../interfaces.dart';

abstract interface class Terran implements Race {}

abstract class TerranBionicUnit extends Unit implements Terran, Bionic, GroupAvailable {
  TerranBionicUnit({
    required super.name,
    required super.hp,
  });
}

abstract class TerranMechanicUnit extends Unit implements Terran, Mechanic, GroupAvailable {
  TerranMechanicUnit({
    required super.name,
    required super.hp,
  });
}

abstract class TerranHybridUnit extends Unit implements Terran, Bionic, Mechanic, GroupAvailable {
  TerranHybridUnit({
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
