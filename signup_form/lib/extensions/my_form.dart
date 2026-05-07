import 'package:flutter/material.dart';
import 'package:signup_form/extensions/extensions.dart';

class MyForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Extensions Form Demo',
      home: ExtensionFormPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ExtensionFormPage extends StatefulWidget {
  @override
  _ExtensionFormPageState createState() => _ExtensionFormPageState();
}

class _ExtensionFormPageState extends State<ExtensionFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _urlController = TextEditingController();
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form with Extensions")),
      body: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12, top: 2),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Name Field
              TextFormField(
                controller: _nameController,

                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(labelText: 'Name'),

                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (val) {
                  if (val == null || val.isUpper()) {
                    return 'Enter a valid name';
                  }
                  return null;
                },
              ),

              // Email Field
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(labelText: 'Email'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (val) {
                  if (val == null || !val.isEmail()) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),

              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(labelText: 'Phone No.'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (val) {
                  if (val == null || !val.isNumeric()) {
                    return 'Enter a valid phone number';
                  }
                  return null;
                },
              ),

              TextFormField(
                controller: _urlController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.url,
                decoration: InputDecoration(labelText: ' Url'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (val) {
                  if (val == null || !val.isValidUrl()) {
                    return 'Enter a valid Url';
                  }
                  return null;
                },
              ),
              SizedBox(height: 6),

              // Birthdate Picker
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedDate == null
                        ? "Select Birthdate"
                        : "Age: ${selectedDate!.age()} | Birth day is ${selectedDate!.weekdays()}",
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null) {
                        setState(() {
                          selectedDate = picked;
                        });
                        if (picked.isToday()) {
                          context.showSnack("You picked today's date!");
                        }
                      }
                    },
                    child: Text("Pick Date"),
                  ),
                ],
              ),
              SizedBox(height: 10),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.showSnack(
                      "Name: ${_nameController.text}, Email: ${_emailController.text}, Phone No: ${_phoneController.text.toString()}, Url: ${_urlController.text}",
                    );
                  }
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
