import 'dart:math';

class Trader {
  String name;
  String city;

  Trader(this.name, this.city);

  @override
  String toString() {
    return '{이름: $name, 도시: $city}';
  }
}

class Transaction {
  Trader trader;
  int year;
  int value;

  Transaction(this.trader, this.year, this.value);

  @override
  String toString() {
    return '{트레이더: $trader, 연(년): $year, 값: $value} \n';
  }
}

final transactions = [
  Transaction(Trader("Brian", "Cambridge"), 2011, 300),
  Transaction(Trader("Raoul", "Cambridge"), 2012, 1000),
  Transaction(Trader("Raoul", "Cambridge"), 2011, 400),
  Transaction(Trader("Mario", "Milan"), 2012, 710),
  Transaction(Trader("Mario", "Milan"), 2012, 700),
  Transaction(Trader("Alan", "Cambridge"), 2012, 950),
];

void main() {
  final strBuffer = StringBuffer();

  strBuffer.write('[1. 2011년에 일어난 모든 트랜잭션을 찾아 가격 기준 오름차순으로 정리하여 이름을 나열하시오]\n');
  final listOfIn2011 = transactions.where((e) => e.year == 2011).toList();
  listOfIn2011.sort((a, b) => a.value.compareTo(b.value));
  listOfIn2011.forEach((e) { strBuffer.write('${e.trader.name}, '); });
  _printResultEnd(strBuffer);

  strBuffer.write('[2. 거래자가 근무하는 모든 도시를 중복 없이 나열하시오]\n');
  final allOfCities = transactions.map((e) => e.trader.city).toSet();
  allOfCities.forEach((e) => strBuffer.write('$e, '));
  _printResultEnd(strBuffer);

  strBuffer.write('[3. 케임브리지에서 근무하는 모든 거래자를 찾아서 이름순으로 정렬하여 나열하시오]\n');
  final traderNameOfCambridgeList = transactions.where((e) => e.trader.city == 'Cambridge').map((e) => e.trader.name).toSet().toList();
  traderNameOfCambridgeList.sort();
  traderNameOfCambridgeList.forEach((e) { strBuffer.write('$e, '); });
  _printResultEnd(strBuffer);

  strBuffer.write('[4. 모든 거래자의 이름을 알파벳순으로 정렬하여 나열하시오]\n');
  final allTraderNameList = transactions.map((e) => e.trader.name).toSet().toList();
  allTraderNameList.sort();
  allTraderNameList.forEach((e) => strBuffer.write('$e, '));
  _printResultEnd(strBuffer);

  strBuffer.write('[5. 밀라노에 거래자가 있는가?]\n');
  strBuffer.write(transactions.any((e) => e.trader.city == 'Milan') ? '예' : '아니오');
  _printResultEnd(strBuffer);

  strBuffer.write('[6. 케임브리지에 거주하는 거래자의 모든 트랙잭션값을 출력하시오]\n');
  final traderNameOfCambridgeList2 = transactions.where((e) => e.trader.city == 'Cambridge').toList();
  traderNameOfCambridgeList2.forEach((e) => strBuffer.write(e));
  _printResultEnd(strBuffer);

  strBuffer.write('[7. 전체 트랜잭션 중 최대값은 얼마인가?]\n');
  strBuffer.write(transactions.map((e) => e.value).reduce(max));
  // Collections Library에 더 짧게 줄일 수 있음
  // transactions.map((e) => e.value).max;
  _printResultEnd(strBuffer);

  strBuffer.write('[8. 전체 트랜잭션 중 최소값은 얼마인가?]\n');
  strBuffer.write(transactions.map((e) => e.value).reduce(min));
  // Collections Library에 더 짧게 줄일 수 있음
  // transactions.map((e) => e.value).min;
  _printResultEnd(strBuffer);
}

void _printResultEnd(StringBuffer strBuffer) {
  String result = strBuffer.toString();
  if(result.endsWith(', ') || result.endsWith('\n')) {
    result = result.substring(0, strBuffer.length - 2);
  }
  print(result);
  print('-----------------------------------------------------------------------');
  strBuffer.clear();
}
