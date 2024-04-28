import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ChatBotView extends StatelessWidget {
  static const String routeName = "chatBot";

  const ChatBotView({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: mediaQuery.height * 0.04),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                GestureDetector(
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60.0),
                  child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.transparent,
                      child: Image.asset(
                        "assets/icons/chat_bot.png",
                        scale: 0.01,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("Chat Bot", style: theme.textTheme.titleLarge),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            margin: EdgeInsets.only(top: mediaQuery.height * 0.04),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: mediaQuery.width*0.9,
                    height: 35,
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Type your message here",
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon:const Icon(Iconsax.send_14),
                        ),
                        
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
