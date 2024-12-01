import 'package:flutter/material.dart';
import 'package:ihm/constants.dart';
import 'package:ihm/main.dart';
import 'visa_application_data.dart';
import 'visa_details_page.dart';

class PassportDetailsPage extends StatefulWidget {
  final VisaApplicationData applicationData;
  final VoidCallback onNext;
  // ignore: prefer_const_constructors_in_immutables
  PassportDetailsPage({super.key, required this.applicationData, required this.onNext});
  

  @override
  // ignore: library_private_types_in_public_api
  _PassportDetailsPageState createState() => _PassportDetailsPageState();
}

class _PassportDetailsPageState extends State<PassportDetailsPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _passportNumberController = TextEditingController();
  final TextEditingController _dateOfPassportIssuedController = TextEditingController();
  final TextEditingController _placeOfIssueController = TextEditingController();
  final TextEditingController _dateOfPassportExpiredController = TextEditingController();
  final TextEditingController _purposeOfTravelController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passportNumberController.text = widget.applicationData.passportNumber;
    _dateOfPassportIssuedController.text = widget.applicationData.dateOfPassportIssued;
    _placeOfIssueController.text = widget.applicationData.placeOfIssue;
    _dateOfPassportExpiredController.text = widget.applicationData.dateOfPassportExpired;
    _purposeOfTravelController.text = widget.applicationData.purposeOfTravel;
  }

  @override
  void dispose() {
    _passportNumberController.dispose();
    _dateOfPassportIssuedController.dispose();
    _placeOfIssueController.dispose();
    _dateOfPassportExpiredController.dispose();
    _purposeOfTravelController.dispose();
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
                    "Step 3: Passport Details",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _passportNumberController,
                          decoration: InputDecoration(
                            labelText: 'Passport Number',
                            border: const OutlineInputBorder(),
                            prefixIcon: Icon(Icons.card_travel, color: primaryColor),
                          ),
                          validator: (value) => value!.isEmpty ? 'Required' : null,
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: _dateOfPassportIssuedController,
                          decoration: InputDecoration(
                            labelText: 'Date of Passport Issued',
                            border: const OutlineInputBorder(),
                            prefixIcon: Icon(Icons.date_range, color: primaryColor),
                          ),
                          keyboardType: TextInputType.datetime,
                          validator: (value) => value!.isEmpty ? 'Required' : null,
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: _placeOfIssueController,
                          decoration: InputDecoration(
                            labelText: 'Place of Issue',
                            border: const OutlineInputBorder(),
                            prefixIcon: Icon(Icons.location_on, color: primaryColor),
                          ),
                          validator: (value) => value!.isEmpty ? 'Required' : null,
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: _dateOfPassportExpiredController,
                          decoration: InputDecoration(
                            labelText: 'Date of Passport Expiry',
                            border: const OutlineInputBorder(),
                            prefixIcon: Icon(Icons.date_range, color: primaryColor),
                          ),
                          keyboardType: TextInputType.datetime,
                          validator: (value) => value!.isEmpty ? 'Required' : null,
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: _purposeOfTravelController,
                          decoration: InputDecoration(
                            labelText: 'Purpose of Travel',
                            border: const OutlineInputBorder(),
                            prefixIcon: Icon(Icons.airplanemode_active, color: primaryColor),
                          ),
                          validator: (value) => value!.isEmpty ? 'Required' : null,
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                                side: BorderSide(color: primaryColor),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Back",
                                style: TextStyle(color: primaryColor, fontSize: 18),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20),
                                foregroundColor: Colors.white,
                                backgroundColor: primaryColor,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  widget.applicationData.passportNumber =
                                      _passportNumberController.text;
                                  widget.applicationData.dateOfPassportIssued =
                                      _dateOfPassportIssuedController.text;
                                  widget.applicationData.placeOfIssue =
                                      _placeOfIssueController.text;
                                  widget.applicationData.dateOfPassportExpired =
                                      _dateOfPassportExpiredController.text;
                                  widget.applicationData.purposeOfTravel =
                                      _purposeOfTravelController.text;

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TravelDetailsPage(applicationData: widget.applicationData),
                                    ),
                                  );
                                }
                              },
                              child: const Text("Next", style: TextStyle(color: Colors.white, fontSize: 18)),
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
