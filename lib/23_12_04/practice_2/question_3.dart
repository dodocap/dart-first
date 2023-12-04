import 'person.dart';

void main() {
  final personMap = {
    Person('홍길동'): 20,
    Person('한석봉'): 25,
  };

  for (final element in personMap.entries) {
    print('${element.key.name}의 나이는 ${element.value}살');
  }
}
