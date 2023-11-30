import 'dart:math';

class Cleric {
  String name;
  final maxHp = 50;
  final maxMp = 10;
  int hp = 50;
  int mp = 10;

  Cleric(this.name);

  selfAid() {
    if(mp < 5) {
      print('$name은 mp가 모자라 셀프 에이드를 시전하는데 실패했다');
      return;
    }
    mp -= 5;
    hp = maxHp;
    print('$name의 셀프 에이드 시전 HP : $hp MP : $mp');
  }

  int pray(int time) {
    int currentMp = mp;
    int recovery = Random().nextInt(3);
    mp += (time + recovery);
    if(mp > maxMp) {
      mp = maxMp;
    }
    print('$name은 $time초동안 기도하여 MP가 ${mp - currentMp}만큼 회복, 현재 mp는 $mp입니다.');
    return mp - currentMp;
  }
}