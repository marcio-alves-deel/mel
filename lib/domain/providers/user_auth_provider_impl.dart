import 'package:firebase_auth/firebase_auth.dart';
import 'package:mel/providers.dart' show UserAuthProvider;

class UserAuthProviderImpl implements UserAuthProvider {
  @override
  Future<FirebaseUser> signInWithEmailAndPassword(
      String email, String password) async {
    AuthResult authResult = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    if (!(authResult is FirebaseUser)) throw AuthException;
    return authResult.user;
  }

  @override
  Future<FirebaseUser> currentUser() async {
    return await firebaseAuth.currentUser();
  }

  @override
  FirebaseAuth get firebaseAuth => firebaseAuth;

  @override
  Future<FirebaseUser> createUserWithEmailAndPassword(
      String email, String password) async {
    AuthResult authResult = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return authResult.user;
  }

  @override
  Future<void> signOut() {
    return firebaseAuth.signOut();
  }
}
