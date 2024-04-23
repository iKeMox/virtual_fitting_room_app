import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  static const String routeName = "about";
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
        leading: GestureDetector(
          child: const Icon( Icons.arrow_back_ios, color: Colors.black,  ),
          onTap: () {
            Navigator.pop(context);
          } ,
        ) ,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("""The path that led us to where we are today was not easy, but we got here eventually. We take this opportunity to thank Allah for guiding and giving us strength, as well as providing us with valuable resources, both people and information, that helped us complete this task in the way you will see.\nWe want to thank the sovereignty of Dr. Mohamed Sayed Farag: We express our deep gratitude for your continued support and guidance during our university term. you were always willing to give advice and help us to achieve in our academic life.\nWe also would like to express our sincere gratitude to our supervisor Dr. Ibrahim Abdullatif for his help and guidance throughout the process of this project. The knowledge he provided greatly helped guide us to the correct progress path.\nLast but not least, we are extremely grateful to our parents for their support, love, sacrifices, and prayers that gave us strength from the beginning of our college experience till we reached the end of the road. We truly wouldn't have reached where we are today without them.""",
                  style: TextStyle(
                    fontWeight: FontWeight.w200 ,
                    fontSize: 18,
                  ),

                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
