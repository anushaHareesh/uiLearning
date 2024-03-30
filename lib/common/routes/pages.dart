import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/common/routes/names.dart';
import 'package:ulearning/pages/application/application_page.dart';
import 'package:ulearning/pages/register/bloc/register_bloc.dart';
import 'package:ulearning/pages/register/register.dart';
import 'package:ulearning/pages/sign_in/bloc/signin_bloc.dart';
import 'package:ulearning/pages/sign_in/sign_in.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_blocs.dart';
import 'package:ulearning/pages/welcome/welcome.dart';

class Appages {
 static List<PageEntity> routes() {
    return [
      PageEntity(
          route: AppRoutes.INITIAL,
          page: Welcome(),
          bloc: BlocProvider(create: (_) => WelcomeBlocs())),
      PageEntity(
          route: AppRoutes.REGISTER,
          page: Register(),
          bloc: BlocProvider(create: (_) => RegisterBlocs())),
      PageEntity(
          route: AppRoutes.SIGN_IN,
          page: Signin(),
          bloc: BlocProvider(create: (_) => SigninBloc())),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: ApplicationPage(),
        // bloc: BlocProvider(create: (_) => WelcomeBlocs(),),
      ),
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context){
    List<dynamic> blocProviders=<dynamic>[];

    for(var bloc in routes()){
        blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;
  PageEntity({required this.route, required this.page, this.bloc});
}
