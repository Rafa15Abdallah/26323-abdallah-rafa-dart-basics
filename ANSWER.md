NAME: Rafa Abdallah
RegNo:26323/2024

Part A1: 
Registration number: 26323 | D = 3 | T = 23

Line 1: `print(a / b);`
My prediction was 3. The actual output is 3.4. The `/` operator in Dart always returns a double, even when both numbers are integers, so 17 divided by 5 gives 3.4 and not a whole number.

Line 2: `print(a ~/ b);`
My prediction was 3 and the actual output is 3. The `~/` operator is integer division. It divides and throws away the fraction, so 3.4 becomes 3.

Line 3: `print(a % b);`
My prediction was 1, but the actual output is 2. The `%` operator gives the remainder. 17 = 5 × 3 + 2, so the remainder is 2.

Line 4: `print(-a % b);`
My prediction was 3 and the actual output is 3. In Dart, `%` never gives a negative result. -17 = 5 × (-4) + 3, so the remainder is 3.

Line 5: `print(-a ~/ b);`
My prediction was -3 and the actual output is -3. The `~/` operator truncates toward zero, so -3.4 becomes -3.

Line 6: `print(-17.abs());`
My prediction was -17 and the actual output is -17. The `.abs()` is applied to 17 first, which gives 17, and then the minus sign negates it, so the result is -17.

Line 7: `print(0.1 + 0.2 == 0.3);`
My prediction was true, but the actual output is false. Doubles are stored in binary and cannot represent 0.1 and 0.2 exactly. Their sum is 0.30000000000000004, which is not equal to 0.3.

Line 8: `print(10 == 10.0);`
My prediction was true and the actual output is true. The `==` operator compares values, and 10 and 10.0 are numerically equal.



Part A2: 

Registration number: 26323 | D = 3 | T = 23

Code with my own numbers (in my file I use `d` and `t`, which are 3 and 23):

dart
int x = 3; 
int y = 23; 
var z = x * 2 + y ~/ 4;
z += x;
print(z);
print(z.isEven);
print('$z' + '$x');


Line 1: `print(z);`
My prediction was 14 and the actual output is 14. First Dart works out `x * 2 + y ~/ 4`. The `*` and `~/` are done before the `+`. So 3 × 2 = 6, and 23 ~/ 4 = 5 (23 divided by 4 is 5.75, and `~/` drops the fraction). Then 6 + 5 = 11. After that `z += x` means `z = z + x`, so z becomes 11 + 3 = 14, and 14 is what gets printed.

Line 2: `print(z.isEven);`
My prediction was true and the actual output is true. z is 14, which is divisible by 2, so `isEven` is true.

Line 3: `print('$z' + '$x');`
My prediction was 143 and the actual output is 143. `'$z'` turns z into the string "14" and `'$x'` turns x into the string "3". The `+` between two strings joins them, so the result is "143". It is not 17, because these are no longer numbers.

What is the type of z?
z is an `int`.

How did Dart work it out even though I wrote `var`?
When I write `var`, Dart does not leave the variable without a type. It uses type inference: it looks at the value on the right side and gives the variable that type. Here x is an int, so `x * 2` is an int. `y ~/ 4` always returns an int. An int plus an int is an int. So Dart infers that z is an int. After that the type is fixed, so `z += x` keeps it an int, and I could not later assign a String to z.



Part B1: 

Line 1: `print(city.length);`
Output: `6`. The string `'Kigali'` has six characters: K, i, g, a, l, i. The `length` property counts all of them.

Line 2: `print(city[city.length - 1]);`
Output: `i`. Indexes start at 0, so the last character is at index `length - 1`, which is 5. The character at index 5 is the final `i`.

Line 3: `print(city.substring(2, 4));`
Output: `ga`. The indexes are K=0, i=1, g=2, a=3, l=4, i=5. `substring(2, 4)` starts at index 2 and stops before index 4, so it takes index 2 (`g`) and index 3 (`a`).

Line 4: `print(city.toUpperCase().indexOf('A'));`
Output: `3`. `toUpperCase()` gives `'KIGALI'`, and `indexOf('A')` returns the position of the first `A`. K=0, I=1, G=2, A=3, so the answer is 3. The capital `A` matches because the string was converted first.

Line 5: `print(city.contains('k'));`
Output: `false`. Dart is case-sensitive. The city starts with a capital `K`, and I'm searching for a small `k`, so it is not found.

