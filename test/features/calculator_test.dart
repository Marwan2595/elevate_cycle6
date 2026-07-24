import 'package:elevate_cycle6/features/calculator.dart';
import 'package:test/test.dart';

void main() {
  //AAA
  //Arrange --> Prepare all needed variables/dependencies
  //Act. --> Execute the function under test and hold it's value
  //Assert. --> Compare the expected result with the actual result
  group("Test Add function", () {
    test("Test Add Function with 2 positive numbers", () {
      //Arrange
      Calculator calculator = Calculator();
      double num1 = 5;
      double num2 = 3;

      //Act
      final result = calculator.add(num1, num2);

      //Assert
      expect(result, 8.0);
      expect(result, isPositive);
      expect(result, isNonNegative);
      expect(result, isNonZero);
      expect(result, isA<double>());
    });
    test("Test Add Function with 2 negative numbers", () {});
  });
  group("Test Divide function", () {
    test("Test Divide Function with 2 positive numbers", () {});
  });
}
