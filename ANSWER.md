

Part A1: Predictions and explanations

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



Part A2: Predictions and explanations

Registration number: 26323 | D = 3 | T = 23

Code with my own numbers (in my file I use `d` and `t`, which are 3 and 23):

dart
int x = 3; // my D
int y = 23; // my T
var z = x * 2 + y ~/ 4;
z += x;
print(z);
print(z.isEven);
print('$z' + '$x');
```

**Line 1: `print(z);`**
My prediction was 14 and the actual output is 14. First Dart works out `x * 2 + y ~/ 4`. The `*` and `~/` are done before the `+`. So 3 × 2 = 6, and 23 ~/ 4 = 5 (23 divided by 4 is 5.75, and `~/` drops the fraction). Then 6 + 5 = 11. After that `z += x` means `z = z + x`, so z becomes 11 + 3 = 14, and 14 is what gets printed.

**Line 2: `print(z.isEven);`**
My prediction was true and the actual output is true. z is 14, which is divisible by 2, so `isEven` is true.

**Line 3: `print('$z' + '$x');`**
My prediction was 143 and the actual output is 143. `'$z'` turns z into the string "14" and `'$x'` turns x into the string "3". The `+` between two strings joins them, so the result is "143". It is not 17, because these are no longer numbers.

**What is the type of z?**
z is an `int`.

**How did Dart work it out even though I wrote `var`?**
When I write `var`, Dart does not leave the variable without a type. It uses type inference: it looks at the value on the right side and gives the variable that type. Here x is an int, so `x * 2` is an int. `y ~/ 4` always returns an int. An int plus an int is an int. So Dart infers that z is an int. After that the type is fixed, so `z += x` keeps it an int, and I could not later assign a String to z.



Here is B1 written the way A1 was: each line, the output, and a full "why", in the first person.

I'm giving you the correct outputs. Write in your PDF what you really predicted before running the code, because the doctor grades the prediction too.



Part B1: Predictions and explanations

Registration number: 26323 | D = 3 | T = 23

*Line 1: `print(city.length);`
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