Line 6: `print('$city.length');`
Output: `Kigali.length`. Without curly braces, `$` only inserts the variable name `city`. The `.length` after it is treated as plain text, so it is printed as it is.

Line 7: `print('${city.length}');`
Output: `6`. With curly braces, Dart evaluates the whole expression `city.length` and puts its value in the string.

Line 8: `print(city * 2);`
Output: `KigaliKigali`. Multiplying a string by an integer repeats it that many times, with nothing between the copies.

Line 9: `city.toUpperCase();`
Output: nothing is printed. This line has no `print`, so it shows nothing. It also does not change `city`, because it returns a new string and I didn't save it anywhere.

Line 10: `print(city);`
Output: `Kigali`. Strings in Dart are immutable, so `toUpperCase()` on the previous line did not change `city`. It is still `Kigali`.

Line 11: `print(city.replaceAll('i', '!'));`
Output: `K!gal!`. `replaceAll` replaces every small `i` with `!`. There are two of them, at index 1 and index 5. The original `city` is not changed.

Line 12: `print('5' + 5.toString());`
Output: `55`. `5.toString()` turns the number into the string `'5'`. Using `+` between two strings joins them, so the result is `'55'`, not 10.

Line 13: `print(int.parse('5') + 5);`
Output: `10`. `int.parse('5')` turns the string into the integer 5. Adding two integers gives 10.

Part B2:
text.toLowerCase() uesd to convert all letters to lowercase before checking for vowels. This means both capital and small letters are counted.
 Expected output:
Rafa Abdallah Mohammed Abdallah has 11 vowels

Q1. Which single line in your function makes capital letters count?
String lower = text.toLowerCase();
What would happen if you removed it?

Q2. What would happen if you removed it?
Capital letters would not be counted as vowels because the if condition checks only lowercase letters (a, e, i, o, u). Only lowercase vowels would be counted.

Part B3:
 Expected output
Assuming Full_name contains Rafa Abdallah Mohammed Abdallah:
R.A.M.A.
A.U.
[]
The last output is [] because you placed square brackets around the result to make the empty string visible.

Q1. Which input broke your first version?
The input ' ana uwase ' broke my first version because it contained extra spaces at the beginning and end, which created empty strings when using split(' ').

Q2. What did you change?
I added an if condition using isNotEmpty to skip empty strings before accessing the first character of each word. This allowed the function to handle extra spaces correctly and avoid errors.

Part C1:
Output line 1: 0
When i is 0, neither i == 2 nor i == 4 is true, so the loop reaches print(i) and prints 0.

Output line 2: 1
When i is 1, the two checks are false again, so it prints 1.

What happens at i = 2 (nothing is printed)
When i is 2, i == 2 is true, so continue runs. It skips the rest of this round, including print(i), and jumps to the next value of i. That’s why 2 is missing from the output.

Output line 3: 3
When i is 3, the checks are false, so it prints 3.

What happens at i = 4 (the loop ends)
When i is 4, i == 2 is false but i == 4 is true, so break runs. It stops the whole loop immediately, and 4 is not printed.

Why 5 is never printed
After break, the loop is finished, so i = 5 is never reached, even though i < 6 would still be true.


Part C2:
Part C2: Predictions and explanations:

Registration number: 26323 | D = 3 | T = 23

1. When day is 2
My prediction was "Early week". The actual output is "Early week". The value of day is 2, so the switch goes to case 2 and prints "Early week". After that, the switch stops by itself. It does not continue into case 3 or default, so "Midweek" and "Weekend soon" are never printed.

2. When I change day to 1
My prediction was "Early week". The actual output is "Early week". Now day is 1, so the switch goes to case 1. But case 1 has no code of its own, so it shares the code of case 2 right below it. That is why it prints the same "Early week". This is how Dart lets me say "if the day is 1 or 2, do this".

3. What a C or Java programmer would expect
A C or Java programmer would expect three lines to be printed when day is 2: "Early week", then "Midweek", then "Weekend soon". In C and Java, when a case matches, the program keeps running the code of the cases below it until it meets a break. This is called fall-through. There is no break in this code, so after printing "Early week" it would fall into case 3 and print "Midweek", and then fall into default and print "Weekend soon". In those languages, you have to write break at the end of each case to stop this.

4. Why Dart 3 behaves differently
In Dart 3, a case that has code stops by itself when its code is finished, so there is no need to write break. There is no fall-through. That is why Dart 3 prints only one line. The only thing that still shares code is an empty case like case 1, which joins the case below it. Dart did this because forgetting break is a very common bug in C and Java, and Dart 3 stops that bug from happening.

