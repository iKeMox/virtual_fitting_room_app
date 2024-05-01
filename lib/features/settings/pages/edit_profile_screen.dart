import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:graduation_project_fitting_app/core/widgets/custom_text_field.dart';
import 'package:iconsax/iconsax.dart';

class EditProfileScreen extends StatefulWidget {
  static const String routeName = "edit";
  EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getUserProfileData();
  }

  void getUserProfileData() async {
    var token = await SharedPreferences.getInstance().then((value) => value.getString('token'));
    final response = await http.get(Uri.parse('http://192.168.1.13:8000/api/authenticated-user'), headers: {
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      var userData = json.decode(response.body)['data'];
      setState(() {
        nameController.text = userData['name'];
        emailController.text = userData['email'];
        // You can set other fields similarly if needed
      });
    } else {
      // Handle error response
    }
  }

  void editProfile() async {
    var token = await SharedPreferences.getInstance().then((value) => value.getString('token'));
    final response = await http.post(
      Uri.parse('http://192.168.1.13:8000/api/edit-profile-data'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'name': nameController.text,
        'email': emailController.text,
        'password': passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      // Handle success response
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Profile updated successfully'),
        ),
      );
      // back to home screen
      Navigator.pushNamed(context, 'layout');
    } else {
      // Handle error response
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to update profile'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
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
              const SizedBox(height: 10),
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
              const SizedBox(height: 10),
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
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: editProfile,
                child: const Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
