import 'package:flutter/material.dart';
import 'package:graduation_project_fitting_app/core/widgets/custom_text_field.dart';
import 'package:iconsax/iconsax.dart';

class EditProfileScreen extends StatelessWidget {
  static const String routeName = "edit";
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        leading: GestureDetector(
          child: const Icon( Icons.arrow_back_ios, color: Colors.black,  ),
          onTap: () {
            Navigator.pop(context);
          } ,
        ) ,
      ),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const Row(
                children: [
                  Text("Name"),
                ],
              ),
              CustomTextField(
                controller: nameController,
                hint: "name",
                suffixWidget: const Icon(Iconsax.edit),
              ),
              const SizedBox(height: 10,),
              const Row(
                children: [
                  Text("Email or phone"),
                ],
              ),
              CustomTextField(
                controller: emailController,
                hint: "Email or phone",
                suffixWidget: const Icon(Iconsax.edit),
              ),
              const SizedBox(height: 10,),
              const Row(
                children: [
                  Text("Password"),
                ],
              ),
              CustomTextField(
                controller: passwordController,
                isPassword: true,
                maxLines: 1,
                hint: "Password",
              ),
              const SizedBox(height: 100,),
              Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(50)
                ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Save changes", style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
                    ],
                  ))
            ],
          ),
        ),
      )
    );
  }
}
