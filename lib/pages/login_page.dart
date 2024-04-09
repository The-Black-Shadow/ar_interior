import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ar_interior/components/my_textfield.dart';
import 'package:ar_interior/components/my_button.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;

  LoginPage({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  // sign user in method
  void signUserIn() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // remove the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // remove the loading circle
      Navigator.pop(context);

      // show error message
      showErrorMessage(e.code);
    }
  }

  // error message to user
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(message,
                style: const TextStyle(
                  color: Colors.white,
                )),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Logo
              Icon(
                Icons.code,
                size: 100,
                color: Colors.black,
              ),
              SizedBox(height: 20),
              // Welcome Text
              Text(
                'Welcome to the new reality of AR',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: theme.textTheme.bodyText1!.color,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),
              // Email TextField
              MyTextField(
                controller: emailController,
                hintText: 'E-mail',
                obsecureText: false,
              ),
              SizedBox(height: 10),
              // Password TextField
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obsecureText: true,
              ),

              SizedBox(height: 60),
              // Sign In Button
              MyButton(
                onTap: () {
                  signUserIn();
                },
                text: 'Sign In',
              ),
              SizedBox(height: 20),
              // Register Text
              GestureDetector(
                onTap: widget.onTap,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member? ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Register Now',
                        style: TextStyle(
                          color: Colors.teal[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
