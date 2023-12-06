abstract interface class X {
  void a();
}

abstract class Y implements X {
  void b();
}

class A extends Y {
  @override
  void a() {
    print('Aa');
  }

  @override
  void b() {
    print('Ab');
  }

  void c() {
    print('Ac');
  }
}

class B extends Y {
  @override
  void a() {
    print('Ba');
  }

  @override
  void b() {
    print('Bb');
  }

  void c() {
    print('Bc');
  }
}

void main() {
  X obj = A();
  // 호출 가능
  obj.a();    // Aa
  // 호출 불가
  // obj.b();
  // 호출 불가
  // obj.c();

  Y y1 = A();
  y1.a();     // Aa
  Y y2 = B();
  y2.a();     // Ba
}