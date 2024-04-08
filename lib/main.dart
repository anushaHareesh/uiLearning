import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/routes/pages.dart';
import 'package:ulearning/common/routes/routes.dart';
import 'package:ulearning/common/service/storage_service.dart';
import 'package:ulearning/pages/application/application_page.dart';
import 'package:ulearning/pages/application/bloc/application_blocs.dart';
import 'package:ulearning/pages/home/bloc/home_page_bloc.dart';
import 'package:ulearning/pages/register/bloc/register_bloc.dart';
import 'package:ulearning/pages/register/register.dart';
import 'package:ulearning/pages/sign_in/bloc/signin_bloc.dart';
import 'package:ulearning/pages/sign_in/sign_in.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_blocs.dart';
import 'package:ulearning/pages/welcome/welcome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  StorageService.init();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCfGTIr3bfKGgrzb9m5D8hTuEMwNTRqZBg",
          appId: "1:574756199023:android:dee03cbb03e195f0070b9a",
          messagingSenderId: "574756199023",
          projectId: "ulearning-73272"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // providers: [...Appages.allBlocProviders(context)],
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => WelcomeBlocs(),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => SigninBloc(),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => RegisterBlocs(),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => ApplicationBlocs(),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => HomepageBloc(),
        )
      ],
      child: ScreenUtilInit(
        designSize: Size(375,812),
        builder: (context, child) => MaterialApp(
          // initialRoute: "/",
          // routes: routes,
          routes: {
            // "homePage":(context)=>MyHomePage(title: "jhjh"),
            "signin": (context) => Signin(),
            "register": (context) => Register(),
            "application": (context) => ApplicationPage(),
          },
          // home: Welcome(),
          home: StorageService().getDeviceFirstOpen()!
              ? StorageService().isLoggedIn()!
                  ? ApplicationPage()
                  : Signin()
              : Welcome(),
        ),
      ),

      // create: (context) => AppBlocs(),
      // create: (context)=>WelcomeBlocs(),
      // child: ScreenUtilInit(builder: (context,child)=>MaterialApp(home: Welcome(),),),
      // child: MaterialApp(
      //   home: MyHomePage(title: "jdbjhasbdj"),
      // ),
    );
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(

    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //     useMaterial3: true,
    //   ),
    //   home: const MyHomePage(title: 'Flutter Demo Home Page'),
    // );
  }
}
