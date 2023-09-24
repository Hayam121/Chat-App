// import 'package:flutter/material.dart';
// // ignore: unused_import, implementation_imports
// import 'package:flutter/src/animation/animation_controller.dart';
// // ignore: implementation_imports, unnecessary_import
// import 'package:flutter/src/widgets/framework.dart';
// // ignore: unused_import, implementation_imports
// import 'package:flutter/src/widgets/placeholder.dart';
// // ignore: unused_import, implementation_imports
// import 'package:flutter/src/widgets/ticker_provider.dart';

// class Register extends StatefulWidget {
//   const Register({super.key});

//   @override
//   State<Register> createState() => _RegisterState();
// }

// class _RegisterState extends State<Register> {
//   set size(int size) {}

//   @override
//   Widget build(BuildContext context) {
//     // ignore: unused_local_variable
//     bool obscureText;
//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 20,
//         ),
//         width: MediaQuery.of(context).size.width,
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             children: [
//               const SizedBox(height: 200),
//               const Text(
//                 'REGESTER',
//                 style: TextStyle(
//                   fontSize: 50,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const Text(
//                 'Regester now brows our hot offers',
//                 style: TextStyle(
//                   fontSize: 15,
//                 ),
//               ),
//               const SizedBox(
//                 height: 50,
//               ),
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Name',
//                   prefixIcon: const Icon(Icons.person),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: const BorderSide(
//                       color: Colors.blue,
//                       width: 1.0,
//                     ),
//                   ),
//                   disabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20),
//                       borderSide: const BorderSide(
//                         color: Colors.blue,
//                         width: 1.0,
//                       )),
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Email',
//                   prefixIcon: const Icon(Icons.email),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: const BorderSide(
//                       color: Colors.blue,
//                       width: 1.0,
//                     ),
//                   ),
//                   disabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20),
//                       borderSide: const BorderSide(
//                         color: Colors.blue,
//                         width: 1.0,
//                       )),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               TextField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   /*  prefixIcon: const Icon(Icons.password_rounded),*/
//                   suffixIcon: Icon(FontAwesomeIcons.eyeSlash),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: const BorderSide(
//                       color: Colors.blue,
//                       width: 1.0,
//                     ),
//                   ),
//                   disabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: const BorderSide(
//                       color: Colors.blue,
//                       width: 1.0,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Phone',
//                   prefixIcon: const Icon(Icons.phone),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: const BorderSide(
//                       color: Colors.blue,
//                       width: 1.0,
//                     ),
//                   ),
//                   disabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20),
//                     borderSide: const BorderSide(
//                       color: Colors.blue,
//                       width: 1.0,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               MaterialButton(
//                   elevation: 5.0,
//                   color: Colors.blue,
//                   padding: const EdgeInsets.symmetric(
//                     vertical: 20,
//                     horizontal: 80,
//                   ),
//                   // ignore: sort_child_properties_last
//                   child: const Text(
//                     'REGESTER',
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 23,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   shape: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(50),
//                       borderSide: BorderSide.none),
//                   onPressed: () {}),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// mixin FontAwesomeIcons {
//   static IconData? eyeSlash;
// }
