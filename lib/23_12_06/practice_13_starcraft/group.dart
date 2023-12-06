import 'interfaces.dart';

class Group {
  final List<GroupAvailable> _groupList = [];

  void clickUnit(GroupAvailable unit) {
    _printGroupState();

    if (_groupList.contains(unit)) {
      _groupList.remove(unit);
      print('[삭제] [${unit.name}(${unit.hp})]');
    } else {
      if (_groupList.length < 12) {
        _groupList.add(unit);
        print('[추가] [${unit.name}(${unit.hp})]');
      } else {
        print('[실패] [${unit.name}(${unit.hp})]');
      }
    }

    _printGroupState();
    print('--------------------------------------------------------------');
  }

  void _printGroupState() {
    final buffer = StringBuffer();
    for (final unit in _groupList) {
      buffer.write('[${unit.name}(${unit.hp})] ');
    }
    print('인원(${_groupList.length}) - $buffer');
  }
}
