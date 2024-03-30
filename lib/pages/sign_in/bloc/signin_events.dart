abstract class SigninEvents {
  const SigninEvents();
}

class EmailEvent extends SigninEvents {
  final String email;
  EmailEvent(this.email);
}

class PasswordEvent extends SigninEvents {
  final String password;
  PasswordEvent(this.password);
}

