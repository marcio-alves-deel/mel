import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:mel/core.dart' show NoParams;
import 'package:mel/models.dart' show UserModel;
import 'package:mel/usecases.dart'
    show FacebookAuth, GoogleAuth, Current, FacebookParams;

import 'auth_state.dart';

class AuthController extends RxController {
  final FacebookAuth facebookAuth;
  final GoogleAuth googleAuth;
  final Current current;
  final hasSession = false.obs;
  final state = Empty().obs;

  AuthController({
    @required FacebookAuth fAuth,
    @required GoogleAuth gAuth,
    @required Current current,
  })  : facebookAuth = fAuth,
        googleAuth = gAuth,
        current = current;

  @override
  onInit() async {
    ever(hasSession, await session());
  }

  bool get getSession => hasSession.value;

  dynamic get getState => state.value;

  UserModel get getCurrent => (state.value as Loaded).props[0] as UserModel;

  Future session() async {
    state.value = Loading().obs;
    final result = await current(NoParams());
    result.fold((l) {
      state.value = Error(message: 'Sign in canceled!');
      hasSession.value = false;
    }, (r) {
      state.value = new Loaded(user: r);
      hasSession.value = true;
    });

    if (hasSession.value && Get.currentRoute != '/home')
      Get.offNamed('/home');
    else if (!hasSession.value && Get.currentRoute != '/sign_in')
      Get.offNamed('/sign_in');
  }

  Future<void> authenticateFacebook() async {
    state.value = Loading().obs;
    final result = await facebookAuth(
      FacebookParams(authInstance: FacebookLogin()),
    );
    result.fold(
      (l) {
        state.value = Error(message: 'Sign in canceled!');
      },
      (r) {
        state.value = new Loaded(user: r);
      },
    );
  }
}
