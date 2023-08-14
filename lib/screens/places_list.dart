import 'package:favorite_places/models/place_item.dart';
import 'package:favorite_places/screens/new_place.dart';
import 'package:favorite_places/screens/place_item.dart';
import 'package:flutter/material.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key, required this.places});

  final List<PlaceItem> places;

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text(
        'No any items',
        style: TextStyle(color: Colors.white),
      ),
    );

    if (places.isNotEmpty) {
      content = ListView.builder(
        itemCount: places.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text(
              places[index].name,
              style: const TextStyle(color: Colors.white),
            ),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => PlaceItemScreen(
                place: places[index],
              ),
            )),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your places'),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (ctx) => NewPlaceScreen())),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: content,
    );
  }
}
