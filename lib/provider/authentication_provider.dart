import 'package:flutter/material.dart';

class AuthenticationProvider with ChangeNotifier {
  // final firestoreInstance = FirebaseFirestore.instance;

  void login(String email, String password, BuildContext context) async {
    // EasyLoading.show(status: "Please wait...");
    // try {
    //   await FirebaseAuth.instance
    //       .signInWithEmailAndPassword(email: email, password: password);
    //   Navigator.pushReplacement(context,
    //       MaterialPageRoute(builder: (_) => const BinList()));
    //   EasyLoading.showSuccess("Login Successful");
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'user-not-found') {
    //     EasyLoading.dismiss();
    //     return showDialog(
    //       context: context,
    //       builder: (_) => const CustomAlertDialog(
    //         title: 'Sign in',
    //         description:
    //             'Sorry, we cant\'t find an account with this email address. Please try again or create a new account.',
    //         bText: 'Try again',
    //       ),
    //     );
    //   } else if (e.code == 'wrong-password') {
    //     EasyLoading.dismiss();
    //     return showDialog(
    //       context: context,
    //       builder: (_) => const CustomAlertDialog(
    //         title: 'Incorrect Password',
    //         description: 'Your username or password is incorrect.',
    //         bText: 'Try again',
    //       ),
    //     );
    //   }
    // }
  }

  void signUp(String email, String password,
      BuildContext context) async {
    // EasyLoading.show(status: "Please wait...");
    // try {
    //   await FirebaseAuth.instance
    //       .createUserWithEmailAndPassword(email: email, password: password);
    //   Navigator.pushReplacement(context,
    //       MaterialPageRoute(builder: (_) => const BinList()));
    //   EasyLoading.showSuccess("Signup Successful");
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'email-already-in-use') {
    //     EasyLoading.dismiss();
    //     return showDialog(
    //       context: context,
    //       builder: (_) => const CustomAlertDialog(
    //         title: 'Email address already in use',
    //         description: 'Please sign in.',
    //         bText: 'OK',
    //       ),
    //     );
    //   }
    // } catch (e) {
    //   EasyLoading.dismiss();
    // }
    // notifyListeners();
  }

  void signOut(BuildContext context) async {
    // await FirebaseAuth.instance.signOut();
    // Navigator.pushReplacement(context,
    //     MaterialPageRoute(builder: (_) => const LoginScreen()));
  }

}
