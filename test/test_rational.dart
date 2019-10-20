import "package:test/test.dart"; 
import "../lib/rat/rational.dart"; 
void main() { 
   group("Constructor and Basic Simplification", () { 
      test("Divide by Zero", () { 
        Rational rat1 = new Rational(0,0);
        expect(rat1.numerator, equals(rat1.power(2,63)-1)); 
      }); 
      test("Simplification 10/15 => 2/3", () {
        Rational rat_d = new Rational(10, 15);
        expect(rat_d.numerator, equals(2));
        expect(rat_d.denominator, equals(3));
        Rational rat_e = new Rational(2, -3);
        expect(rat_e.numerator, equals(-2));
        expect(rat_e.denominator, equals(3));
        Rational rat_f = new Rational(-2, -3);
        assert(rat_f.numerator == 2);
        assert(rat_f.denominator == 3);
      });
   }); 
   group("Arithmetic Operations", () {
     test("Addition 1/3 + 1/5", () {
        Rational rat_13 = new Rational(1, 3);
        Rational rat_15 = new Rational(1, 5);
        Rational rat_815 = rat_13 + rat_15;
        expect(rat_815.numerator, equals(8));
        expect(rat_815.denominator, equals(15));
     });
     test("Addition 1/4 + 3/4", () {
      Rational rat_14 = new Rational(1, 4);
      Rational rat_34 = new Rational(3, 4);
      Rational rat_11 = rat_14 + rat_34;
      expect(rat_11.numerator, equals(1));
      expect(rat_11.denominator, equals(1));
    });
    test("Subtraction 7/3 - 2/5", () {
      Rational rat_73 = new Rational(7, 3);
      Rational rat_25 = new Rational(2, 5);
      rat_73 -= rat_25;
      expect(rat_73.numerator, equals(29));
      expect(rat_73.denominator, equals(15));
    });
    test("Multiplication 7/3 * 2/5", () {
      Rational rat_73 = new Rational(7, 3);
      Rational rat_25 = new Rational(2, 5);
      rat_73 *= rat_25;
      expect(rat_73.numerator, equals(14));
      expect(rat_73.denominator, equals(15));
    });
    test("Division 7/3 / 2/5", () {
      Rational rat_73 = new Rational(7, 3);
      Rational rat_25 = new Rational(2, 5);
      rat_73 /= rat_25;
      expect(rat_73.numerator, equals(35));
      expect(rat_73.denominator, equals(6));
     });
   });

   group("Inequality Operations", () {
    test("Comparsion > and < ", () {
      Rational rat_67 = new Rational(6, 7);
      Rational rat_45 = new Rational(4, 5);
      assert(rat_45 < rat_67);
      assert(rat_67 > rat_45);
      assert((rat_45 > rat_45) == false);
    });
   });
}
