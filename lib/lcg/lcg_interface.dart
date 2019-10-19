class LCG_Interface { 
  // lcg multiplier
  int _a;
  // lcg increment
  int _c;
  // lcg modulus
  int _m;
  // seed 
  int _seed;
  // getters 
  int get multiplier {return _a;}
  int get increment {return _c;}
  int get modulus {return _m;}
  int get seed {return _seed;}
  //setters
  void set seed(int newSeed) {_seed = newSeed;}
  LCG_Interface(int multiplier, int increment, int modulus, int seed);
  int nextNum() {return 0;}
  void discard(int n) {}
  int min() { return 0;}
  int max() { return 1;}
  bool operator==(LCG_Interface other) { return (other._a == _a);}
  int currValue() {return 0;}
}
