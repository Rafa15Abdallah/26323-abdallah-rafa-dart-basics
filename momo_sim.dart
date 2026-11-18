

const String regNo = '26323';
final int d = int.parse(regNo[regNo.length - 1]);
final int t = int.parse(regNo.substring(regNo.length - 2));


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


void main() {
  // by RA
  print('Reg no: $regNo | D = $d | T = $t');


  print("12345: ${isValidPin('12345')}");
  print("77777: ${isValidPin('77777')}");
  print("4821: ${isValidPin('4821')}");
  print("48a21: ${isValidPin('48a21')}");
  print("48213: ${isValidPin('48213')}");


  int balance = 20000 + t * 500;

  print('Starting balance: ${formatRwf(balance)}');

 
  int amount = (d + 1) * 3000;

  int i = 1;

  while (i <= 3) {
    balance = sendMoney(balance, amount);
    i++;
  }

 
  balance = buyAirtime(balance, 1000);

 
  balance = sendMoney(balance, 0);


  balance = sendMoney(balance, 200000);


  print('Final balance: ${formatRwf(balance)}');


  print(formatRwf(0));      
  print(formatRwf(999));     
  print(formatRwf(1000));    
  print(formatRwf(-5000));   
  print(formatRwf(1250000)); 
  print(isValidPin('48213')); 
  print(isValidPin('00000'));
  print(isValidPin('12a45')); 
}
