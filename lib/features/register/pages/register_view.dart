
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/custom_text_field.dart';
import '../../../settings_provider.dart';
import '../../login/pages/login_view.dart';

class RegisterView extends StatelessWidget {
  static const String routeName = "register";
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();

  RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var vm = Provider.of<SettingsProvider>(context);
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: mediaQuery.height * 0.1,
                ),
                Text(
                  'Create Account',
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                Text(
                  'Fill your information below or register\nwith your social account',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                  child: Row(
                    children: [
                      Text("Name",
                          style: theme.textTheme.bodySmall
                              ?.copyWith(color: Colors.black),
                          textAlign: TextAlign.start),
                    ],
                  ),
                ),
                CustomTextField(
                  controller: nameController,
                  hint: "Enter your Full Name",
                  suffixWidget: Icon(Icons.person, size: 25),
                  keyboardType: TextInputType.name,
                  onValidate: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "You must enter your Name";
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
                  suffixWidget:
                      const Icon(Icons.alternate_email_rounded, size: 25),
                  keyboardType: TextInputType.emailAddress,
                  onValidate: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "You must enter your email";
                    }
                    var regex = RegExp(
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
                    );
                    if (!regex.hasMatch(value)) {
                      return "Invalid email";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 5),
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
                    var regex = RegExp(
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$',
                    );
                    if (!regex.hasMatch(value)) {
                      return "Password must contain at least one number\none uppercase letter\none lowercase letter\nand one special character";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 5),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                  child: Row(
                    children: [
                      Text("Confirm password",
                          style: theme.textTheme.bodySmall
                              ?.copyWith(color: Colors.black),
                          textAlign: TextAlign.start),
                    ],
                  ),
                ),
                CustomTextField(
                  hint: "Enter your password",
                  obscuringCharacter: ".",
                  isPassword: true,
                  maxLines: 1,
                  keyboardType: TextInputType.emailAddress,
                  onValidate: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "You must enter your password";
                    }
                    if (value != passwordController.text) {
                      return "Password not matched";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.primaryColor,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: mediaQuery.width * 0.33),
                    child: Text(
                      "Sign Up",
                      style: theme.textTheme.titleLarge?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const Divider(
                  thickness: 1,
                  indent: 30,
                  endIndent: 30,
                  color: Colors.grey,
                  height: 50,
                ),
                Text(
                  "Or sign up with",
                  style:
                      theme.textTheme.bodySmall?.copyWith(color: Colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          print("facebook");
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
                      "Already have an account?",
                      style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, LoginView.routeName);
                      },
                      child: Text(
                        "Sign In",
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
    );
  }
}
