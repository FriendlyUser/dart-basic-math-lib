import "dart:math" show pi;
const _TRIG_EPS = 1e-6;
// absolute values
T abs<T extends num>(T x) {
  if (x < 0) x = -x;
  return x;
}

// square values
T sqr<T extends num>(T x) {
  return x*x;
}

T cube<T extends num>(T x) {
  return x*x*x;
}

T mod<T extends num>(T x, T y) {
  if (y==0) throw ('Y cannot be Zero');
  return x - (x ~/ y)*y;
}
// Using odd function property sin(-x) = -sin(x)
// and trig identity sin(x) = 3sin(x/3) - 4sin^3(x/3)
T sin<T extends num>(T x) {
  // in this case sin(x) = -sin(-x), recurse negatives
  if (x < 0) return sin<T>(-x);
  // mod function should force range of output to 0 to 2pi
  if (x >= 2*pi) x = mod<T>(x, 2*pi as T);
  if (x <= _TRIG_EPS) return x;
  T x3 = x / 3.0 as T;
  // force x to be modulous first if not within [0,2pi)
  // using sin(x) = 3sin(x/3) - 4sin^3(x/3)
  T sinx3 = sin<T>(x3);
  return 3*sinx3-4*sinx3*sinx3*sinx3;
}
T cos<T extends num>(T x) {
  return sin<T>(x + 0.500*pi as T);
}
T tan<T extends num>(T x) {
  T _denom = cos<T>(x);
  T _num = sin<T>(x);
  if(abs(_denom) <= _TRIG_EPS)
  {
    throw ("Cannot divide by zero");
  }
  return _num / _denom as T;
}
