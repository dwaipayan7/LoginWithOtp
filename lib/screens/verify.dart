import 'package:assignment/Utils/utils.dart';
import 'package:assignment/screens/home_screen.dart';
import 'package:assignment/screens/login_with_phone_number.dart';
import 'package:assignment/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../widgets/round_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyVerify extends StatefulWidget {

   const MyVerify({Key? key}) : super(key: key);


  @override
  State<MyVerify> createState() => _MyVerifyState();
}

class _MyVerifyState extends State<MyVerify> {

  bool loading = false;
  final phoneNumberController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {



    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    var code ="";

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/otp.png',
                width: 150,
                height: 150,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Phone Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "We need to register your phone without getting started!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Pinput(
                length: 6,
                // defaultPinTheme: defaultPinTheme,
                // focusedPinTheme: focusedPinTheme,
                // submittedPinTheme: submittedPinTheme,

                showCursor: true,
                onChanged: (value){
                  code = value;
                },


              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade600,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async {


                      try{
                        PhoneAuthCredential credential = PhoneAuthProvider.credential(
                          verificationId: LoginWithPhoneNumber.verify,
                          smsCode: code,
                        );

                        await auth.signInWithCredential(credential);
                        nextScreenReplace(context, HomeScreen());

                      }catch(e){
                        print("Wrong Otp");
                      }


                    },
                    child: Text("Verify Phone Number", style: TextStyle(color: Colors.white),)),

              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                      },
                      child: const Text(
                        "Edit Phone Number ?",
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
















  //
  //   final defaultPinTheme = PinTheme(
  //     width: 56,
  //     height: 56,
  //     textStyle: TextStyle(
  //         fontSize: 20,
  //         color: Color.fromRGBO(30, 60, 87, 1),
  //         fontWeight: FontWeight.w600),
  //     decoration: BoxDecoration(
  //       border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
  //       borderRadius: BorderRadius.circular(20),
  //     ),
  //   );
  //
  //   final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  //     border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
  //     borderRadius: BorderRadius.circular(8),
  //   );
  //
  //   final submittedPinTheme = defaultPinTheme.copyWith(
  //     decoration: defaultPinTheme.decoration?.copyWith(
  //       color: Color.fromRGBO(234, 239, 243, 1),
  //     ),
  //   );
  //
  //   return Scaffold(
  //     extendBodyBehindAppBar: true,
  //     appBar: AppBar(
  //       backgroundColor: Colors.transparent,
  //       leading: IconButton(
  //         onPressed: () {
  //           Navigator.pop(context);
  //         },
  //         icon: Icon(
  //           Icons.arrow_back_ios_rounded,
  //           color: Colors.black,
  //         ),
  //       ),
  //       elevation: 0,
  //     ),
  //     body: Container(
  //       margin: EdgeInsets.only(left: 25, right: 25),
  //       alignment: Alignment.center,
  //       child: SingleChildScrollView(
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Image.asset(
  //               'assets/otp.png',
  //               width: 150,
  //               height: 150,
  //             ),
  //             SizedBox(
  //               height: 25,
  //             ),
  //             Text(
  //               "Phone Verification",
  //               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
  //             ),
  //             SizedBox(
  //               height: 10,
  //             ),
  //             Text(
  //               "We need to register your phone without getting started!",
  //               style: TextStyle(
  //                 fontSize: 16,
  //                 color: Colors.white
  //               ),
  //               textAlign: TextAlign.center,
  //             ),
  //             SizedBox(
  //               height: 30,
  //             ),
  //             Pinput(
  //               length: 6,
  //               // defaultPinTheme: defaultPinTheme,
  //               // focusedPinTheme: focusedPinTheme,
  //               // submittedPinTheme: submittedPinTheme,
  //
  //               showCursor: true,
  //               onCompleted: (pin) => print(pin),
  //             ),
  //             SizedBox(
  //               height: 20,
  //             ),
  //
  //
  //
  //
  //             // SizedBox(
  //             //   width: double.infinity,
  //             //   height: 45,
  //             //   child: ElevatedButton(
  //             //       style: ElevatedButton.styleFrom(
  //             //           backgroundColor: Colors.blueAccent,
  //             //           shape: RoundedRectangleBorder(
  //             //               borderRadius: BorderRadius.circular(10))),
  //             //       onPressed: () async{
  //             //         setState(() {
  //             //           loading = true;
  //             //         });
  //             //         final credential = PhoneAuthProvider.credential(
  //             //             verificationId: widget.verificationId,
  //             //             smsCode: phoneNumberController.text.toString());
  //             //
  //             //         try{
  //             //           await auth.signInWithCredential(credential);
  //             //           nextScreen(context, HomeScreen());
  //             //         }catch(e){
  //             //           setState(() {
  //             //             loading =false;
  //             //           });
  //             //           Utils().toastMessage(e.toString());
  //             //         }
  //             //       },
  //             //       child: Text("Verify Phone Number",
  //             //         style: TextStyle(color: Colors.white),
  //             //       ),
  //             //   ),
  //             // ),
  //
  //
  //             Column(
  //               children: [
  //                          RoundButton(title: 'Verify',loading: loading, onTap: ()async{
  //
  //                             setState(() {
  //                               loading = true ;
  //                             });
  //                             final credential = PhoneAuthProvider.credential(
  //                                 verificationId: widget.verificationId,
  //                                 smsCode: phoneNumberController.text.toString()
  //                             );
  //
  //                             try{
  //
  //                               await auth.signInWithCredential(credential);
  //
  //                               nextScreenReplace(context, HomeScreen());
  //
  //                             }catch(e){
  //                               setState(() {
  //                                 loading = false ;
  //                               });
  //                               // Utils().toastMessage(e.toString());
  //                             }
  //                           }),
  //               ],
  //             )
  //
  //
  //
  //             // SizedBox(height: 80,),
  //
  //
  //
  //
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
