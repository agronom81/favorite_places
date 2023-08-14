import 'package:favorite_places/models/place_item.dart';
import 'package:flutter/material.dart';

class PlaceItemScreen extends StatelessWidget {
  const PlaceItemScreen({super.key, required this.place});

  final PlaceItem place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        place.name,
      )),
      body: Center(
        child: Text(
          place.name,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
