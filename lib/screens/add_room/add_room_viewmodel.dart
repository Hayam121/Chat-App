import 'package:chat/models/room.dart';

import '../../base.dart';
import '../../dataBaseUtils/database_utils.dart';
import 'add_room_navigator.dart';

class AddRoomViewModel extends BaseViewModel<AddRoomNavigator> {
  void addRoomToDb(String title, String description, String catId) {
    Room room = Room(title: title, description: description, catId: catId);

    DataBaseUtils.addRoomToFireStore(room).then((value) {
      navigator!.roomCreated();
    }).catchError((error) {});
  }
}