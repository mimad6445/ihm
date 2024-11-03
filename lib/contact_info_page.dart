// contact_info_page.dart
import 'package:flutter/material.dart';
import 'package:ihm/constants.dart';
import 'package:ihm/main.dart';
import 'visa_application_data.dart';
import 'family_info_page.dart';

class ContactInfoPage extends StatefulWidget {
  final VisaApplicationData applicationData;
  final VoidCallback onNext;

  ContactInfoPage({required this.applicationData, required this.onNext});

  @override
  _ContactInfoPageState createState() => _ContactInfoPageState();
}

class _ContactInfoPageState extends State<ContactInfoPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController =
      TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.text = widget.applicationData.email;
    _phoneNumberController.text = widget.applicationData.phoneNumber;
    _addressController.text = widget.applicationData.address;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Row(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 0.35,
            color: const Color.fromARGB(255, 147, 193, 148),
            child: Center(
              child: Image.asset("assets/ver.png"),
            ),
          ),
          Container(
                        width: MediaQuery.sizeOf(context).width * 0.65,

            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  buildProgressIndicator(1, 4),
                  SizedBox(height: 20),
                  Text(
                    "Step 2: Contact Information",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                            prefixIcon:
                                Icon(Icons.email, color: primaryColor),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Required';
                            }
                            // Simple email validation
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Enter a valid email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15),
                        TextFormField(
  controller: _phoneNumberController,
  decoration: InputDecoration(
    labelText: 'Phone Number',
    border: OutlineInputBorder(),
    prefixIcon: Icon(Icons.phone, color: primaryColor),
  ),
  keyboardType: TextInputType.phone,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    } else if (!RegExp(r'^\+?[1-9]\d{9,14}$').hasMatch(value)) {
      return 'Enter a valid phone number with country code';
    }
    return null;
  },
),

                        SizedBox(height: 15),
                        TextFormField(
                          controller: _addressController,
                          decoration: InputDecoration(
                            labelText: 'Address',
                            border: OutlineInputBorder(),
                            prefixIcon:
                                Icon(Icons.location_on, color: primaryColor),
                          ),
                          validator: (value) =>
                              value!.isEmpty ? 'Required' : null,
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 24.0),
                                side: BorderSide(color: primaryColor),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Back",
                                style: TextStyle(
                                    color: primaryColor, fontSize: 18),
                              ),
                            ),
                            ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding:
                                EdgeInsets.symmetric(vertical: 16.0,horizontal: 20),
                            foregroundColor:Colors.white,
                            backgroundColor: primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  widget.applicationData.email =
                                      _emailController.text;
                                  widget.applicationData.phoneNumber =
                                      _phoneNumberController.text;
                                  widget.applicationData.address =
                                      _addressController.text;
            
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FamilyInfoPage(
                                            applicationData:
                                                widget.applicationData, onNext: () {  },)),
                                  );
                                }
                              },
                              child: Text("Next",
                                  style:
                                      TextStyle(color: Colors.white, fontSize: 18)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
