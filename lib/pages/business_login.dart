import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app/pages/business_signup.dart';
import 'package:app/styles/buttton.dart';
import 'package:app/utils/validation.dart';

class BusinessLoginPage extends StatefulWidget {
  BusinessLoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  State<BusinessLoginPage> createState() => _BusinessLoginPageState();
}

class _BusinessLoginPageState extends State<BusinessLoginPage> {
  bool _isHidden = true;
  bool _rememberChecked = false;

  final _emailInput = TextEditingController();
  final _passwordInput = TextEditingController();

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

  void _onLogin() async {
    if (widget._formKey.currentState?.validate() == true) {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailInput.text,
        password: _passwordInput.text,
      );
    }
  }

  void _onForgotPassword() {
    if (_emailInput.text.isNotEmpty) {
      FirebaseAuth.instance.sendPasswordResetEmail(email: _emailInput.text);
      showSnackBarText('Reset link sent to your email');
    } else {
      showSnackBarText('Enter email to send reset link');
    }
  }

  void _onSignUpPress(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => BusinessSignupPage()),
    );
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
                        controller: _emailInput,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          labelText: 'Email',
                          hintText: 'mail@domain.com',
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black87,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          labelStyle: const TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(8.0)),
                      TextFormField(
                        validator: validatePassword,
                        controller: _passwordInput,
                        obscureText: _isHidden,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                                _isHidden
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black54),
                            onPressed: _togglePasswordView,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black87,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          labelStyle: const TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(4.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: _rememberChecked,
                          onChanged: (value) => _setRemember(value),
                          activeColor: const Color.fromARGB(255, 255, 0, 0),
                        ),
                        const Text("Remember Me")
                      ],
                    ),
                    TextButton(
                      onPressed: _onForgotPassword,
                      style: TextButton.styleFrom(
                        primary: const Color.fromARGB(255, 255, 0, 0),
                      ),
                      child: const Text("Forgot Password"),
                    )
                  ],
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                Center(
                  child: ElevatedButton(
                    onPressed: _onLogin,
                    style: buttonStyle,
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 20.0),
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
                      style: TextButton.styleFrom(
                          primary: const Color.fromARGB(255, 255, 0, 0)),
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
