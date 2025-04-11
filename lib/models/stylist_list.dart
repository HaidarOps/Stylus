import 'package:flutter/material.dart';
import 'package:stylus/models/stylist.dart';

class StylistList extends ChangeNotifier {
  List<Stylist> stylist_list = [
    Stylist(
      path_image_of_profile: 'assets/images/homepage_image_1.jpg',
      name: 'Alice',
      price: 32,
      description: "A wonderful stylist",
      link_to_profile: "www.wtf.com",
    ),
        Stylist(
      path_image_of_profile: 'assets/images/homepage_image_1.jpg',
      name: 'elizbeth',
      price: 64,
      description: "A wonderful stylist",
      link_to_profile: "www.wtf.com",
    ),
            Stylist(
      path_image_of_profile: 'assets/images/homepage_image_1.jpg',
      name: 'elizbeth',
      price: 64,
      description: "A wonderful stylist",
      link_to_profile: "www.wtf.com",
    ),
            Stylist(
      path_image_of_profile: 'assets/images/homepage_image_1.jpg',
      name: 'elizbeth',
      price: 64,
      description: "A wonderful stylist",
      link_to_profile: "www.wtf.com",
    ),
            Stylist(
      path_image_of_profile: 'assets/images/homepage_image_1.jpg',
      name: 'elizbeth',
      price: 64,
      description: "A wonderful stylist",
      link_to_profile: "www.wtf.com",
    ),
  ];

  // get a stylist_list
  List<Stylist> getStylistList(){
    return stylist_list;
  }


  // add a stylist
  void addStylist(Stylist current_stylist) {
    stylist_list.add(current_stylist);
    notifyListeners();
  }

  // remove a stylist
  void removeStylist(Stylist current_stylist) {
    stylist_list.remove(current_stylist);
    notifyListeners();
  }

}
