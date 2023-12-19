import 'dart:io';

void main() {
  print("Select operation:");
  print("1. Add");
  print("2. Subtract");
  print("3. Multiply");
  print("4. Divide");

  String choice = stdin.readLineSync()!;

  if (['1', '2', '3', '4'].contains(choice)) {
    print("Enter first number:");
    double num1 = double.parse(stdin.readLineSync()!);

    print("Enter second number:");
    double num2 = double.parse(stdin.readLineSync()!);

    switch (choice) {
      case '1':
        print("$num1 + $num2 = ${add(num1, num2)}");
        break;
      case '2':
        print("$num1 - $num2 = ${subtract(num1, num2)}");
        break;
      case '3':
        print("$num1 * $num2 = ${multiply(num1, num2)}");
        break;
      case '4':
        print("$num1 / $num2 = ${divide(num1, num2)}");
        break;
    }
  } else {
    print("Invalid Input");
  }
}

double add(double x, double y) => x + y;

double subtract(double x, double y) => x - y;

double multiply(double x, double y) => x * y;

double divide(double x, double y) => (y != 0) ? x / y : double.infinity;
