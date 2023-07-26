import 'package:flutter/material.dart';

import '../../utils/helper.dart';
import '../widgets/common/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late bool hasAccount;

  @override
  void initState() {
    hasAccount = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Center(
                child: Text(
                  "Libreasy",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
            ),
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.75,
              padding: const EdgeInsets.symmetric(
                  vertical: 20, horizontal: Helper.hPadding),
              child: Column(
                children: [
                  hasAccount ? const SignInWidget() : const SignUpWidget(),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      setState(() {
                        hasAccount = !hasAccount;
                      });
                    },
                    child: Text(
                      hasAccount
                          ? "New account? Sign up"
                          : "Already have an account? Sign in",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class SignInWidget extends StatefulWidget {
  const SignInWidget({super.key});

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  late String email;

  late String password;

  @override
  void initState() {
    email = '';
    password = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Widget page
        const Text(
          "SIGN IN",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),

        const SizedBox(height: 30),

        //Email
        CustomTextField(
          keyboardType: TextInputType.emailAddress,
          hintText: "Email",
          onSubmitted: (val) {
            setState(() {
              email = val;
            });
          },
          prefixIcon: Icons.email,
        ),

        const SizedBox(height: 10),

        //Password
        CustomTextField(
          keyboardType: TextInputType.visiblePassword,
          hintText: "Password",
          onSubmitted: (val) {
            setState(() {
              password = val;
            });
          },
          prefixIcon: Icons.lock,
        ),

        const SizedBox(height: 20),

        //Forgot
        InkWell(
          onTap: () {},
          child: const Text(
            "Forgot password?",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),

        const SizedBox(height: 20),

        //Button
        TextButton(
          // padding: const EdgeInsets.symmetric(vertical: 16),
          // minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            // membersProvider.signIn(email: email, password: password);
            // if (!membersProvider.loggedIn) {
            // showDialog(
            //   builder: (context) => const AlertDialogBox(
            //     message: "Failed to sign in. Invalid Credentials",
            //   ),
            //   context: context,
            // );
            // }
          },
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            // minimumSize: Size.fromWidth(MediaQuery.of(context).size.width),
            foregroundColor: Colors.lightBlueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: const Text(
            "SIGN IN",
            style: TextStyle(
              letterSpacing: 1.4,
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  late String firstName, lastName, email, password, cPassword;
  late int age;

  @override
  void initState() {
    firstName = '';
    lastName = '';
    email = '';
    password = '';
    cPassword = '';
    age = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          //Label
          const Text(
            "SIGN UP",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 15),

          //Name
          Row(
            children: [
              //First Name
              Expanded(
                child: CustomTextField(
                  keyboardType: TextInputType.name,
                  hintText: "First name",
                  onSubmitted: (val) {
                    setState(() {
                      firstName = val;
                    });
                  },
                  prefixIcon: Icons.person,
                ),
              ),

              const SizedBox(width: 5),

              //Last Name
              Expanded(
                child: CustomTextField(
                  keyboardType: TextInputType.name,
                  hintText: "Last name",
                  onSubmitted: (val) {
                    setState(() {
                      lastName = val;
                    });
                  },
                  prefixIcon: Icons.person,
                ),
              ),
            ],
          ),

          const SizedBox(height: 5),

          //Email
          CustomTextField(
            keyboardType: TextInputType.emailAddress,
            hintText: "Email",
            onSubmitted: (val) {
              setState(() {
                email = val;
              });
            },
            prefixIcon: Icons.email,
          ),

          const SizedBox(height: 5),

          //Password
          CustomTextField(
            keyboardType: TextInputType.visiblePassword,
            hintText: "Password",
            onSubmitted: (val) {
              setState(() {
                password = val;
              });
            },
            prefixIcon: Icons.lock,
          ),

          const SizedBox(height: 5),

          //Confirm Password
          CustomTextField(
            keyboardType: TextInputType.visiblePassword,
            hintText: "Confirm Password",
            onSubmitted: (val) {
              setState(() {
                cPassword = val;
              });
            },
            prefixIcon: Icons.lock,
          ),

          const SizedBox(height: 5),

          //Age
          CustomTextField(
            keyboardType: TextInputType.number,
            hintText: "Age",
            onSubmitted: (val) {
              setState(() {
                age = int.tryParse(val) ?? 0;
              });
            },
            prefixIcon: Icons.tag,
          ),

          const SizedBox(height: 10),

          //Button
          TextButton(
            onPressed: () async {
              if (password.trim() != cPassword.trim()) {
                // return showDialog(
                //   builder: (context) => const AlertDialogBox(
                //     message: "Passwords don't match",
                //   ),
                //   context: context,
                // );
              }
              if (email.trim().isEmpty ||
                  password.trim().isEmpty ||
                  firstName.trim().isEmpty ||
                  lastName.trim().isEmpty ||
                  age <= 0) {
                // return showDialog(
                //   builder: (context) => const AlertDialogBox(
                //     message: "Please enter all fields",
                //   ),
                //   context: context,
                // );
              }
              // await membersProvider.signUp(
              //   email: email.trim(),
              //   password: password.trim(),
              //   firstName: firstName.trim(),
              //   lastName: lastName.trim(),
              //   age: age,
              // );
              // if (!membersProvider.loggedIn) {
              //   showDialog(
              //     builder: (context) => const AlertDialogBox(
              //       message: "Failed to sign up",
              //     ),
              //     context: context,
              //   );
              // }
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              foregroundColor: Colors.lightBlueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: const Text(
              "SIGN UP",
              style: TextStyle(
                letterSpacing: 1.4,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
