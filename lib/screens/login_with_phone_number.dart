
import 'package:assignment/screens/home_screen.dart';
import 'package:assignment/screens/verify.dart';
import 'package:assignment/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Utils/utils.dart';
import '../widgets/round_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginWithPhoneNumber extends StatefulWidget {
  const LoginWithPhoneNumber({super.key});

  static String verify = "";

  @override
  State<LoginWithPhoneNumber> createState() => _LoginWithPhoneNumberState();
}

class _LoginWithPhoneNumberState extends State<LoginWithPhoneNumber> {

  //
  // bool loading = false ;
  // final phoneNumberController = TextEditingController();
  // final auth = FirebaseAuth.instance ;
  //
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       centerTitle: true,
  //       title: Text('Login'),
  //     ),
  //     body: Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 20),
  //       child: Column(
  //         children: [
  //           SizedBox(height: 120,),
  //
  //           TextFormField(
  //             controller: phoneNumberController,
  //             keyboardType: TextInputType.number,
  //             decoration: InputDecoration(
  //                 hintText: '+91 111 222 3333'
  //             ),
  //           ),
  //           SizedBox(height: 100,),
  //           RoundButton(title: 'Login',
  //               loading: loading, onTap: (){
  //
  //             setState(() {
  //               loading = true ;
  //             });
  //             auth.verifyPhoneNumber(
  //                 phoneNumber: phoneNumberController.text,
  //                 verificationCompleted: (_){
  //                   setState(() {
  //                     loading = false ;
  //                   });
  //                 },
  //                 verificationFailed: (e){
  //                   setState(() {
  //                     loading = false ;
  //                   });
  //                   Utils().toastMessage(e.toString());
  //                 },
  //                 codeSent: (String verificationId , int? token){
  //                   Navigator.push(context,
  //                       MaterialPageRoute(
  //                           builder: (context) => VerifyCodeScreen(verificationId:verificationId ,)));
  //                   setState(() {
  //                     loading = false ;
  //                   });
  //                 },
  //                 codeAutoRetrievalTimeout: (e){
  //                   Utils().toastMessage(e.toString());
  //                   setState(() {
  //                     loading = false ;
  //                   });
  //                 });
  //           })
  //
  //         ],
  //       ),
  //     ),
  //   );
  // }

  TextEditingController countryController = TextEditingController();
  var phone = "";
  final auth = FirebaseAuth.instance;
  bool loading= false;


  @override
  void initState() {
    // TODO: implement initState
    countryController.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/testing_png.png',
                width: 150,
                height: 150,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Mobile Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Register now ! for awesome experience",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 40,
                      child: TextField(
                        controller: countryController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Text(
                      "|",
                      style: TextStyle(fontSize: 33, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextField(
                          onChanged: (value){
                            phone = value;
                          },
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Phone",
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async {
                      setState(() {
                        loading = true;
                      });
                      await auth.verifyPhoneNumber(
                        phoneNumber: '${countryController.text+phone}',
                        verificationCompleted: (PhoneAuthCredential credential) {

                          setState(() {
                            loading = false;
                          });
                        },
                        verificationFailed: (FirebaseAuthException e) {
                          Utils().toastMessage(e.toString());
                        },
                        codeSent: (String verificationId, int? resendToken) {
                          LoginWithPhoneNumber.verify=verificationId;
                          nextScreen(context, MyVerify());
                          setState(() {
                            loading = false;
                          });
                        },
                        codeAutoRetrievalTimeout: (e) {
                          Utils().toastMessage(e.toString());

                          setState(() {
                            loading = false;
                          });
                        },
                      );

                    },
                    child: const Text("Get the code",style: TextStyle(color: Colors.white),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
