import 'package:ulearning/pages/application/application_page.dart';
import 'package:ulearning/pages/register/register.dart';
import 'package:ulearning/pages/sign_in/sign_in.dart';

Map<String, dynamic> routes = {
  "signin": (context) => Signin(),
  "register": (context) => Register(),
  "application": (context) => ApplicationPage(),
};
