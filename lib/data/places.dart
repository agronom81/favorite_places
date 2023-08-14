import 'package:favorite_places/models/place_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final places = [
  PlaceItem('My office'),
  PlaceItem('First Place'),
];

class PlaceNotifier extends StateNotifier<List<PlaceItem>> {
  PlaceNotifier() : super([]);

  bool addPlace(PlaceItem place) {
    state = [...state, place];
    return true;
  }
}

final placeProvider = StateNotifierProvider<PlaceNotifier, List<PlaceItem>>(
    (ref) => PlaceNotifier());
