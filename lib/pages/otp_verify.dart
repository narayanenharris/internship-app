import 'dart:async';
import 'package:app/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:app/styles/buttton.dart';

class OtpVerifyPage extends StatefulWidget {
  const OtpVerifyPage({
    Key? key,
    required this.fullName,
    required this.dateOfBirth,
    required this.mobile,
    required this.email,
    required this.password,
    required this.referralCode,
    required this.user,
  }) : super(key: key);

  final String fullName;
  final String dateOfBirth;
  final String mobile;
  final String email;
  final String password;
  final String referralCode;
  final UserCredential user;

  @override
  State<OtpVerifyPage> createState() => _OtpVerifyPageState();
}

class _OtpVerifyPageState extends State<OtpVerifyPage> {
  int seconds = 30;
  String countryCode = '+91';
  String verificationId = '';
  int? resendToken;
  String _smsCode = '';
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTime();
    _verifyPhoneNumber();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  void _startTime() async {
    var duration = const Duration(seconds: 1);
    seconds = 30;

    _timer = Timer.periodic(duration, (timer) {
      setState(() {
        if (seconds > 0) {
          seconds = seconds - 1;
        }
      });
    });
  }

  void _resendOtp() {
    _startTime();
    _verifyPhoneNumber();
  }

  void _verifyPhoneNumber() async {
    await SmsAutoFill().listenForCode();

    try {
      FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: countryCode + widget.mobile,
        timeout: const Duration(seconds: 30),
        forceResendingToken: resendToken,
        verificationCompleted: (PhoneAuthCredential credential) {
          showSnackBarText("Auth Completed!");
        },
        verificationFailed: (FirebaseAuthException e) {
          showSnackBarText("Auth Failed!");
        },
        codeSent: (String verificationId, int? resendToken) async {
          showSnackBarText("OTP Sent!");
          this.verificationId = verificationId;
          this.resendToken = resendToken;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          showSnackBarText("Timeout!");
        },
      );
    } catch (error) {
      showSnackBarText(error.toString());
    }
  }

  void _onSubmit() async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: _smsCode,
      );

      await widget.user.user?.updatePhoneNumber(credential);

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: widget.email,
        password: widget.password,
      );

      if (!mounted) return;

      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } catch (error) {
      showSnackBarText(error.toString());
    }
  }

  void showSnackBarText(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 0, 0),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 48.0,
                  left: 16.0,
                  right: 16.0,
                  bottom: 20.0,
                ),
                child: Column(
                  children: [
                    const Text(
                      "Verify OTP",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 26.0,
                        color: Colors.white,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                    ),
                    Flexible(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 350),
                        child: const Text(
                          "We have sent an OTP to your mobile number",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                    ),
                    const Text(
                      "Enter 6 Digit PIN",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                    ),
                    Flexible(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 150),
                        child: PinFieldAutoFill(
                          currentCode: _smsCode,
                          autoFocus: true,
                          decoration: const UnderlineDecoration(
                            colorBuilder: FixedColorBuilder(Colors.white),
                            textStyle: TextStyle(color: Colors.white),
                          ),
                          onCodeChanged: (code) {
                            if (code!.length == 6) {
                              FocusScope.of(context).requestFocus(
                                FocusNode(),
                              );
                            }
                            _smsCode = code;
                          },
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                    ),
                    TextButton(
                      onPressed: seconds == 0 ? _resendOtp : null,
                      child: Text(
                        seconds == 0 ? "Resend OTP" : "Resend in $seconds sec",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(32.0),
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: _onSubmit,
                        style: buttonStyleRed,
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Color.fromARGB(255, 255, 0, 0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