Part C3:
Registration number: 26323 | D = 3 | T = 23

My prediction: 50, 70, 10. Actual output: 50, then 70, then 10, on three lines.

Output line 1: 50
The variable bonus is declared as a nullable int (int?) and has no value yet, so it holds null. The ?? operator means “use the left side if it is not null, otherwise use the right side”. The left side is null, so the right side, 50, is used and printed. This line does not store anything in bonus. It only chooses a value to print, so bonus is still null afterwards.

Output line 2: 70
The ??= operator means “assign the right side only if the variable is currently null”. On the first ??=, bonus is null, so it becomes 70. On the second ??=, bonus is already 70, so it is not null and the assignment is skipped. The 90 is never stored. That is why print(bonus) shows 70 and not 90.

Output line 3: 10
This is a do...while loop. A do...while runs its body first and checks the condition afterwards. So the body runs once: it prints n, which is 10, and then n becomes 13. Then the condition n < 10 is checked. 13 is not less than 10, so the condition is false and the loop stops. The body ran exactly one time, even though the condition was false from the start. A normal while loop would have printed nothing here, because it checks the condition before running the body.

Part C4:
Registration number: 26323 | D = 3 | T = 23
In my code I write int x = d; using the variable from the personal block, and d is 3, so x starts at 3.
My prediction: O, 1, O. Actual output: three lines, “O”, then “1”, then “O”. None of the lines prints nothing.

How the loop runs
The loop condition is x > 0. At the start x is 3, so the loop runs. Inside, the program checks x % 2. Since 3 divided by 2 leaves a remainder of 1, which is not 0, the check for even fails and the else branch runs, so the letter “O” (for odd) is added to result. Then x -= 3 makes x equal to 0. Now the condition x > 0 is false, so the loop stops after only one round.

Output line 1: O
At the end result holds just the one letter “O”, so print(result) shows O.

Output line 2: 1
result has exactly one character, so result.length is 1.

Output line 3: O
The expression result.isEmpty ? ‘nothing’ : result[0] is a conditional. It prints “nothing” if result is empty, and otherwise the first character. The result is not empty, because it contains “O”, so it prints result[0], which is O. The word “nothing” is not printed, and every line prints something

Part C5:
Expected output
For height = 6:
     *
    ##
   ***
  ####
 *****
######

or drawTriangle(0) and drawTriangle(-2), nothing is printed because the while-loop condition is false from the beginning.

Q1. How did you work out the number of spaces on each row?
I calculated the spaces by subtracting the current row number from the total height, using height - row, so that each row is right-aligned


Part D1: 

1. Predicted output
I predict that the program will produce the following output:
1, 5, 1180, 1178 and 1000.

2. Actual output
After running the program, the actual output is:
1, 5, 1180, 1178 and 1000.

3. Explanation of each line
The first output is 1 because the count variable inside the bump function is local. Increasing it does not affect the global variable, which remains 1.

The second output is 5 because the doubleIt function modifies only its local parameter and does not change the original variable.

The third output is 1180 because the function adds 18% VAT to the original price of 1000.

The fourth output is 1178 because 18% of 999 is 179.82, but integer division removes the decimal part, leaving 179. Adding this to 999 gives 1178.

The fifth output is 1000 because the VAT rate is set to zero, so no additional amount is added.

4. Why is addVat(999) not exactly 18% more than 999?

The result is not exactly 18% more because the function uses integer division, which removes the decimal part of the VAT calculation. Instead of adding 179.82, it adds only 179, resulting in a final amount of 1178 instead of 1178.82.

Part D2:
The output:
Reg no: 26323 | D = 3 | T = 23
Receipt 1 | 6300 RWF | fee 100 RWF | to 078*****56
Receipt 2 | 10300 RWF | fee 250 RWF | to 078*****56
Receipt 3 | 14300 RWF | fee 250 RWF | to 078*****56
Receipt 4 | 18300 RWF | fee 250 RWF | to 078*****56
Receipt 5 | 22300 RWF | fee 250 RWF | to 078*****56
Receipt 6 | 26300 RWF | fee 250 RWF | to 078*****56
Total fees: 1350 RWF

/Part E:
1. What does grade(85) return, and why? 
It returns 'C' because the first condition, mark >= 50, is true for 85. The function immediately returns 'C' without checking the later conditions for grades B and A. The conditions are in the wrong order.

