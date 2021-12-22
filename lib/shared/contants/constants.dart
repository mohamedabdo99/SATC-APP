

import 'package:satc/helper/local/cache_helper.dart';
import 'package:satc/modules/login/login_screen.dart';
import 'package:satc/shared/components/components.dart';

void signOut(context){
  CacheHelper.removeData(key: "uId").then((value) {
    if (value) {
      navigateToAndFinish(
        context,
        LoginScreen(),
      );
    }
  });
}

String? token = '';
String? uId = '';