import 'dart:math';

import '../interfaces.dart';
import 'zerg.dart';

class Hatchery extends ZergStructure {
  Hatchery({
    required super.name,
    required super.hp,
  });

  void constructUnit(Unit target, int number) {
    int numOfConstruct = Random().nextInt(3) + 1;
    print('$name는 ${target.name}를 $numOfConstruct마리 생산하였다');
  }
}
