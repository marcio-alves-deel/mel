import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'
    show BlocBuilder, BlocListener, BlocProvider;
import 'package:flutter_spinkit/flutter_spinkit.dart' show SpinKitFadingCircle;
import 'package:mel/core.dart' show cPinkLight, cYellow;
import 'package:mel/data/models/user_model.dart';
import 'package:mel/dependencies.dart' show di;
import 'package:mel/features/authentication.dart'
    show AuthenticationBloc, AuthenticationLoggedIn;
import 'package:mel/features/login.dart'
    show
        LoginBackground,
        LoginBloc,
        LoginFailure,
        LoginHeader,
        LoginLoading,
        LoginState,
        LoginSuccess,
        LoginWithFacebookButton,
        LoginWithGoogleButton,
        LoginWithTwitterButton;
import 'package:mel/widgets.dart' show TextSSerif, toastNotify;

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key key,
  }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginBloc>(
        create: (_) => di<LoginBloc>(),
        child: buildBody(context),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          toastNotify(
            state.props[0],
            context: context,
          );
        }

        if (state is LoginSuccess) {
          toastNotify(
            'Signed in as ${(state.props[0] as User).email}',
            context: context,
          );
          BlocProvider.of<AuthenticationBloc>(context)
              .add(AuthenticationLoggedIn());
        }
      },
      child: Stack(
        children: <Widget>[
          LoginBackground(),
          positionedHeader(),
          loginMethods(),
        ],
      ),
    );
  }

  Widget positionedHeader() {
    return Positioned.fill(
      bottom: 150,
      child: Hero(
        tag: 'login_header',
        child: LoginHeader(),
      ),
    );
  }

  Widget loginMethods() {
    return Positioned.fill(
      child: SafeArea(
        child: Container(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
                  return Container(
                    height: 60.0,
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      child: (state is! LoginLoading)
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                LoginWithFacebookButton(),
                                LoginWithGoogleButton(),
                                LoginWithTwitterButton(),
                              ],
                            )
                          : Container(
                              height: 40,
                              child: SpinKitFadingCircle(
                                color: cYellow,
                              ),
                            ),
                    ),
                  );
                }),
                SizedBox(
                  height: 10,
                ),
                TextSSerif(
                  'use your social networks to log in!',
                  textStyle: TextStyle(
                    fontSize: 11,
                    color: cPinkLight,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
