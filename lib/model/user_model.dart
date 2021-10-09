class User {
  final String firstName;
  final String lastName;
  final String nic;
  final String email;
  final String username;

  User({
    required this.firstName,
    required this.lastName,
    required this.nic,
    required this.email,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstName'],
      lastName: json['lastName'],
      nic: json['nic'],
      email: json['email'],
      username: json['username'],
    );
  }
}
