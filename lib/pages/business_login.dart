import 'package:flutter/material.dart';
import 'package:app/pages/business_signup.dart';
import 'package:app/utils/validation.dart';

class BusinessLoginPage extends StatefulWidget {
  BusinessLoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  State<BusinessLoginPage> createState() => _BusinessLoginPageState();

  void _onLogin() {
    _formKey.currentState?.validate();
  }
}

class _BusinessLoginPageState extends State<BusinessLoginPage> {
  bool _isHidden = true;
  bool _rememberChecked = false;

  final ButtonStyle buttonStyle = TextButton.styleFrom(
    backgroundColor: Colors.red,
    fixedSize: const Size(150, 36),
    padding: const EdgeInsets.symmetric(horizontal: 18.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20.0),
        bottomLeft: Radius.circular(20.0),
      ),
    ),
  );

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _setRemember(bool? value) {
    setState(() {
      _rememberChecked = value ?? false;
    });
  }

  void _onSignUpPress(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => BusinessSignupPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 48.0,
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset('assets/images/logo.png'),
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                const Text(
                  "Welcome",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 26.0),
                ),
                const Text(
                  "Make your way to a new memorable moment",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                const Padding(padding: EdgeInsets.all(16.0)),
                Form(
                  key: widget._formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: validateEmail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          hintText: 'mail@domain.com',
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(8.0)),
                      TextFormField(
                        obscureText: _isHidden,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isHidden
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: _togglePasswordView,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: _rememberChecked,
                          onChanged: (value) => _setRemember(value),
                          activeColor: Colors.red,
                        ),
                        const Text("Remember Me")
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(primary: Colors.red),
                      child: const Text("Forgot Password"),
                    )
                  ],
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                Center(
                  child: ElevatedButton(
                    onPressed: widget._onLogin,
                    style: buttonStyle,
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account ? ",
                      style: TextStyle(fontSize: 16.0),
                    ),
                    TextButton(
                      onPressed: () => _onSignUpPress(context),
                      style: TextButton.styleFrom(primary: Colors.red),
                      child: const Text(
                        "Register",
                        style: TextStyle(fontSize: 16.0),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
