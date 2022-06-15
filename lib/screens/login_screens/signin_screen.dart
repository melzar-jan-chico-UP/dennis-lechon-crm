import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dennis_lechon_crm/screens/home_screen_new/dashboard.dart';
import 'package:dennis_lechon_crm/screens/login_screens/resetpassword_screen.dart';
import 'package:dennis_lechon_crm/screens/login_screens/signup_screen.dart';
import 'package:dennis_lechon_crm/widgets/loading.dart';
import 'package:dennis_lechon_crm/widgets/reusable_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";

class SignIn extends StatefulWidget {
  const SignIn({Key? key, required this.firestore}) : super(key: key);
  final FirebaseFirestore firestore;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  bool loading = false;
  //late final FirebaseFirestore firestore;

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    return loading
        ? const Loading()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            key: const Key("Sign In"),
            backgroundColor: const Color.fromARGB(255, 185, 17, 5),
            body: Stack(children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    //Image needs to be changed to avoid stretching
                    image: AssetImage("assets/images/lechon_loginpage.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(20,
                            MediaQuery.of(context).size.height * 0.1, 20, 0),
                        child: Column(children: <Widget>[
                          Image.asset(
                            "assets/images/dennislogo.png",
                            fit: BoxFit.fitWidth,
                            width: 240,
                            height: 240,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          reusableTextField(
                              "Enter Email",
                              Icons.person_outline,
                              false,
                              _emailTextController,
                              const Key("Email Key")),
                          const SizedBox(
                            height: 20,
                          ),
                          reusableTextField(
                              "Enter Password",
                              Icons.lock_outline,
                              true,
                              _passwordTextController,
                              const Key("Pass Key")),
                          const SizedBox(
                            height: 5,
                          ),
                          forgotPassword(context),
                          firebaseUIButton(context, "LOG IN", () {
                            FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: _emailTextController.text,
                                    password: _passwordTextController.text)
                                .then((value) async {
                              setState(() => loading = true);
                              await Future.delayed(const Duration(seconds: 1));
                              var user = auth.currentUser!;
                              final emailID = user.email;
                              debugPrint("Logged In Successfully!");
                              ScaffoldMessenger.of(context).showSnackBar(
                                  generalSnackbar('Welcome back $emailID'));
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dashboard(
                                          firestore: widget.firestore)));
                            }).onError(
                                    (FirebaseAuthException error, stackTrace) {
                              var errorcode = error.code;
                              var msg = '';

                              switch (errorcode) {
                                case 'invalid-email':
                                  msg = 'Inputted email is invalid. Try again.';
                                  break;
                                case 'user-disabled':
                                  msg =
                                      'This user has been disabled from the app.';
                                  break;
                                case 'user-not-found':
                                  msg =
                                      'This email does not have an account yet.';
                                  break;
                                case 'wrong-password':
                                  msg =
                                      'Inputted password was incorrect. Try again.';
                                  break;
                                default:
                                  msg =
                                      'Log-in failed. Please contact the administrator.';
                              }

                              // Error Prompt here
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Login Error"),
                                      content: Text(msg),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text("OK"))
                                      ],
                                    );
                                  });
                              // Ends here
                            });
                          }, const Key("SignIn Key")),
                          signUpOption(),
                        ])),
                  ))
            ]));
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          key: const Key("Sign Up Clickable"),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SignUp(firestore: widget.firestore)));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget forgotPassword(BuildContext context) {
    return Container(
      key: const Key("Forgot Password Key"),
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomCenter,
      child: TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ResetPassword(
                      firestore: widget.firestore,
                    ))),
      ),
    );
  }
}
