import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/homepage_image_1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text("Stylus", style: TextStyle(fontFamily: "Retrograde", fontSize: 24, color: Colors.white),),
                      alignment: Alignment.centerLeft,
                    ),
                    Column(
                      children: [
                        Text("Make Your Style.", style: TextStyle(fontSize: 50, color: Colors.white, fontFamily: "Retrograde"),),

                        Container(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            alignment: Alignment.bottomRight,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              spacing: -10,
                              children: [
                                MaterialButton(
                                  onPressed: () {},
                                  child: Text("Discover", style: TextStyle(color: Colors.white, fontFamily: "Retrograde"),),
                                  
                                ),
                                Icon(Icons.arrow_upward, size: 10, color: Colors.white,)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
