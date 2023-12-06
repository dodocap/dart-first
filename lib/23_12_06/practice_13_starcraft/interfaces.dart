abstract class Unit {
  String _name;
  int _hp;

  Unit({
    required String name,
    required int hp,
  })  : _name = name,
        _hp = hp;

  int get hp => _hp;

  set hp(int value) {
    _hp = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}

abstract interface class Race {}

abstract interface class Bionic {}

abstract interface class Mechanic {}

abstract interface class Movable {
  void move();
}

abstract interface class Attackable {
  void attack(Unit target);

  set damage(int damage);

  int get damage;
}
