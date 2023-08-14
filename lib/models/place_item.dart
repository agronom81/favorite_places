import 'package:uuid/uuid.dart';

const uuid = Uuid();

class PlaceItem {
  PlaceItem(
    this.name,
  ) : id = uuid.v4();

  final String id;
  final String name;
}
