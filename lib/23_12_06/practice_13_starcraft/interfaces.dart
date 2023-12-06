abstract class Unit {
  String name;
  int hp;

  Unit({
    required this.name,
    required this.hp,
  });
}

abstract interface class Race {}

abstract interface class Bionic {}

abstract interface class Mechanic {}

abstract interface class Movable {
  void move();
}

abstract interface class Attackable {
  void attack(Unit target);
}
