import 'package:firebase_auth/firebase_auth.dart'
    show FirebaseAuth, FirebaseUser;

abstract class UserAuthProvider {
  final FirebaseAuth firebaseAuth;

  UserAuthProvider() : firebaseAuth = FirebaseAuth.instance;

  Future<FirebaseUser> signInWithEmailAndPassword(
      String email, String password);

  Future<FirebaseUser> createUserWithEmailAndPassword(
      String email, String password);

  Future<FirebaseUser> currentUser();

  Future<void> signOut();
}
