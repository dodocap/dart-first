class StrongBox<E> {
  E? _item;
  KeyType _keyType;
  int _keyCount;

  StrongBox({
    required KeyType keyType,
  })  : _keyType = keyType,
        _keyCount = keyType.unlockCount {
    print('${_keyType.name} 타입 금고가 생성되었습니다');
  }

  KeyType get keyType => _keyType;

  void put(E item) {
    print('${_keyType.name} 타입 금고에 물건을 넣었습니다');
    _item = item;
  }

  E? get() {
    if (_keyCount > 0) {
      _keyCount--;
      return null;
    }
    print('${_keyType.name} 타입 금고에서 물건을 꺼냈습니다');
    return _item;
  }
}

enum KeyType {
  padlock,
  button,
  dial,
  finger;

  String get name {
    switch (this) {
      case KeyType.padlock:
        return '자물쇠';
      case KeyType.button:
        return '버튼';
      case KeyType.dial:
        return '다이얼';
      case KeyType.finger:
        return '지문';
    }
  }

  int get unlockCount {
    switch (this) {
      case KeyType.padlock:
        return 1024;
      case KeyType.button:
        return 10000;
      case KeyType.dial:
        return 30000;
      case KeyType.finger:
        return 1000000;
    }
  }
}
