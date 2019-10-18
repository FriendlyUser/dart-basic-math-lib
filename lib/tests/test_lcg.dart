import "package:test/test.dart"; 
void main() { 
   group("String", () { 
      test("test on split() method of string class", () { 
         var string = "foo,bar,baz"; 
         expect(string.split(","), equals(["foo", "bar", "baz"])); 
      }); 
      test("test on trim() method of string class", () { 
         var string = "  foo "; 
         expect(string.trim(), equals("foo")); 
      }); 
   }); 
} 