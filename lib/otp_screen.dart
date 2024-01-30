import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/category_screen.dart';
import 'package:first_app/state.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatelessWidget {
  final String verify;
  OtpScreen(this.verify);
  static const routeName = 'otpscreen';
  @override
  String? otpCode;
  final auth = FirebaseAuth.instance;
  Widget build(BuildContext context) {
    final dataState = Provider.of<DataState>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Verify Phone',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Code is sent to ${dataState.phoneNumber}',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
              child: Pinput(
                length: 6,
                showCursor: true,
                defaultPinTheme: PinTheme(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 113, 191, 255)),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 47, 16, 100),
                  ),
                ),
                onChanged: (value) {
                  otpCode = value;
                },
                onCompleted: (value) {
                  otpCode = value;
                },
              ),
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: 'Did\'nt receive the code?',
                  style: TextStyle(color: Colors.grey)),
              TextSpan(
                  text: '  Request Again',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black))
            ])),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () async {
                // Create a PhoneAuthCredential with the code
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: verify, smsCode: otpCode!);
                dataState.isOTPScreenLoading = true;
                dataState.notifyListeners();
                // Sign the user in (or link) with the credential
                await auth
                    .signInWithCredential(credential)
                    .then((value) => Navigator.of(context)
                        .pushReplacementNamed(CategoryScreen.routeName))
                    .onError((error, stackTrace) {
                  dataState.isOTPScreenLoading = false;
                  dataState.notifyListeners();
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(error.toString())));
                });
              },
              child: Container(
                height: 60,
                width: double.infinity,
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 0, 46, 138)),
                child: Center(
                  child: Text(
                    'VERIFY AND CONTINUE',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
