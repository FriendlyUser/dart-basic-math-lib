import "dart:math" as math;
import "package:test/test.dart"; 
import "../lib/math/math.dart"; 
void main() { 
   group("Math Lib Test", () { 
      test("Mod", () { 
        assert(mod<int> (5,4) == 1);
        assert(mod<int> (-20,4) == 0);
        assert(mod<int> (25,30) == 25);
      }); 
      test("Trig", () { 
        assert(sin<double> (math.pi) == 0);
        assert(sin<double> (0.5*math.pi) == 1);
        assert(sin<double> (-0.25*math.pi) == 0.5*math.sqrt(2));
      }); 
   }); 
}
