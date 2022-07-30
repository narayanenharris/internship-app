import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpVerifyPage extends StatefulWidget {
  const OtpVerifyPage({Key? key}) : super(key: key);

  void _onSubmit() {}

  @override
  State<OtpVerifyPage> createState() => _OtpVerifyPageState();
}

class _OtpVerifyPageState extends State<OtpVerifyPage> {
  final ButtonStyle buttonStyle = TextButton.styleFrom(
    backgroundColor: Colors.white,
    fixedSize: const Size(150, 36),
    padding: const EdgeInsets.symmetric(horizontal: 18.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20.0),
      ),
    ),
  );

  int seconds = 30;

  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 1);
    seconds = 30;

    return Timer.periodic(duration, (timer) {
      setState(() {
        if (seconds > 0) {
          seconds = seconds - 1;
        }
      });
    });
  }

  void resendOtp() {
    startTime();
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
                      "Enter 4 Digit PIN",
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
                        child: const TextFieldPinAutoFill(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            hintText: "Enter OTP",
                            focusColor: Colors.white,
                            hintStyle: TextStyle(color: Colors.white54),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            counterStyle: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          codeLength: 4,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: seconds == 0 ? resendOtp : null,
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
                        onPressed: widget._onSubmit,
                        style: buttonStyle,
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
