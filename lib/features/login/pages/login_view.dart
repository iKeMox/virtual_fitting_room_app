
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/services/snack_bar_service.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../layout.dart';
import '../../../settings_provider.dart';
import '../../register/pages/register_view.dart';

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
      body: Center(
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
                  suffixWidget: Icon(Icons.alternate_email_rounded, size: 25),
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
                    if (formKey.currentState!.validate()) {}
                     Navigator.pushReplacementNamed(context, LayoutView.routeName);
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
    );
  }
}
