import 'dart:io';

void main () {

    print("Enter your name:");
    String? UserName = stdin.readLineSync();

    print("Enter your age:");
    String? UserAgeInput = stdin.readLineSync();
    int UserAge = int.parse(UserAgeInput!);

    print("Enter your height:");
    String? UserHeightInput = stdin.readLineSync();
    num UserHeight = num.parse(UserHeightInput!);

    print("Enter your employment status:");
    String? EmploymentStatus = stdin.readLineSync();

    print("Employee Name: $UserName");
    print("Age: $UserAge");
    print("Height: $UserHeight");
    print("Employment Status: $EmploymentStatus");

}