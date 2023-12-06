import '../interfaces.dart';
import 'protoss.dart';

class Nexus extends ProtossStructure {
  Nexus({
    required super.name,
    required super.hp,
    required super.shield,
  });

  void constructProbe() {
    print('$name의 프로프 생산');
  }
}
