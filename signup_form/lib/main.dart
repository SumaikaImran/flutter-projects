import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:signup_form/extensions/my_form.dart';
import 'display.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

var phonenomaskFormatter = MaskTextInputFormatter(
  mask: '+92 (3##) #######',
  filter: {"#": RegExp(r'[0-9]')},
  type: MaskAutoCompletionType.lazy,
);

void main() {
  runApp(
    MaterialApp(
      // title: 'Signup App',
      // debugShowCheckedModeBanner: false,
      // theme: ThemeData(primarySwatch: Colors.blue),
      home: MyForm(), // ✅ Now wraps the whole widget tree
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();
  final FocusNode _cnicFocus = FocusNode();
  final FocusNode _dobFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _cnicController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  int _value = 0;
  int? age;
  bool _acceptedTerms = false;
  bool _autoValidate = false;
  bool isSelected = false;

  List<String> categoryDropDown = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
  String? newValue;
  XFile? _selectedImage;
  @override
  void dispose() {
    _nameController.dispose();
    dateController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _cnicController.dispose();
    phoneController.dispose();
    _passwordFocus.dispose();
    _dobFocus.dispose();
    _emailFocus.dispose();
    _confirmPasswordFocus.dispose();
    _cnicFocus.dispose();
    super.dispose();
  }

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Signup Screen',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Signup',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Form(
                key: _formKey,

                autovalidateMode: _autoValidate
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        controller: _nameController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.words,

                        inputFormatters: [
                          LengthLimitingTextInputFormatter(20),
                          FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Z\s]'),
                          ),
                        ],
                        decoration: InputDecoration(
                          labelText: 'Full Name',
                          hintText: 'Enter your full name',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter full name';
                          }
                          return null;
                        },
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// ✅ Date of Birth Field (fixed)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        focusNode: _dobFocus,
                        controller: dateController,
                        textInputAction: TextInputAction.next,
                        readOnly: true,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.calendar_today),
                          labelText: "Date of Birth",
                          hintText: "YYYY-MM-DD",
                          border: OutlineInputBorder(),
                        ),

                        onTap: () async {
                          final DateTime today = DateTime.now();
                          final DateTime maxAllowedDate = DateTime(
                            today.year - 18,
                            today.month,
                            today.day,
                          );

                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: maxAllowedDate,
                            firstDate: DateTime(1900),
                            lastDate: maxAllowedDate, // ← this is the main part
                          );

                          String formattedDate = DateFormat(
                            'yyyy-MM-dd',
                          ).format(pickedDate);
                          setState(() {
                            dateController.text = formattedDate;
                            // age = today.year - pickedDate.year;
                            // if (today.month < pickedDate.month ||
                            //     (today.month == pickedDate.month &&
                            //         today.day < pickedDate.day)) {
                            //   age = age! - 1;
                            // }
                          });
                          FocusScope.of(context).requestFocus(_emailFocus);
                                                },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select your date of birth';
                          }
                          if (age == null || age! < 18) {
                            return 'You must be at least 18 years old';
                          }
                          return null;
                        },
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// Email Field
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        controller: _emailController,
                        focusNode: _emailFocus,
                        keyboardType: TextInputType.emailAddress,
                        textCapitalization: TextCapitalization.none,
                        textInputAction: TextInputAction.next,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(20),

                          FilteringTextInputFormatter.deny(RegExp(r'\s')),
                        ],

                        decoration: const InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter Email',
                          prefixIcon: Icon(Icons.email),

                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter email';
                          }
                          final emailRegex = RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                          );

                          if (!emailRegex.hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        inputFormatters: [phonenomaskFormatter],
                        decoration: const InputDecoration(
                          labelText: "Phone No.",
                          hintText: 'Enter Phone No.',
                          prefixIcon: Icon(Icons.phone),
                          // prefixIcon: Icon(Icons.idCard),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// Password Field
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        controller: _passwordController,
                        focusNode: _passwordFocus,
                        obscureText: _obscurePassword,
                        textInputAction: TextInputAction.next,
                        inputFormatters: [LengthLimitingTextInputFormatter(15)],
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter Password',
                          prefixIcon: const Icon(Icons.lock),
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                        onFieldSubmitted: (_) {
                          FocusScope.of(
                            context,
                          ).requestFocus(_confirmPasswordFocus);
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          if (!RegExp(r'[A-Z]').hasMatch(value)) {
                            return 'Must contain at least 1 capital letter';
                          }
                          if (!RegExp(r'[0-9]').hasMatch(value)) {
                            return 'Must contain at least 1 digit';
                          }
                          if (!RegExp(
                            r'[!@#\$%^&*(),.?":{}|<>]',
                          ).hasMatch(value)) {
                            return 'Must contain at least 1 special character';
                          }
                          // if (_confirmPasswordController.text.isNotEmpty) {
                          //   if (value != _confirmPasswordController.text) {
                          //     return 'Password do not match';
                          //   }
                          // }
                          return null;
                        },
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// Confirm Password
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        focusNode: _confirmPasswordFocus,

                        obscureText: _obscureConfirmPassword,
                        inputFormatters: [LengthLimitingTextInputFormatter(15)],

                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          hintText: 'Enter Password again',
                          prefixIcon: const Icon(Icons.lock),
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureConfirmPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureConfirmPassword =
                                    !_obscureConfirmPassword;
                              });
                            },
                          ),
                        ),
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_cnicFocus);
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),

                    /// CNIC Field
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        controller: _cnicController,
                        focusNode: _cnicFocus,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,

                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CNICInputFormatter(),
                        ],
                        decoration: const InputDecoration(
                          labelText: 'CNIC No.',
                          hintText: 'Enter CNIC NO.',
                          prefixIcon: Icon(Icons.badge),
                          border: OutlineInputBorder(),
                        ),

                        validator: (value) {
                          // Remove dashes
                          final cleaned = value?.replaceAll('-', '');

                          if (cleaned == null || cleaned.isEmpty) {
                            return 'Please enter CNIC';
                          }
                          if (cleaned.length != 13) {
                            return 'CNIC must be exactly 13 digits';
                          }
                          return null;
                        },
                      ),
                    ),

                    const SizedBox(height: 10),

                    /// Gender
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Gender",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              buildGenderRadio(1, "Male"),
                              buildGenderRadio(2, "Female"),
                              buildGenderRadio(3, "Other"),
                            ],
                          ),
                        ],
                      ),
                    ),

                    /// Dropdown for siblings
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: DropdownButtonFormField(
                        decoration: const InputDecoration(
                          labelText: 'Siblings',
                          hintText: 'Enter number of siblings',
                          border: OutlineInputBorder(),
                        ),
                        items: categoryDropDown.map((e) {
                          return DropdownMenuItem(value: e, child: Text(e));
                        }).toList(),
                        value: newValue,
                        onChanged: (value) {
                          setState(() {
                            newValue = value!;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select number of siblings';
                          }
                          return null;
                        },
                      ),
                    ),

                    /// Terms & Conditions
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Checkbox(
                            value: _acceptedTerms,
                            onChanged: (value) {
                              setState(() {
                                _acceptedTerms = value!;
                              });
                            },
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _acceptedTerms = !_acceptedTerms;
                                });
                              },
                              child: const Text(
                                'I accept the Terms & Conditions',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// Image Picker
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          MaterialButton(
                            color: Colors.blue,
                            onPressed: _pickImageFromGallery,
                            child: const Text(
                              'Pick image from gallery',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          _selectedImage != null
                              ? Image.file(
                                  File(_selectedImage!.path),
                                  height: 200,
                                )
                              : const Text("Please select profile picture"),
                        ],
                      ),
                    ),

                    /// Submit Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        color: Colors.teal,
                        textColor: Colors.white,
                        onPressed: () {
                          setState(() {
                            _autoValidate = true;
                          });
                          if (_formKey.currentState!.validate()) {
                            if (!_acceptedTerms) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'You must accept Terms & Conditions',
                                  ),
                                ),
                              );
                              return;
                            }

                            final user = UserModel(
                              fullName: _nameController.text,
                              dateOfBirth: dateController.text,
                              email: _emailController.text,
                              cnic: _cnicController.text,
                              phone: phoneController.text,
                              gender: _value == 1
                                  ? "Male"
                                  : _value == 2
                                  ? "Female"
                                  : "Other",
                              siblings: newValue ?? '',
                              imagePath: _selectedImage?.path ?? '',
                            );

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    UserDetailsScreen(user: user),
                              ),
                            );
                          }
                        },
                        child: const Text('Submit'),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGenderRadio(int value, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _value = value;
        });
      },
      child: Row(
        children: [
          Radio<int>(
            value: value,
            groupValue: _value,
            onChanged: (val) => setState(() => _value = val!),
          ),
          Text(label),
        ],
      ),
    );
  }

  Future<void> _pickImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile == null) return;
    setState(() {
      _selectedImage = pickedFile;
    });
  }
}

class CNICInputFormatter extends TextInputFormatter {
  static const maxDigits = 13;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String digitsOnly = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // Restrict to max 13 digits
    if (digitsOnly.length > maxDigits) {
      digitsOnly = digitsOnly.substring(0, maxDigits);
    }

    // Insert dashes
    String formatted = '';
    int selectionIndex = 0;
    for (int i = 0; i < digitsOnly.length; i++) {
      formatted += digitsOnly[i];
      if ((i == 4 || i == 11) && i != digitsOnly.length - 1) {
        formatted += '-';
      }
    }

    // Calculate new cursor position
    int nonDashBeforeCursor =
        newValue.selection.baseOffset -
        RegExp(r'-')
            .allMatches(
              newValue.text.substring(0, newValue.selection.baseOffset),
            )
            .length;

    int dashCount = 0;
    int i = 0;
    while (dashCount + i < formatted.length &&
        dashCount < 2 &&
        i < nonDashBeforeCursor) {
      if (formatted[dashCount + i] == '-') {
        dashCount++;
      }
      i++;
    }

    selectionIndex = nonDashBeforeCursor + dashCount;

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(
        offset: selectionIndex.clamp(0, formatted.length),
      ),
    );
  }
}
