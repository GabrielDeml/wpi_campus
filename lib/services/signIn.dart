import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignIn {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isUserSignedIn = false;

  GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future<FirebaseUser> getUser() async {
    final FirebaseUser currentUser = await _auth.currentUser();
    return currentUser;
  }

  Future<bool> checkIfUserIsSignedIn() async {
    var userSignedIn = await googleSignIn.isSignedIn();
    isUserSignedIn = userSignedIn;
    return isUserSignedIn;
  }

  Future<FirebaseUser> handleSignIn() async {
    FirebaseUser user;
    bool userSignedIn = await googleSignIn.isSignedIn();
    isUserSignedIn = userSignedIn;

    if (isUserSignedIn) {
      user = await _auth.currentUser();
    } else {
      final GoogleSignInAccount googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      user = (await _auth.signInWithCredential(credential)).user;
      userSignedIn = await googleSignIn.isSignedIn();
      isUserSignedIn = userSignedIn;
    }

    return user;
  }
}
