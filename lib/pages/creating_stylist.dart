import 'package:flutter/material.dart';

class CreatingStylist extends StatelessWidget {
  const CreatingStylist({super.key});

  void make_stylist() async {
    // first get all the data

    // push it into auth to allow it to be passed into the table

    // produc
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: Column(
            children: [
              // text about how you have to add this info to become a stylist
              Text("Add your info below to become a stylist!"),

              // ask for descirpiton
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter your description here...",
                ),
              ),

              // ask for price
              TextField(
                decoration: InputDecoration(hintText: "Enter price here"),
              ),

              // button
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {},
                child: Text('Done'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
