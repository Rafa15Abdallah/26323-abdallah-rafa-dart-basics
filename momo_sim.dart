
 // Student: Rafa Abdallah
// Reg no: 26323
const String regNo = '26323';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));

// 1. Format money with commas
String formatRwf(int amount) {
  // by RA
  bool isNegative = amount < 0;
  String digits = amount.abs().toString();
  String result = '';

  int i = 0;

  while (i < digits.length) {
    result += digits[i];

    int remaining = digits.length - i - 1;

    if (remaining > 0 && remaining % 3 == 0) {
      result += ',';
    }

    i++;
  }

  if (isNegative) {
    result = '-$result';
  }

  return '$result RWF';
}

// 2. Validate PIN
bool isValidPin(String pin) {
  // by RA
  if (pin.length != 5) {
    return false;
  }

  if (pin == '12345') {
    return false;
  }

  int i = 0;

  while (i < pin.length) {
    if (pin.codeUnitAt(i) < 48 ||
        pin.codeUnitAt(i) > 57) {
      return false;
    }
    i++;
  }

  bool sameDigit = true;
  i = 1;

  while (i < pin.length) {
    if (pin[i] != pin[0]) {
      sameDigit = false;
    }
    i++;
  }

  if (sameDigit) {
    return false;
  }

  return true;
}

// 3. Calculate MoMo transaction fee (copied from D2)
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

// 4. Send money
int sendMoney(int balance, int amount) {
  // by RA
  int fee = momoFee(amount);

  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }

  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  int newBalance = balance - amount - fee;

  print(
    'Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). '
    'New balance: ${formatRwf(newBalance)}',
  );

  return newBalance;
}

// 5. Buy airtime
int buyAirtime(int balance, int amount) {
  // by RA
  if (amount < 100 || amount > 50000) {
    print('Failed: invalid amount');
    return balance;
  }

  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }

  int newBalance = balance - amount;

  print(
    'Airtime bought: ${formatRwf(amount)}. '
    'New balance: ${formatRwf(newBalance)}',
  );

  return newBalance;
}

// Main program
void main() {
  // by RA
  print('Reg no: $regNo | D = $d | T = $t');

  // 1. Test PINs
  print("12345: ${isValidPin('12345')}");
  print("77777: ${isValidPin('77777')}");
  print("4821: ${isValidPin('4821')}");
  print("48a21: ${isValidPin('48a21')}");
  print("48213: ${isValidPin('48213')}");

  // 2. Starting balance
  int balance = 20000 + t * 500;

  print('Starting balance: ${formatRwf(balance)}');

  // 3. Send money three times
  int amount = (d + 1) * 3000;

  int i = 1;

  while (i <= 3) {
    balance = sendMoney(balance, amount);
    i++;
  }

  // Buy airtime
  balance = buyAirtime(balance, 1000);

  // Send invalid amount
  balance = sendMoney(balance, 0);

  // Send a large amount
  balance = sendMoney(balance, 200000);

  // 4. Final balance
  print('Final balance: ${formatRwf(balance)}');

  // 5. Additional tests

  print(formatRwf(0));       // Expected: 0 RWF
  print(formatRwf(999));     // Expected: 999 RWF
  print(formatRwf(1000));    // Expected: 1,000 RWF
  print(formatRwf(-5000));   // Expected: -5,000 RWF
  print(formatRwf(1250000)); // Expected: 1,250,000 RWF

  print(isValidPin('48213')); // Expected: true
  print(isValidPin('00000')); // Expected: false
  print(isValidPin('12a45')); // Expected: false
}
