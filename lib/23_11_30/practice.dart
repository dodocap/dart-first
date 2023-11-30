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

  int pray(int restTime) {
    int currentMp = mp;
    int bonusPoint = Random().nextInt(3);
    mp += (restTime + bonusPoint);
    if(mp > maxMp) {
      mp = maxMp;
    }
    print('$name은 $restTime초동안 기도하여 MP가 ${mp - currentMp}만큼 회복, 현재 mp는 $mp입니다.');
    return mp - currentMp;
  }
}
void main() {
  final cleric = Cleric('김수영');
  cleric.selfAid();
  cleric.selfAid();
  cleric.selfAid();

  cleric.pray(3);
  cleric.pray(3);
  cleric.pray(3);
}