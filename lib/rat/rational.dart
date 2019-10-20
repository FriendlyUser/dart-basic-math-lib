class Rational {
  int _num;
  int _denom;

  int get numerator {return _num;}
  int get denominator {return _denom;}
  Rational(this._num, this._denom);
  Rational operator +(Rational other) {
    // int lcm_rl = std::lcm(this.numerator, other.denominator);
    int lcm_rl = lcm(this.denominator, other.denominator);
    // // to compute multiple factor switch numbers around
    int left_fact = lcm_rl ~/ this.denominator;
    int right_fact = lcm_rl ~/ other.denominator;
    return Rational((this.numerator * left_fact) + (other.numerator * right_fact), lcm_rl);
  }
  Rational operator -(Rational other) {
    // int lcm_rl = std::lcm(this.numerator, other.denominator);
    int lcm_rl = lcm(this.denominator, other.denominator);
    // // to compute multiple factor switch numbers around
    int left_fact = lcm_rl ~/ this.denominator;
    int right_fact = lcm_rl ~/ other.denominator;
    return Rational((this.numerator * left_fact) - (other.numerator * right_fact), lcm_rl);
  }
  Rational operator *(Rational other) {
    return Rational(this.numerator * other.numerator, this.denominator * other.denominator);
  }

  void treat_divide_by_zero() {
    if (_denom == 0) {
        _num = power(2,63) - 1;
        _denom = 1;
    }
  }
  // simplify function
  void simplify() {
    // Always represent 0 as 0/1
    treat_divide_by_zero();

      // Divide by greatest common divisor, 
      int gcdValue = gcd(_num, _denom);
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
  int power(int x, int y) {
    int power = 1;
    for (int i = 0; i < y; i++) {
      power *= x;
    }
  
    return power;
  }
  int lcm(int a, int b) => (a * b) ~/ gcd(a, b);
  int gcd(int a,int b)
  {
    if(b==0)
      return a;
    if(b!=0)
      return gcd(b,a%b);
    return 0;
  }
}
