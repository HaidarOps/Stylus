import 'package:flutter/material.dart';

class Stylist {
  // what will each stylist have

  // image
  final String path_image_of_profile;

  // name
  final String name;

  // price
  final int price;

  // description
  final String description;

  //link to profile
  final String link_to_profile;

  Stylist({
    required this.path_image_of_profile,
    required this.name,
    required this.price,
    required this.description,
    required this.link_to_profile,
  });
}
