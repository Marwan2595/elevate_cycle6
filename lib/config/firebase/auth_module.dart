import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AuthModule {
  @singleton
  AuthService get authService => AuthService(FirebaseAuth.instance);
}

/// Thin, reusable wrapper around Firebase Auth (email + Google).
class AuthService {
  AuthService(this._auth);
  final FirebaseAuth _auth;

  bool _googleInitialized = false;

  User? get currentUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<UserCredential> signInWithEmail(String email, String password) =>
      _auth.signInWithEmailAndPassword(email: email, password: password);

  Future<UserCredential> registerWithEmail(String email, String password) =>
      _auth.createUserWithEmailAndPassword(email: email, password: password);

  Future<UserCredential> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn.instance;
    if (!_googleInitialized) {
      await googleSignIn.initialize();
      _googleInitialized = true;
    }
    final account = await googleSignIn.authenticate();
    final credential = GoogleAuthProvider.credential(
      idToken: account.authentication.idToken,
    );
    return _auth.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    await _auth.signOut();
    if (_googleInitialized) await GoogleSignIn.instance.signOut();
  }
}
