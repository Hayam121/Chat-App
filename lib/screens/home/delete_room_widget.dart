import 'package:flutter/material.dart';

import '../../models/category.dart';

class DeleteRoomWidget extends StatefulWidget {
  @override
  State<DeleteRoomWidget> createState() => _DeleteRoomWidgetState();
}

class _DeleteRoomWidgetState extends State<DeleteRoomWidget> {
  var categories = RoomCategory.getCategories();
  late RoomCategory selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Container();
    //DropdownMenuItem(child: DropdownButton(
    //     items: items,
    //     onChanged: onChanged),
    // );
  }
}