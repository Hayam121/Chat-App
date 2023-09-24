class Room {
  static const String COLLECTION_NAME = 'Rooms';

  String id;
  String title;
  String description;
  String catId;

  Room({this.id = "",
    required this.title,
    required this.description,
    required this.catId});

  Room.fromJson(Map<String, dynamic> json)
      : this(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    catId: json["catId"],
        );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "catId": catId
    };
  }
//
// static List<Room> deleteRoom() {
//   return [
//     Room.fromJson(),
//
//   ];
// }
}