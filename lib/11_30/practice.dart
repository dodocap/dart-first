class Cleric {
  String name;
  final maxHp = 50;
  final maxMp = 10;
  int hp = 50;
  int mp = 10;

  Cleric(this.name);

  selfAid() {
    if(mp < 5) {
      print('셀프 에이드를 사용하려면 mp가 5 이상이어야 합니다');
      return;
    }
    mp -= 5;
    hp = maxHp;
    print('셀프 에이드 시전 HP : $hp MP : $mp');
  }
}