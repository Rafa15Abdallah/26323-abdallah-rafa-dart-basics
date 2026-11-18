
// Student: Rafa Abdallah
// Reg no: 26323
const String regNo = '26323';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// B2: Count vowels
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

// B3: Get initials
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

// C5: Draw a triangle
void drawTriangle(int height) {
  // by RA
  int row = 1;

  while (row <= height) {
    String symbol = row % 2 == 1 ? '*' : '#';
    String spaces = List.filled(height - row, ' ').join();
    String symbols = List.filled(row, symbol).join();

    print(spaces + symbols);
    row++;
  }
}

// D2: Calculate MoMo transaction fees
int momoFee(int amount) {
  // by RA
  if (amount <= 0) {
    return -1;
  } else if (amount <= 1000) {
    return 20;
  } else if (amount <= 10000) {
    return 100;
  } else if (amount <= 150000) {
    return 250;
  } else {
    return 1500;
  }
}

// D2: Mask phone number
String maskPhone(String phone) {
  // by RA
  if (phone.length != 10) {
    return 'INVALID';
  }

  return phone.substring(0, 3) +
      '*****' +
      phone.substring(8, 10);
}

// Main program
void main() {
  // by RA
  print('Reg no: $regNo | D = $d | T = $t');

  // B2
  String name = 'Rafa Abdallah Mohammed Abdallah';
  print('$name has ${countVowels(name)} vowels');

  // B3
  print(initials(name));
  print(initials(' ana uwase '));
  print('[${initials(' ')}]');

  // C5
  drawTriangle(d + 3);
  drawTriangle(0);
  drawTriangle(-2);

  // D2
  int i = 1;
  int totalFees = 0;
  String phone = maskPhone('0788123456');

  while (i <= d + 3) {
    int amount = i * 4000 + t * 100;
    int fee = momoFee(amount);

    print(
      'Receipt $i | $amount RWF | fee $fee RWF | to $phone',
    );

    totalFees += fee;
    i++;
  }

  print('Total fees: $totalFees RWF');
}
