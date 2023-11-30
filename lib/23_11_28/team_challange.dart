class Player {
  String name;
  int clapCount = 0;
  Player? nextPlayer;

  Player(this.name);

  void setNextPlayer(Player nextPlayer) {
    this.nextPlayer = nextPlayer;
  }

  Player? getNextPlayer() {
    return nextPlayer;
  }
}

void main() {
  List<Player> players = [
    Player('Player1'),
    Player('Player2'),
    Player('Player3'),
    Player('Player4')
  ];

  for (int i = 0; i < players.length; i++) {
    if (i == players.length - 1) {
      players[i].nextPlayer = players[0];
    } else {
      players[i].nextPlayer = players[i + 1];
    }
  }

  int clapCount = 0;
  int roolCount = 0;
  int ahhCount = 0;
  Player? currentPlayer = players[0];

  for (int i = 1; i <= 100; i++) {
    if (i % 30 == 0) {
      print('${currentPlayer?.name} : ahh');
      ahhCount++;
    } else if (i % 10 == 0) {
      print('${currentPlayer?.name} : rool');
      roolCount++;
    } else if (i % 3 == 0) {
      print('${currentPlayer?.name} : clap');
      currentPlayer?.clapCount++;
      clapCount++;
    } else {
      print('${currentPlayer?.name} : $i');
    }
    currentPlayer = currentPlayer?.nextPlayer;
  }

  print('clap의 총 갯수 : $clapCount');
  print('rool의 총 갯수 : $roolCount');
  print('ahh의 총 갯수 : $ahhCount');
  Player mostClapCountPlayer = players[0];
  for (int i = 0; i < players.length; i++) {
    print('${players[i].name} : ${players[i].clapCount}');
    if (mostClapCountPlayer.clapCount < players[i].clapCount) {
      mostClapCountPlayer = players[i];
    }
  }
  print('\n가장 많은 clap을 출력한 플레이어: ${mostClapCountPlayer.name}');
}
