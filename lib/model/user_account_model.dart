class UserAccount {
  final String accountNo;
  final double amount;
  final String status;

  UserAccount({
    required this.accountNo,
    required this.amount,
    required this.status,
  });

  factory UserAccount.fromJson(Map<String, dynamic> json) {
    return UserAccount(
      accountNo: json['accountNo'],
      amount: json['amount'],
      status: json['status'],
    );
  }
}
