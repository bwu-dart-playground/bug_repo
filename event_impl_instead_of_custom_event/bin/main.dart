class A {}

abstract class I {
  void method();
}

class B extends A implements I {
  @override
  void method() {}
}

void foo(Object a) {
  assert(a is A);
  assert(a is I);
  assert(a is B);

  if (a is I) a.method();
}

void main() {
  foo(new B());
}
