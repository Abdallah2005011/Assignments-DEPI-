void main() {
  String message = regisrterUser(
    email: "user@example.com",
    password: "123456",
    phone: '01158126228',
  );
  print(message);
}

String regisrterUser({
  required String email,
  required String password,
  String? phone = 'Not provided',
}) {
  String message =
      'User registered successfully! \nE-mail:$email \nPassword: $password \nPhone: $phone';
  return message;

}
