class SigninStates{
  String email;
  String password;
  SigninStates({this.email="",this.password=""});

  SigninStates copywith({String? email,String? password}){
    return SigninStates(email: email ?? this.email,password: password ?? this.password);
  }
}