import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mel/bindings.dart';
import 'package:mel/dependencies.dart' as dep;
import 'package:mel/layouts.dart' show FeedTabLayout;
import 'package:mel/ui.dart' show MessageScreen, SignInPage, SplashPage;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      title: 'Mel',
      theme: ThemeData(
        textTheme: GoogleFonts.lindenHillTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      initialRoute: '/',
      namedRoutes: {
        '/': GetRoute(
          page: SplashPage(),
          binding: SplashBinding(),
        ),
        '/sign_in': GetRoute(
          page: SignInPage(),
          binding: SignInBinding(),
        ),
        '/home': GetRoute(
          page: FeedTabLayout(),
          binding: HomeBinding(),
        ),
        '/chat': GetRoute(
          page: MessageScreen(),
          binding: ChatBinding(),
        ),
      },
    );
  }
}
