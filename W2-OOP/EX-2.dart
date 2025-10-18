class BankAccount {
  // TODO
  final int id;
  final String name;
  final String _cardNum;
  double _balance;

  // Getter
  String get cardNum => _cardNum;
  double get balance => _balance;

  BankAccount(this.id, this.name, this._cardNum) : _balance = 0.0;

  // Methods
  void credit(double amount) {
    _balance += amount;
  }

  void withdraw(double amount) {
    if (_balance - amount < 0) {
      throw Exception("Insufficiant balance!!!");
    } else {
      _balance -= amount;
    }
  }
}

class Bank {
  // TODO
  final String name;
  final Map<int, BankAccount> _account = {};

  Bank({required this.name});

  BankAccount createAccount(
    int accountId,
    String accountName,
    String accountNum,
  ) {
    if (_account.containsKey(accountId)) {
      throw Exception("ID already exist, Please choose another ID");
    } else {
      final account = BankAccount(accountId, accountName, accountNum);
      _account[accountId] = account;
      return account;
    }
  }
}

void main() {
  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan', '123-456-789');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(
      100,
      'Honlgy',
      '111-222-333',
    ); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
