import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';

class ProductDetailsView extends StatelessWidget {
  static const String routeName = "product_details";

  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    List<String> sizeList = ["Small", "Medium", "Large", "X Large", "XX Large",];
    List<String> colorList = ["White", "Black", "Red", "Blue", "Grey",];
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: mediaQuery.height * 0.04,
          ),
          Container(
            width: mediaQuery.width,
            height: mediaQuery.height * 0.3,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage("assets/images/banner4.jpg"),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 10,
                  blurRadius: 15,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Product name",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 360,
            width: mediaQuery.width,
            decoration: BoxDecoration(
              color: Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Product Details",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
                Divider(
                  thickness: 1.5,
                  color: Colors.grey.shade700,
                ),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "Size",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: CustomDropdown<String>(
                    items: sizeList,
                    onChanged: (value) {

                    },
                    decoration: CustomDropdownDecoration(
                      closedFillColor: Colors.grey.shade200,
                      hintStyle: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 18, color: Colors.grey.shade800),
                      listItemStyle: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 18, color: Colors.grey.shade800),
                      headerStyle: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 18, color: Colors.grey.shade800),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "Color",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: CustomDropdown<String>(
                    items: colorList,
                    onChanged: (value) {

                    },
                    decoration: CustomDropdownDecoration(
                      closedFillColor: Colors.grey.shade200,
                      hintStyle: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 18, color: Colors.grey.shade800),
                      listItemStyle: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 18, color: Colors.grey.shade800),
                      headerStyle: theme.textTheme.bodySmall?.copyWith(
                          fontSize: 18, color: Colors.grey.shade800),
                    ),
                  ),
                ),

              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: (){},
            child: Container(
              margin  : EdgeInsets.symmetric(horizontal: 10),
                width: mediaQuery.width,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15)
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Try it", style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
