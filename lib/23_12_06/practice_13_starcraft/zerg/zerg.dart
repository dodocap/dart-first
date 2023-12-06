import '../interfaces.dart';

abstract interface class Zerg implements Race {
  void autoHeal();
}

abstract class ZergUnit extends Unit implements Zerg, Bionic, Movable {
  ZergUnit({
    required super.name,
    required super.hp,
  });
}

abstract class ZergStructure extends Unit implements Zerg {
  ZergStructure({
    required super.name,
    required super.hp,
  });
}
