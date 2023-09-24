import 'package:chat/base.dart';
import 'package:chat/dataBaseUtils/database_utils.dart';
import 'package:chat/models/my_user.dart';
import 'package:chat/screens/create_account/creare_account_navigator.dart';
import 'package:chat/shared/components/firebase_errors.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateAccountViewModel extends BaseViewModel<CreateAccountNavigator> {
  String message = "";
  var auth = FirebaseAuth.instance;

  void createAccountWithFirebaseAuth(
      String email, String password, String firstName, String userName) async {
    try {
      navigator!.showLoading();
      final credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      message = 'Account Created';
      MyUser myUser = MyUser(
          id: credential.user?.uid ?? "",
          fName: firstName,
          userName: userName,
          email: email);
      DataBaseUtils.addUserToFireStore(myUser).then((value) {
        navigator!.hideDialog();
        navigator!.goToHome(myUser);
        return;
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseError.weakPassword) {
        message = "The password provided is too weak.";
      } else if (e.code == FirebaseError.email_in_use) {
        message = "This account already exists for that email.";
      }
    } catch (e) {
      message = "Something went wrong $e";
    }
    if (message != "") {
      navigator!.hideDialog();
      navigator!.showMessage(message);
    }
  }
}