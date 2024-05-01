
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/services/snack_bar_service.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../layout.dart';
import '../../../settings_provider.dart';
import '../../register/pages/register_view.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
class LoginView extends StatelessWidget {
  static const String routeName = "login";
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var vm = Provider.of<SettingsProvider>(context);
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: mediaQuery.height * 0.2,
                  ),
                  Text(
                    'Login',
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Hi! Welcome back, you,ve been missed',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                    child: Row(
                      children: [
                        Text("Email",
                            style: theme.textTheme.bodySmall
                                ?.copyWith(color: Colors.black),
                            textAlign: TextAlign.start),
                      ],
                    ),
                  ),
                  CustomTextField(
                    controller: emailController,
                    hint: "Enter your E-Mail Address",
                    suffixWidget: const Icon(Icons.alternate_email_rounded, size: 25),
                    keyboardType: TextInputType.emailAddress,
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "You must enter your E-mail address";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                    child: Row(
                      children: [
                        Text("Password",
                            style: theme.textTheme.bodySmall
                                ?.copyWith(color: Colors.black),
                            textAlign: TextAlign.start),
                      ],
                    ),
                  ),
                  CustomTextField(
                    controller: passwordController,
                    hint: "Enter your password",
                    obscuringCharacter: ".",
                    isPassword: true,
                    maxLines: 1,
                    keyboardType: TextInputType.emailAddress,
                    onValidate: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "You must enter your password";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {


                        var url = Uri.parse('http://192.168.1.13:8000/api/login');
                        http.post(url, body: {
                          'email': emailController.text,
                          'password': passwordController.text,
                        }).then((response) {

                          if (response.statusCode == 200) {
                            // response to get token
                            // save token in shared preferences
                            var token = jsonDecode(response.body)['data']['token'];
                            SharedPreferences.getInstance().then((prefs) {
                              prefs.setString('token', token);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Login Successfully'),
                                duration: const Duration(seconds: 5),
                                action: SnackBarAction(
                                  label: 'Close',
                                  onPressed: () {
                                    // Some code to undo the change.
                                  },
                                ),
                              ),
                            );

                            Navigator.pushReplacementNamed(context, LayoutView.routeName);
                          } else {
                            final snackBar = SnackBar(
                              content: Text('Invalid email or password'),
                              duration: const Duration(seconds: 5),
                              action: SnackBarAction(
                                label: 'Close',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                        });

                      }

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: mediaQuery.width * 0.36),
                      child: Text(
                        "Login",
                        style: theme.textTheme.titleLarge?.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  // const SizedBox(height: 20,),
                  const Divider(
                    thickness: 1,
                    indent: 30,
                    endIndent: 30,
                    color: Colors.grey,
                    height: 50,
                  ),

                  Text(
                    "Or login with",
                    style:
                        theme.textTheme.bodySmall?.copyWith(color: Colors.grey),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            print("Facebook");
                          },
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                width: 1,
                                color: theme.primaryColor,
                              ),
                            ),
                            child: Image.asset(
                              "assets/icons/facebook_icn.png",
                              scale: 1.5,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            print("gmail");
                          },
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                width: 1,
                                color: theme.primaryColor,
                              ),
                            ),
                            child: Image.asset(
                              "assets/icons/gmail_icn.png",
                              scale: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: theme.textTheme.bodySmall?.copyWith(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, RegisterView.routeName);

                        },
                        child: Text(
                          "Sign Up",
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
