import 'package:flutter/material.dart';

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
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20.0),
        bottomLeft: Radius.circular(20.0),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
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
                      style: TextStyle(fontSize: 26.0, color: Colors.white),
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
                          style: TextStyle(fontSize: 22.0, color: Colors.white),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                    ),
                    const Text(
                      "Enter 4 Digit PIN",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22.0, color: Colors.white),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                    ),
                    Flexible(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 150),
                        child: const TextField(
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.number,
                          maxLength: 4,
                          decoration: InputDecoration(
                            hintText: "Enter OTP",
                            focusColor: Colors.white,
                            hintStyle: TextStyle(color: Colors.grey),
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
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Resend in 30 sec",
                        style: TextStyle(
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
                            fontSize: 16.0,
                            color: Colors.red,
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
