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
}

abstract class IsSilly {
  void makePeopleLaugh();
}

//Abstract class
class Clown extends IsSilly {   
  void makePeopleLaugh() {
    // Here is where the magic happens
  }
}

//Interface
class Comedian implements IsSilly {
  void makePeopleLaugh() {
    // Here is where the magic happens
  }
}