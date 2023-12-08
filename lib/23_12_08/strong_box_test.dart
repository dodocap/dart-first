import 'strong_box.dart';

void main() {
  final padlockBox = StrongBox<String>(keyType: KeyType.padlock);
  padlockBox.put('십만원');
  for (int i = 0; i < padlockBox.keyType.unlockCount + 1; i++) {
    String? item = padlockBox.get();
    if (item != null) {
      print('${i + 1}번째 : $item');
    }
  }
  print('----------------------------------------------------');

  final buttonBox = StrongBox<String>(keyType: KeyType.button);
  buttonBox.put('백만원');
  for (int i = 0; i < buttonBox.keyType.unlockCount + 1; i++) {
    String? item = buttonBox.get();
    if (item != null) {
      print('${i + 1}번째 : $item');
    }
  }
  print('----------------------------------------------------');

  final dialBox = StrongBox<String>(keyType: KeyType.dial);
  dialBox.put('천만원');
  for (int i = 0; i < dialBox.keyType.unlockCount + 1; i++) {
    String? item = dialBox.get();
    if (item != null) {
      print('${i + 1}번째 : $item');
    }
  }
  print('----------------------------------------------------');

  final fingerBox = StrongBox<String>(keyType: KeyType.finger);
  fingerBox.put('십억');

  for (int i = 0; i < fingerBox.keyType.unlockCount + 1; i++) {
    String? item = fingerBox.get();
    if (item != null) {
      print('${i + 1}번째 : $item');
    }
  }
}
