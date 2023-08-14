import 'package:favorite_places/data/places.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final placesProviders = Provider((ref) {
  return places;
});
