import 'package:chat/dataBaseUtils/database_utils.dart';

import '../../base.dart';
import '../../models/room.dart';

class HomeViewModel extends BaseViewModel {
  List<Room> rooms = [];

  void readRooms() {
    DataBaseUtils.readRoomsFromFireStore().then((value) {
      rooms = value;
    }).catchError((error) {
      navigator!.showMessage(error.toString());
    });
  }
}