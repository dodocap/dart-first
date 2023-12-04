import 'person.dart';

void main() {
  final personList = [Person('홍길동'), Person('한석봉')];

  for (final person in personList) {
    print(person.name);
  }
}
