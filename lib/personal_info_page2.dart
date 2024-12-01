import 'package:flutter/material.dart';
import 'package:ihm/constants.dart';
import 'package:ihm/main.dart';
import 'package:ihm/passport_details_page.dart';
import 'visa_application_data.dart';

class PersonalDetails2Page extends StatefulWidget {
  final VisaApplicationData applicationData;
  final VoidCallback? onNext;
  const PersonalDetails2Page({super.key, required this.applicationData, this.onNext});

  @override
  // ignore: library_private_types_in_public_api
  _PersonalDetails2PageState createState() => _PersonalDetails2PageState();
}

class _PersonalDetails2PageState extends State<PersonalDetails2Page> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _motherNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _religionController = TextEditingController();
  final TextEditingController _sectController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize controllers with existing data
    _motherNameController.text = widget.applicationData.motherName;
    _phoneNumberController.text = widget.applicationData.phoneNumber;
    _emailController.text = widget.applicationData.email;
    _religionController.text = widget.applicationData.religion;
    _sectController.text = widget.applicationData.sect;
    _addressController.text = widget.applicationData.address;
  }

  @override
  void dispose() {
    _motherNameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _religionController.dispose();
    _sectController.dispose();
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
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.65,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  buildProgressIndicator(2, 4),
                  const SizedBox(height: 20),
                  Text(
                    "Step 2: Personal Details 2",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _motherNameController,
                          decoration: InputDecoration(
                            labelText: "Mother's Name",
                            border: const OutlineInputBorder(),
                            prefixIcon: Icon(Icons.person, color: primaryColor),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: _phoneNumberController,
                          decoration: InputDecoration(
                            labelText: "Phone Number",
                            border: const OutlineInputBorder(),
                            prefixIcon: Icon(Icons.phone, color: primaryColor),
                          ),
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: "Email Address",
                            border: const OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email, color: primaryColor),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Required';
                            }
                            // Simple email validation
                            if (!RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]")
                                .hasMatch(value)) {
                              return 'Enter a valid email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: _religionController,
                          decoration: InputDecoration(
                            labelText: "Religion",
                            border: const OutlineInputBorder(),
                            prefixIcon: Icon(Icons.mode_night_outlined,
                                color: primaryColor),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: _sectController,
                          decoration: InputDecoration(
                            labelText: "Sect",
                            border: const OutlineInputBorder(),
                            prefixIcon: Icon(Icons.group, color: primaryColor),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: _addressController,
                          decoration: InputDecoration(
                            labelText: "Address",
                            border: const OutlineInputBorder(),
                            prefixIcon: Icon(Icons.home, color: primaryColor),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
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
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                foregroundColor: Colors.white,
                                backgroundColor: primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // Update the application data
                                  widget.applicationData.motherName =
                                      _motherNameController.text;
                                  widget.applicationData.phoneNumber =
                                      _phoneNumberController.text;
                                  widget.applicationData.email =
                                      _emailController.text;
                                  widget.applicationData.religion =
                                      _religionController.text;
                                  widget.applicationData.sect =
                                      _sectController.text;
                                  widget.applicationData.address =
                                      _addressController.text;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PassportDetailsPage(
                                                applicationData:
                                                    widget.applicationData,
                                                onNext: widget.onNext!,
                                              )));
                                }
                              },
                              child: const Text(
                                "Next",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
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
