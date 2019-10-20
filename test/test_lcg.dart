import "package:test/test.dart"; 
import "../lib/lcg/lcg.dart"; 
void main() { 
   group("String", () { 
      LCG lcg1 = new LCG(4,2,8,1);
      LCG lcg2 = new LCG(4,2,8,1);
      test("Testing Equality for lcg", () { 
         expect(lcg1, equals(lcg2)); 
      }); 
      test("test on min() and max()", () { 
         LCG lcgNew = new LCG(3,3,8,1);
         expect(lcgNew.min(), 0);
         expect(lcgNew.max(), 7); 
      }); 
      test("Testing discard()", () {
        LCG discard = new LCG(3, 3, 8, 1);
        discard.discard(1);
        expect(discard.currValue(), 6);
        discard.discard(1);
        expect(discard.currValue(), 5);
      });
   }); 
}
