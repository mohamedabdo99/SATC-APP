import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satc/Theme/app_theme.dart';
import 'package:satc/helper/local/cache_helper.dart';
import 'package:satc/layout/home_layout.dart';
import 'package:satc/layout/home_layout_cubit/home_layout_cubit.dart';
import 'package:satc/modules/login/login_screen.dart';
import 'package:satc/modules/splash/splash_screen.dart';
import 'package:satc/shared/contants/constants.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await CacheHelper.init();


  uId = CacheHelper.loadData(key: "uId");

  Widget widget;

  if (uId != null) {
    widget = const HomeLayoutScreen();
  } else {
    widget = SplashScreen();
  }

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  MyApp({required this.startWidget});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => HomeLayoutCubit()..getUser()..getAllTasks()..getAllUser(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme(),
        home:startWidget,
      ),
    );
  }
}

