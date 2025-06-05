import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylus/components/stylist_item.dart';
import 'package:stylus/models/stylist.dart';
import 'package:stylus/models/stylist_list.dart';

class StylistsPage extends StatefulWidget {
  const StylistsPage({super.key});

  @override
  State<StylistsPage> createState() => _StylistsPageState();
}

class _StylistsPageState extends State<StylistsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<StylistList>(
      builder:
          (context, value, child) => Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 items per row
                    childAspectRatio:
                        0.75, // Adjust this value based on your item's height/width ratio
                    crossAxisSpacing: 10, // Horizontal spacing between items
                    mainAxisSpacing: 10, // Vertical spacing between items
                  ),
                  itemCount: value.stylist_list.length,
                  itemBuilder: (context, index) {
                    // get individual stylist
                    Stylist currentStylist = value.getStylistList()[index];

                    return GestureDetector(
                      child: StylistItem(stylist: currentStylist),
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: MediaQuery.of(context).size.width * 2,
                              child: Center(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      StylistItem(stylist: currentStylist),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
    );
  }
}
