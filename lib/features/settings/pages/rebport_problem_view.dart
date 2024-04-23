import 'package:flutter/material.dart';
import 'package:graduation_project_fitting_app/core/widgets/custom_text_field.dart';

class ReportProblemView extends StatelessWidget {
  static const String routeName = "report";
  const ReportProblemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Report a problem"),
        leading: GestureDetector(
          child: const Icon( Icons.arrow_back_ios, color: Colors.black,  ),
          onTap: () {
            Navigator.pop(context);
          } ,
        ) ,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: 300,
                    child: CustomTextField(
                      hint: "Problem title",

                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: 300,
                    height: 300,
                    child: TextField(

                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 150),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Problem Description",
                        hintStyle: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.bold, color: Colors.grey.shade500)
                      ),
                    )
                  ),
                  SizedBox(height: 20,),
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
                          Text("Send", style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
