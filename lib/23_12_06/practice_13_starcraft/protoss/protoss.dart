import '../interfaces.dart';

abstract interface class Protoss implements Race {
  void recoveryShield();
}

abstract class ProtossUnit extends Unit implements Protoss {
  int shield;

  ProtossUnit({
    required super.name,
    required super.hp,
    required this.shield,
  });

  @override
  void recoveryShield() {
    shield += 1;
  }
}

abstract class ProtossBionicUnit extends ProtossUnit implements Bionic, GroupAvailable {
  ProtossBionicUnit({
    required super.name,
    required super.hp,
    required super.shield,
  });
}

abstract class ProtossMechanicUnit extends ProtossUnit implements Mechanic, GroupAvailable {
  ProtossMechanicUnit({
    required super.name,
    required super.hp,
    required super.shield,
  });
}

abstract class ProtossStructure extends ProtossUnit {
  ProtossStructure({
    required super.name,
    required super.hp,
    required super.shield,
  });
}