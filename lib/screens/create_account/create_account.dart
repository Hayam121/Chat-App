import 'package:chat/base.dart';
import 'package:chat/models/my_user.dart';
import 'package:chat/screens/create_account/creare_account_navigator.dart';
import 'package:chat/screens/create_account/create_account_viewmodel.dart';
import 'package:chat/screens/home/home_view.dart';
import 'package:chat/screens/login_screen/login_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/my_provider.dart';

class CreateAccount extends StatefulWidget {
  static const String routeName = 'create-account';

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState
    extends BaseView<CreateAccount, CreateAccountViewModel>
    implements CreateAccountNavigator {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var fNameController = TextEditingController();
  var userNameController = TextEditingController();
  bool visible = true;

  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/main_bg.png',
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                title: const Text(
                  'Create Account',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18.0,
                ),
                child: Form(
                  key: formKey,
                  child: Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .25),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            validator: (text) {
                              if (text!.trim() == "") {
                                return "Please Enter Your First Name";
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                            controller: fNameController,
                            decoration: InputDecoration(
                                hintText: "First Name",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide:
                                        const BorderSide(color: Colors.blue))),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            validator: (text) {
                              if (text!.trim() == "") {
                                return "Please Enter Your User Name";
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                            controller: userNameController,
                            decoration: InputDecoration(
                                hintText: "UserName",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide:
                                        const BorderSide(color: Colors.blue))),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: emailController,
                            validator: (text) {
                              if (text!.trim() == "") {
                                return "Please Enter Your Email";
                              }
                              final bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(text);
                              if (emailValid == false) {
                                return "Please Enter Valid Email";
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                hintText: "Email",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide:
                                        const BorderSide(color: Colors.blue))),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: passwordController,
                            validator: (text) {
                              if (text!.trim() == "") {
                                return "Please Enter Your Password";
                              }
                              return null;
                            },
                            obscureText: visible,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                                hintText: "Password",
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        visible = !visible;
                                      });
                                    },
                                    icon: Icon(
                                      visible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.blue,
                                    )),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide:
                                        const BorderSide(color: Colors.blue))),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * .06,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                elevation: 10.0,
                              ),
                              onPressed: () {
                                validateForm();
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "Create Account",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.blue),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.blue,
                                  )
                                ],
                              ),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, LoginScreen.routeName);
                              },
                              child: const Text(
                                "I have an Account Login Here ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void validateForm() {
    if (formKey.currentState!.validate()) {
      viewModel.createAccountWithFirebaseAuth(
          emailController.text,
          passwordController.text,
          fNameController.text,
          userNameController.text);
    }
  }

  @override
  CreateAccountViewModel initViewModel() {
    return CreateAccountViewModel();
  }

  @override
  void goToHome(MyUser myUser) {
    var provider = Provider.of<MyProvider>(context, listen: false);
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }
}