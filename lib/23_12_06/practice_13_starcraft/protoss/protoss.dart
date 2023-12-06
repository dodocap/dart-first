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

abstract class ProtossBionicUnit extends ProtossUnit implements Bionic {
  ProtossBionicUnit({
    required super.name,
    required super.hp,
    required super.shield,
  });
}

abstract class ProtossMechinicUnit extends ProtossUnit implements Mechanic {
  ProtossMechinicUnit({
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