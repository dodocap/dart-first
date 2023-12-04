class Wand {
  String _name;
  double _power;

  Wand({
    required name,
    required power,
  })  : _name = name,
        _power = power {
    if (_name.length < 3) {
      throw Exception('지팡이 이름은 3글자 이상이어야 합니다');
    }
    if (_power < 0.5 || power > 100.0) {
      throw Exception('지팡이 마력은 0.5 이상이거나 100 이하여야 합니다(설정 값: $power)');
    }
  }
}
