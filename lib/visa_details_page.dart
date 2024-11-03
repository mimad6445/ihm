import 'package:flutter/material.dart';
import 'package:ihm/constants.dart';
import 'package:ihm/main.dart';
import 'visa_application_data.dart';
import 'review_submit_page.dart';

class VisaDetailsPage extends StatefulWidget {
  final VisaApplicationData applicationData;

  VisaDetailsPage({required this.applicationData});

  @override
  _VisaDetailsPageState createState() => _VisaDetailsPageState();
}

class _VisaDetailsPageState extends State<VisaDetailsPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _passportNumberController =
      TextEditingController();
  String _visaType = 'Tourist';
  final TextEditingController _purposeOfVisitController =
      TextEditingController();
  final TextEditingController _lengthOfStayController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _passportNumberController.text = widget.applicationData.passportNumber;
    _visaType = widget.applicationData.visaType.isNotEmpty
        ? widget.applicationData.visaType
        : 'Tourist';
    _purposeOfVisitController.text = widget.applicationData.purposeOfVisit;
    _lengthOfStayController.text = widget.applicationData.lengthOfStay;
  }

  @override
  void dispose() {
    _passportNumberController.dispose();
    _purposeOfVisitController.dispose();
    _lengthOfStayController.dispose();
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
                  buildProgressIndicator(3, 4),
                  SizedBox(height: 20),
                  Text(
                    "Step 4: Visa Details",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _passportNumberController,
                          decoration: InputDecoration(
                            labelText: 'Passport Number',
                            border: OutlineInputBorder(),
                            prefixIcon:
                                Icon(Icons.card_travel, color:  primaryColor),
                          ),
                          validator: (value) =>
                              value!.isEmpty ? 'Required' : null,
                        ),
                        SizedBox(height: 15),
                        DropdownButtonFormField<String>(
                          value: _visaType,
                          decoration: InputDecoration(
                            labelText: 'Visa Type',
                            border: OutlineInputBorder(),
                            prefixIcon:
                                Icon(Icons.card_travel, color:  primaryColor),
                          ),
                          items: ['Tourist','Hadj', 'Business', 'Student', 'Work']
                              .map((type) => DropdownMenuItem(
                                    value: type,
                                    child: Text(type),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _visaType = value!;
                            });
                          },
                          validator: (value) =>
                              value == null || value.isEmpty
                                  ? 'Required'
                                  : null,
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          controller: _purposeOfVisitController,
                          decoration: InputDecoration(
                            labelText: 'Purpose of Visit',
                            border: OutlineInputBorder(),
                            prefixIcon:
                                Icon(Icons.integration_instructions, color:  primaryColor),
                          ),
                          validator: (value) =>
                              value!.isEmpty ? 'Required' : null,
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          
                          controller: _lengthOfStayController,
                          decoration: InputDecoration(
                            
                            labelText: 'Length of Stay (in days)',
                            border: OutlineInputBorder(),
                            prefixIcon:
                                Icon(Icons.timer, color: primaryColor),
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Required';
                            }
                            if (int.tryParse(value) == null) {
                              return 'Enter a valid number';
                            }
                            return null;
                          },
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
                                padding: EdgeInsets.symmetric(vertical: 16.0),
                                foregroundColor: Colors.white,
                                backgroundColor: primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  widget.applicationData.passportNumber =
                                      _passportNumberController.text;
                                  widget.applicationData.visaType = _visaType;
                                  widget.applicationData.purposeOfVisit =
                                      _purposeOfVisitController.text;
                                  widget.applicationData.lengthOfStay =
                                      _lengthOfStayController.text;
            
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ReviewSubmitPage(
                                            applicationData:
                                                widget.applicationData)),
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
