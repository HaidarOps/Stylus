import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylus/auth/auth_service.dart';
import 'package:stylus/pages/creating_stylist.dart';

class AccountPage extends StatefulWidget {
  AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String? username;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadusername();
  }

  Future<String?> _loadusername() async {
    final result = await AuthService().getCurrentUsername();
    if (mounted) {
      setState(() {
        username = result;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // container for the deck look
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black,
          ),
          width: MediaQuery.of(context).size.width * 0.8, // 30% of screen width
          height:
              MediaQuery.of(context).size.width *
              1.5, // Keep same as width for perfect circle
          // column for the look - goes down
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // profile pic
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                        width:
                            MediaQuery.of(context).size.width *
                            0.4, // 30% of screen width
                        height:
                            MediaQuery.of(context).size.width *
                            0.4, // Keep same as width for perfect circle
                        decoration: BoxDecoration(
                          shape:
                              BoxShape
                                  .circle, // Makes it circular regardless of size
                          border: Border.all(
                            width: 4, // Smaller border for profile picture
                            color: Colors.white, // Or any color you prefer
                          ),
                          // Optional shadow for depth
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withValues(alpha: 0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: ClipOval(
                          // Clip the child image into an oval/circle
                          child: Image.asset(
                            'assets/images/homepage_image_1.jpg',
                            fit:
                                BoxFit
                                    .cover, // This ensures the image covers the area properly
                          ),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 140,

                    child: Container(
                      margin: EdgeInsets.only(bottom: 40),
                      // box which is white
                      decoration: BoxDecoration(
                        border: Border.all(width: 5, color: Colors.white),
                        color: Colors.white,
                      ),
                      child: Text("@$username", style: TextStyle(fontSize: 18)),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  left: 70.0,
                  right: 70.0,
                ),
                child: Divider(color: Colors.white, thickness: 1, height: 1),
              ),

              // desciption
              // other options
              Padding(
                padding: const EdgeInsets.only(bottom: 60.0),
                child: const SizedBox(width: 10),
              ),

              // Account info
              Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: SvgPicture.asset(
                        'assets/svg/person.svg',
                        width: 30,
                        height: 30,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        "Account Information",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),

              // billing
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: SvgPicture.asset(
                          'assets/svg/billing.svg',
                          width: 30,
                          height: 30,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          "Billing / Payment Methods",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // settings
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: SvgPicture.asset(
                          'assets/svg/setting.svg',
                          width: 30,
                          height: 30,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          "Settings",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // help - contact us
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: SvgPicture.asset(
                          'assets/svg/info.svg',
                          width: 30,
                          height: 30,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          "Help / Contact Us",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
               // help - contact us
              GestureDetector(
                // on click go to page
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CreatingStylist())),

                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: SvgPicture.asset(
                            'assets/svg/info.svg',
                            width: 30,
                            height: 30,
                          ),
                        ),
                
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            "Become a stylist ?",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
