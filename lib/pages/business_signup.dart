import 'package:sms_autofill/sms_autofill.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app/utils/validation.dart';
import 'package:app/pages/otp_verify.dart';
import 'package:app/styles/buttton.dart';

class BusinessSignupPage extends StatefulWidget {
  BusinessSignupPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  State<BusinessSignupPage> createState() => _BusinessSignupPageState();
}

class _BusinessSignupPageState extends State<BusinessSignupPage> {
  bool _isHidden = true;
  String? _mobileError;
  String? _dropDownError;
  final _fullNameInput = TextEditingController();
  final _dateOfBirthInput = TextEditingController();
  final _mobileInput = TextEditingController();
  final _emailInput = TextEditingController();
  final _passwordInput = TextEditingController();
  final _confirmPasswordInput = TextEditingController();
  final _referralCodeInput = TextEditingController();
  String? _currentSelectedValue;

  final _categories = [
    "Hotel",
    "Club",
    "Resort",
    "Saloon",
    "Parlour",
    "Service Apartments",
    "Textile",
    "Jewellery Shop",
    "SPA",
    "Marriage Hall",
    "Provision Bazzar",
    "Restaurant",
    "Cinema Online Tickets",
    "Online Discount Shopping",
    "Tours & Travels",
    "Gym",
    "Online Recharge",
    "Others",
    "Hotels and Resorts",
    "Electronices",
    "Mobile Phones",
    "Launday Services",
    "Medicines",
    "Beach Resort"
  ];

  void onSignup(BuildContext context) async {
    setState(() {
      if (_currentSelectedValue == null) {
        _dropDownError = 'Select a category';
      } else {
        _dropDownError = null;
      }

      _mobileError = validateMobile(_mobileInput.text);
    });

    if (_dropDownError != null || _mobileError != null) {
      return;
    }

    if (widget._formKey.currentState?.validate() == true) {
      UserCredential? user;

      try {
        user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailInput.text,
          password: _passwordInput.text,
        );

        await user.user?.updateDisplayName(_fullNameInput.text);
      } catch (error) {
        user = null;
        showSnackBarText(error.toString());
      }

      if (!mounted || user == null) return;

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => OtpVerifyPage(
            fullName: _fullNameInput.text,
            dateOfBirth: _dateOfBirthInput.text,
            email: _emailInput.text,
            mobile: _mobileInput.text,
            password: _passwordInput.text,
            referralCode: _referralCodeInput.text,
            user: user!,
          ),
        ),
      );
    }
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _setDateInput(DateTime dateTime) {
    setState(() {
      _dateOfBirthInput.text = DateFormat('dd-MM-yyyy').format(dateTime);
    });
  }

  void _onLoginPress(BuildContext context) {
    Navigator.of(context).pop();
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Create Account",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26.0),
                ),
                const Padding(padding: EdgeInsets.all(16.0)),
                Form(
                  key: widget._formKey,
                  child: Column(
                    children: [
                      FormField<String>(
                        builder: (FormFieldState<String> state) {
                          return InputDecorator(
                            decoration: InputDecoration(
                              errorText: _dropDownError,
                              hintText: 'Select Category',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            isEmpty: _currentSelectedValue == '',
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: _currentSelectedValue,
                                hint: const Text('Select Category'),
                                isDense: true,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _currentSelectedValue = newValue;
                                    state.didChange(newValue);
                                  });
                                },
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                                isExpanded: true,
                                menuMaxHeight: 400.0,
                                alignment: AlignmentDirectional.centerStart,
                                items: _categories.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          );
                        },
                      ),
                      const Padding(padding: EdgeInsets.all(8.0)),
                      TextFormField(
                        validator: validateFullName,
                        controller: _fullNameInput,
                        keyboardType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          labelText: 'Full Name',
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
                        validator: validateDateOfBirth,
                        controller: _dateOfBirthInput,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          suffixIcon: const Icon(
                            Icons.calendar_today,
                            color: Colors.black54,
                          ),
                          labelText: "Date Of Birth",
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
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2100),
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: const ColorScheme.light(
                                    primary: Color.fromARGB(255, 255, 0, 0),
                                    onPrimary: Colors.white,
                                    onSurface: Colors.black,
                                  ),
                                  textButtonTheme: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                      primary: Colors.red,
                                    ),
                                  ),
                                ),
                                child: child!,
                              );
                            },
                          );
                          if (pickedDate != null) {
                            _setDateInput(pickedDate);
                          }
                        },
                      ),
                      const Padding(padding: EdgeInsets.all(8.0)),
                      PhoneFieldHint(
                        controller: _mobileInput,
                        decoration: InputDecoration(
                          prefixText: "+91",
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          labelText: 'Mobile',
                          errorText: _mobileError,
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
                        controller: _emailInput,
                        validator: validateEmail,
                        keyboardType: TextInputType.emailAddress,
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
                              color: Colors.black54,
                            ),
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
                      const Padding(padding: EdgeInsets.all(8.0)),
                      TextFormField(
                        validator: (value) => validateConfirmPassword(
                          value,
                          _passwordInput.text,
                        ),
                        controller: _confirmPasswordInput,
                        obscureText: _isHidden,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          labelText: 'Confirm Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isHidden
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black54,
                            ),
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
                      const Padding(padding: EdgeInsets.all(8.0)),
                      TextFormField(
                        controller: _referralCodeInput,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          labelText: 'Referral Code',
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
                const Padding(padding: EdgeInsets.all(8.0)),
                Center(
                  child: ElevatedButton(
                    onPressed: () => onSignup(context),
                    style: buttonStyle,
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already Member ? ",
                      style: TextStyle(fontSize: 16.0),
                    ),
                    TextButton(
                      onPressed: () => _onLoginPress(context),
                      style: TextButton.styleFrom(
                        primary: const Color.fromARGB(255, 255, 0, 0),
                      ),
                      child: const Text(
                        "Login",
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

  @override
  void dispose() {
    _fullNameInput.dispose();
    _emailInput.dispose();
    _mobileInput.dispose();
    _passwordInput.dispose();
    _confirmPasswordInput.dispose();
    _dateOfBirthInput.dispose();
    _referralCodeInput.dispose();
    super.dispose();
  }

  void showSnackBarText(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }
}
