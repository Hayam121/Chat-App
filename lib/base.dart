import 'package:flutter/material.dart';

abstract class BaseNavigator {
  void showLoading({String message});
  void showMessage(String message);

  void hideDialog();
}

abstract class BaseViewModel<NAV extends BaseNavigator> extends ChangeNotifier {
  NAV? navigator;
}

abstract class BaseView<T extends StatefulWidget, VM extends BaseViewModel>
    extends State<T> {
  late VM viewModel;

  VM initViewModel();

  @override
  void initState() {
    super.initState();
    viewModel = initViewModel();
  }

  void hideDialog() {
    Navigator.pop(context);
  }

  void showLoading({String message = "Loading"}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Row(
              children: [
                Text(message),
                const SizedBox(
                  width: 10,
                ),
                const CircularProgressIndicator(),
              ],
            ),
          ),
        );
      },
    );
  }

  void showMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(message),
        );
      },
    );
  }
}