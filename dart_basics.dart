// Student: Rafa Abdallah
// Reg no: 26323
const String regNo = '26323';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

int countVowels(String text) {
  // by RA
  int count = 0;
  String lower = text.toLowerCase();
  int i = 0;
  while (i < lower.length) {
    if (lower[i] == 'a' ||
        lower[i] == 'e' ||
        lower[i] == 'i' ||
        lower[i] == 'o' ||
        lower[i] == 'u') {
      count++;
    }
    i++;
  }
  return count;
}

String initials(String fullName) {
  // by RA
  String result = '';
  List<String> words = fullName.split(' ');
  int i = 0;
  while (i < words.length) {
    if (words[i].isNotEmpty) {
      result += words[i][0].toUpperCase() + '.';
    }
    i++;
  }
  return result;
}

void main() {
  print('Reg no: $regNo | D = $d | T = $t');

  // B2
  String name = 'rafa abdallah mohammed abdallah';
  print('$name has ${countVowels(name)} vowels');

  // B3
  print(initials(name));
  print(initials(' ana uwase '));
  print('[${initials(' ')}]');
}