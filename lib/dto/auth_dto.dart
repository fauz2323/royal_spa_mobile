class RegisterDto {
  final String name;
  final String password;
  final String email;
  final String phone;

  RegisterDto({
    required this.name,
    required this.password,
    required this.email,
    required this.phone,
  });
}

class LoginDto {
  final String email;
  final String password;

  LoginDto({
    required this.email,
    required this.password,
  });
}
