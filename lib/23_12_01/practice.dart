import 'dart:math';

class Cleric {
  static const int maxHp = 50;
  static const int maxMp = 10;

  String name;
  int hp = maxHp;
  int mp = maxMp;

  Cleric(
    this.name, {
    this.hp = maxHp,
    this.mp = maxMp,
  });

  selfAid() {
    if (mp < 5) {
      print('$name은(는) mp가 모자라 셀프 에이드를 시전하는데 실패했다');
      return;
    }
    mp -= 5;
    hp = maxHp;
    print('$name의 셀프 에이드 시전 HP : $hp MP : $mp');
  }

  int pray(int restTime) {
    if (restTime < 1) {
      print('$name은(는) 기도시간이 너무 짧아 기도를 할 수 없었다');
      return 0;
    }

    int currentMp = mp;
    int bonusPoint = Random().nextInt(3);
    mp += (restTime + bonusPoint);
    if (mp > maxMp) {
      mp = maxMp;
    }
    print('$name은(는) $restTime초동안 기도하여 MP가 ${mp - currentMp}만큼 회복, 현재 mp는 $mp입니다.');
    return mp - currentMp;
  }
}

void main() {
  final arthas1 = Cleric('아서스', hp: 40, mp: 5);
  final arthas2 = Cleric('아서스', hp: 35);
  final arthas3 = Cleric('아서스');
  // Error
  // final arthas4 = Cleric();

  arthas1.selfAid();
  arthas1.selfAid();
  arthas1.pray(0);
  arthas1.pray(3);
  arthas1.pray(3);
  arthas1.pray(3);
  arthas1.pray(1);
}
