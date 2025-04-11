import 'package:flutter/material.dart';
import 'package:stylus/models/stylist.dart';

class StylistItem extends StatefulWidget {
  Stylist stylist;
  StylistItem({super.key, required this.stylist});

  @override
  State<StylistItem> createState() => _StylistItemState();
}

class _StylistItemState extends State<StylistItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(25),
      child: Column(
        children: [
          // name
          Text(
            widget.stylist.name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          // image with constrained size
          Container(
            child: Image.asset(
              widget.stylist.path_image_of_profile,
              fit: BoxFit.cover, // This will cover the area without distortion
            ),
          ),
          //price
          Text('\$${widget.stylist.price}'),
          //description
          Text(widget.stylist.description)
        ],
      ),
    );
  }
}