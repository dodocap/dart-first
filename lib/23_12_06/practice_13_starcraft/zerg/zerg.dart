import '../interfaces.dart';

abstract interface class Zerg implements Race {
  void recoveryHp();
}

abstract class ZergUnit extends Unit implements Zerg, Bionic {
  ZergUnit({
    required super.name,
    required super.hp,
  });
  @override
  void recoveryHp() {
    hp += 1;
  }
}

abstract class ZergStructure extends Unit implements Zerg {
  ZergStructure({
    required super.name,
    required super.hp,
  });
  @override
  void recoveryHp() {
    hp += 2;
  }
}
