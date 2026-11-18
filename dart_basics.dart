// Student: Rafa Abdallah
// Reg no: 26323d
const String regNo = '26323';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

void main() {
  print('Reg no: $regNo | D = $d | T = $t');
  
//part A1:
int a = 17;
int b = 5;
print(a/b); //3.4
print(a ~/ b);//3
print(a % b);//2
print(-a % b); //3
print(-a ~/ b); //-3
print(-17.abs());//-17
print(0.1 + 0.2 == 0.3);// false
print(10 == 10.0); // true
//PartA2:
int x = 3; // your D
int y = 23; // your T
var z = x * 2 + y ~/ 4;
z += x;
print(z);
print(z.isEven);
print('$z' + '$x');
}


