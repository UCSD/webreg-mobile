// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:webreg_mobile_flutter/app_constants.dart';
// import 'package:webreg_mobile_flutter/app_styles.dart';
// import 'package:webreg_mobile_flutter/core/providers/user.dart';

// class Login extends StatefulWidget {
//   @override
//   _LoginState createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   late UserDataProvider _userDataProvider;
//   final TextEditingController _emailTextFieldController =
//       TextEditingController();
//   final TextEditingController _passwordTextFieldController =
//       TextEditingController();
//   bool _passwordObscured = true;

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     _userDataProvider = Provider.of<UserDataProvider>(context);
//   }

//   @override
//   Widget build(BuildContext buildContext) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0.0,
//         title: const Text('UC San Diego WebReg'),
//       ),
//       backgroundColor: lightPrimaryColor,
//       body: !_userDataProvider.isLoading!
//           ? buildLoginWidget()
//           : const CircularProgressIndicator(),
//     );
//   }

//   Widget buildLoginWidget() {
//     return Center(
//         child: ConstrainedBox(
//             constraints: const BoxConstraints(maxWidth: 300),
//             child: SingleChildScrollView(
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                   Image.asset(
//                     'assets/images/UCSanDiegoLogo-nav.png',
//                     fit: BoxFit.contain,
//                     height: 50,
//                     color: Colors.white,
//                   ),
//                   const SizedBox(height: 100.0),
//                   Padding(
//                       padding: const EdgeInsets.only(top: 0.0),
//                       child: Container(
//                         decoration: BoxDecoration(
//                             borderRadius:
//                                 const BorderRadius.all(Radius.circular(100)),
//                             color: Theme.of(context)
//                                 .colorScheme
//                                 .secondary), //lightTextFieldBorderColor,
//                         child: TextField(
//                           style: const TextStyle(
//                               textBaseline: TextBaseline.alphabetic,
//                               color: Colors.black),
//                           decoration: const InputDecoration(
//                             hintText: 'UCSD Email',
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(5)),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(5)),
//                             ),
//                             contentPadding: EdgeInsets.only(left: 10),
//                             hintStyle: TextStyle(color: ColorPrimary),
//                             fillColor: Colors.white,
//                             filled: true,
//                           ),
//                           keyboardType: TextInputType.emailAddress,
//                           controller: _emailTextFieldController,
//                         ),
//                       )),
//                   const SizedBox(height: 15),
//                   Container(
//                     decoration: BoxDecoration(
//                         borderRadius:
//                             const BorderRadius.all(Radius.circular(100)),
//                         color: Theme.of(context).colorScheme.secondary),
//                     child: TextField(
//                       style: const TextStyle(
//                         textBaseline: TextBaseline.alphabetic,
//                         color: Colors.black,
//                       ),
//                       decoration: InputDecoration(
//                         hintText: 'Password',
//                         suffixIcon: IconButton(
//                           icon: Icon(
//                             // Based on passwordObscured state choose the icon
//                             _passwordObscured
//                                 ? Icons.visibility_off
//                                 : Icons.visibility,
//                             color: Theme.of(context).primaryColorDark,
//                           ),
//                           onPressed: () => _toggle(),
//                         ),
//                         focusedBorder: const OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.black,
//                           ),
//                           borderRadius: BorderRadius.all(Radius.circular(5)),
//                         ),
//                         enabledBorder: const OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.black,
//                           ),
//                           borderRadius: BorderRadius.all(Radius.circular(5)),
//                         ),
//                         contentPadding: const EdgeInsets.only(left: 10),
//                         hintStyle: const TextStyle(color: ColorPrimary),
//                         fillColor: Colors.white,
//                         filled: true,
//                       ),
//                       obscureText: _passwordObscured,
//                       controller: _passwordTextFieldController,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 30.0),
//                     child: Row(
//                       children: <Widget>[
//                         Expanded(
//                             child: TextButton(
//                           style: TextButton.styleFrom(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(5.0),
//                                 side: const BorderSide(color: Colors.white),
//                               ),
//                               primary: ColorPrimary,
//                               textStyle: const TextStyle(
//                                 color: lightButtonTextColor,
//                               )),
//                           child: const Text(
//                             'Log in',
//                             style: TextStyle(
//                               color: Colors.white,
//                               decoration: TextDecoration.underline,
//                             ),
//                           ),
//                           onPressed: _userDataProvider.isLoading!
//                               ? null
//                               : () {
//                                   _userDataProvider
//                                       .manualLogin(
//                                           _emailTextFieldController.text,
//                                           _passwordTextFieldController.text)
//                                       .then(( isLoggedIn) async {
//                                     if (isLoggedIn) {
//                                       Navigator.pushNamedAndRemoveUntil(context,
//                                           RoutePaths.Home, (_) => false);
//                                     } else {
//                                       showAlertDialog(context);
//                                     }
//                                   });
//                                 },

//                           // ),
//                         ))
//                       ],
//                     ),
//                   ),
//                 ]))));
//   }

//   // Toggles the password show status
//   void _toggle() {
//     setState(() {
//       _passwordObscured = !_passwordObscured;
//     });
//   }

//   showAlertDialog(BuildContext context) {
//     // set up the button
//     final Widget okButton = TextButton(
//       style: TextButton.styleFrom(
//         primary: Theme.of(context).buttonColor,
//       ),
//       child: const Text('OK'),
//       onPressed: () {
//         Navigator.of(context).pop();
//       },
//     );

//     // set up the AlertDialog
//     final AlertDialog alert = AlertDialog(
//       title: const Text(LoginConstants.loginFailedTitle),
//       content: const Text(LoginConstants.loginFailedDesc),
//       actions: [
//         okButton,
//       ],
//     );

//     // show the dialog
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }
// }
