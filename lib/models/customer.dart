import 'dart:convert';

class Customer {
  String firstName;
  String lastName;
  String email;
  String password;
  Customer({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  Customer copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
  }) {
    return Customer(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
      'username': email
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      firstName: map['first_name'] ?? '',
      lastName: map['last_name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Customer.fromJson(String source) =>
      Customer.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Customer(firstName: $firstName, lastName: $lastName, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Customer &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        password.hashCode;
  }
}
