import 'package:google_sign_in/google_sign_in.dart';

class SignIn {
  static GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  static GoogleSignInAccount currentUser;

  static Future<void> handleSignIn() async {
    try {
      await SignIn.googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }
}
