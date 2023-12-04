class Wand {
  String _name;
  double _power;

  Wand({
    required name,
    required power,
  })  : _name = name,
        _power = power {
    _validateName(_name);
    _validatePower(_power);
  }

  set name(String name) {
    _validateName(name);
    _name = name;
  }

  set power(double power) {
    _validatePower(power);
    _power = power;
  }

  void _validateName(String name) {
    if (name.length < 3) {
      throw Exception('지팡이 이름은 3글자 이상이어야 합니다');
    }
  }

  void _validatePower(double power) {
    if (power < 0.5) {
      throw Exception('지팡이 마력은 0.5 이상이어야 합니다(설정 값: $power)');
    }
    if (power > 100.0) {
      throw Exception('지팡이 마력은 100 이하여야 합니다(설정 값: $power)');
    }
  }
}