2. What happens when you call isPalindrome('level')? Give the exact error type. 
It produces a RangeError.
This happens because the expression word[word.length - i] uses an invalid index. When i is 0, it tries to access word[5], but the last valid index of 'level' is 4.

3. Fix both functions. List every line you changed. 
Corrected functions:
String grade(int mark) {
  // by RA
  if (mark >= 80) {
    return 'A';
  } else if (mark >= 70) {
    return 'B';
  } else if (mark >= 50) {
    return 'C';
  }
  return 'F';
}

bool isPalindrome(String word) {
  // by RA
  int i = 0;
  while (i < word.length) {
    if (word[i] != word[word.length - 1 - i]) return false;
    i++;
  }
  return true;
}

Lines changed:
1. Changed the first condition from mark >= 50 to mark >= 80.
2. Changed the second condition from mark >= 70 to mark >= 70 (the condition stays the same, but its position is moved).
3. Changed the third condition from mark >= 80 to mark >= 50.
4. Changed word[word.length - i] to word[word.length - 1 - i].
The grade conditions are now checked from highest to lowest, and the palindrome function compares characters with their correct matching positions.

4. Should isPalindrome('Level') return true or false? Justify your choice in 2–3 sentences. 
My choice: True.
I believe that a palindrome should be recognized regardless of whether its letters are uppercase or lowercase. Therefore, 'Level' should return true because it reads the same forward and backward when letter case is ignored.

To make the code match this choice, convert the word to lowercase before comparing its characters.

bool isPalindrome(String word) {
  // by RA
  word = word.toLowerCase();

  int i = 0;
  while (i < word.length) {
    if (word[i] != word[word.length - 1 - i]) return false;
    i++;
  }
  return true;
}

The test results are:
`grade(85)` returns `'A'`.

`grade(75)` returns `'B'`.

`grade(45)` returns `'F'`.

`isPalindrome('level')` returns `true`.

`isPalindrome('Level')` returns `true`.

`isPalindrome('hello')` returns `false`.

Part F:
The output:
Reg no: 26323 | D = 3 | T = 23
12345: false
77777: false
4821: false
48a21: false
48213: true
Starting balance: 31,500 RWF
Sent 12,000 RWF (fee 250 RWF). New balance: 19,250 RWF
Sent 12,000 RWF (fee 250 RWF). New balance: 7,000 RWF
Failed: insufficient balance
Airtime bought: 1,000 RWF. New balance: 6,000 RWF
Failed: invalid amount
Failed: insufficient balance
Final balance: 6,000 RWF
0 RWF
999 RWF
1,000 RWF
-5,000 RWF
1,250,000 RWF
true
false
false

Part G:
1. Exact wrong output (Incorrect comma formatting):
Starting balance: 3,15,00 RWF
Sent 1,20,00 RWF (fee 2,50 RWF). New balance: 1,92,50 RWF
Sent 1,20,00 RWF (fee 2,50 RWF). New balance: 70,00 RWF
Failed: insufficient balance
Airtime bought: 10,00 RWF. New balance: 60,00 RWF
Failed: invalid amount
Failed: insufficient balance
Final balance: 60,00 RWF
0 RWF
9,99 RWF
10,00 RWF
-50,00 RWF
1,25,00,00 RWF
true
false
false


2. Line where the error came from:
The condition inside formatRwf() that checks remaining % 3 == 0.

3. What caused the error?
By mistake, I typed 2 instead of 3 in the condition. As a result, the program inserted commas after every two digits instead of every three digits.

4. How I fixed it:
I changed % 2 back to % 3 so that the program inserts commas correctly after every three digits.

The second one(Error message):
dart_basics.dart:11:23: Error: A value of type 'String Function()' can't be assigned to a variable of type 'String'.
  String lower = text.toLowerCase;

  Error message: A value of type 'String Function()' can't be assigned to a variable of type 'String'.
Line: Line 11 in dart_basics.dart.
Cause: I forgot to add parentheses after toLowerCase.
Fix: I added () to call the method and get the lowercase text

The third one (Missing the last row of the triangle):
1. Exact wrong output:
 *
 ##
 2. Line where the error came from:
 line 50 while loop condition inside drawTriangle(), where I mistakenly used < instead of <=.

3. What caused the error?
I mistakenly used < instead of <=, causing the loop to stop before printing the final row of the triangle.

4. How I fixed it:
I changed the condition back to <=, allowing the loop to print all rows, including the last one.







