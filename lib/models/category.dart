class RoomCategory {
  static String sportsID = "sports";
  static String musicID = "music";
  static String moviesID = "movies";

  String id;
  late String name;
  late String image;

  RoomCategory(this.id, this.name, this.image);

  RoomCategory.fromId(this.id) {
    name = id;
    image = 'assets/images/$id.png';
  }

  static List<RoomCategory> getCategories() {
    return [
      RoomCategory.fromId(sportsID),
      RoomCategory.fromId(musicID),
      RoomCategory.fromId(moviesID),
    ];
  }
}