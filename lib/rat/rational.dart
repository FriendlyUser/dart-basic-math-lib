// Class representation of a rational number. This rational number will always 
// be simplified as far as possible, will always indicate sign on the numerator
// and will always represent 0 as 0/1. For example 2/-8 will be represented as 
// -1/4 and 0/-128 will be represented as 0/1.
class Rational {
  // rational numerator, should be integer
  int _num;
  // rational denominator should be integer
  int _denom;

  int get numerator {return _num;}
  int get denominator {return _denom;}
  // creates a simplified rational number
  Rational(this._num, this._denom) {
    simplify();
  }
  Rational operator +(Rational other) {
    // int lcm_rl = std::lcm(this.numerator, other.denominator);
    int lcm_rl = _lcm(this.denominator, other.denominator);
    // // to compute multiple factor switch numbers around
    int left_fact = lcm_rl ~/ this.denominator;
    int right_fact = lcm_rl ~/ other.denominator;
    return Rational((this.numerator * left_fact) + (other.numerator * right_fact), lcm_rl);
  }
  Rational operator -(Rational other) {
    // int lcm_rl = std::lcm(this.numerator, other.denominator);
    int lcm_rl = _lcm(this.denominator, other.denominator);
    // // to compute multiple factor switch numbers around
    int left_fact = lcm_rl ~/ this.denominator;
    int right_fact = lcm_rl ~/ other.denominator;
    return Rational((this.numerator * left_fact) - (other.numerator * right_fact), lcm_rl);
  }
  Rational operator *(Rational other) {
    return Rational(this.numerator * other.numerator, this.denominator * other.denominator);
  }
  Rational operator /(Rational other) {
    return Rational(this.numerator * other.denominator, this.denominator * other.numerator);
  }

  // comparsion operators
  @override
  bool operator ==(Rational other) {
     return (this._num == other._num && this._denom == other._denom);
  }
  bool operator <(Rational other) {
    // compare numerators
    int lcm_com = _lcm(this._denom, other._denom);
    int lcm_denom = lcm_com ~/ this._denom;
    int lcm_rat_denom = lcm_com ~/ other._denom;
    // multiple numerators
    return ( (_num * lcm_denom) < (other._num * lcm_rat_denom));
  }
  // Inequality comparsion with [other]
  bool operator >(Rational other) {
    // compare numerators
    int lcm_com = _lcm(this._denom, other._denom);
    int lcm_denom = lcm_com ~/ this._denom;
    int lcm_rat_denom = lcm_com ~/ other._denom;
    // multiple numerators
    return ( (_num * lcm_denom) > (other._num * lcm_rat_denom));
  }

  void _treat_divide_by_zero() {
    if (_denom == 0) {
        _num = power(2,63) - 1;
        _denom = 1;
    }
  }
  // simplify function
  void simplify() {
    // Always represent 0 as 0/1
    _treat_divide_by_zero();

      // Divide by greatest common divisor, 
      int gcdValue = _gcd(_num, _denom);
      // gcd should never be 0 at this point, but if it is don't divide by zero
      if (gcdValue != 0) {
          _num ~/= gcdValue;
          _denom ~/= gcdValue;
      }

    // Indicate sign on numerator only
    if (_denom < 0) {
      _num = -_num;
      _denom = -_denom;
    }
  }
  // should be a utility function, but whatever
  int power(int x, int y) {
    int power = 1;
    for (int i = 0; i < y; i++) {
      power *= x;
    }
  
    return power;
  }
  // least common multiple
  int _lcm(int a, int b) => (a * b) ~/ _gcd(a, b);
  int _gcd(int a,int b)
  {
    if(b==0)
      return a;
    if(b!=0)
      return _gcd(b,a%b);
    return 0;
  }
  // Returns the integer value for a rational number
  int truncate()
  {   
      // could use integer division instead
      // find wholest number that can be divided by, subtract remainder
      int remain = _num % _denom;
      int whole_num = (_num - remain) ~/ _denom;
      return whole_num;
  }
  bool is_integer() {
    return (_num == 0 || _denom == 1);
  }
  @override
  // print the rational number as numerator/denominator,
  // example 3/5
  String toString() {
    return "${_num}/${_denom}";
  }
}
