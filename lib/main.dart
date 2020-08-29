import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, BlocProvider;
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:mel/core.dart' show Routes, cLightAccent, cPinkLight;
import 'package:mel/dependencies.dart' as dep;
import 'features/authentication/bloc/authentication_bloc.dart'
    show
        AuthenticationBloc,
        AuthenticationStarted,
        AuthenticationState,
        AuthenticationSuccess,
        NotAuthenticated;

import 'dependencies.dart' show di;
import 'package:mel/splash_screen.dart';
import 'features/chat.dart';
import 'features/login.dart' show LoginScreen;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Routes.createRoutes();
  await dep.init();
  runApp(
    BlocProvider(
      create: (_) => di<AuthenticationBloc>()
        ..add(
          AuthenticationStarted(),
        ),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mel',
      theme: ThemeData(
        textTheme: GoogleFonts.sourceSansProTextTheme(
          Theme.of(context).textTheme,
        ),
        accentColor: cLightAccent,
        cursorColor: cPinkLight,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 200),
            child: (state is NotAuthenticated || state is AuthenticationSuccess)
                ? (state is NotAuthenticated) ? LoginScreen() : ChatScreen()
                : SplashScreen(),
          );
        },
      ),
      onGenerateRoute: Routes.sailor.generator(),
      navigatorKey: Routes.sailor.navigatorKey,
    );
  }
}
