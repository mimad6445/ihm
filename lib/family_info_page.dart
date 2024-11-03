// family_info_page.dart
import 'package:flutter/material.dart';
import 'package:ihm/constants.dart';
import 'package:ihm/main.dart';
import 'visa_application_data.dart';
import 'visa_details_page.dart';

class FamilyInfoPage extends StatefulWidget {
  final VisaApplicationData applicationData;
  final VoidCallback onNext;

  FamilyInfoPage({required this.applicationData, required this.onNext});

  @override
  _FamilyInfoPageState createState() => _FamilyInfoPageState();
}

class _FamilyInfoPageState extends State<FamilyInfoPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _spouseNameController = TextEditingController();
  final TextEditingController _numberOfChildrenController =
      TextEditingController();
  final TextEditingController motherNameController =
      TextEditingController();
  

  @override
  void initState() {
    super.initState();
    // Initialize controllers with existing data
    _spouseNameController.text = widget.applicationData.spouseName;
    _numberOfChildrenController.text =
        widget.applicationData.numberOfChildren.toString();
    motherNameController.text =
        widget.applicationData.motherNameController;
   
  }

  @override
  void dispose() {
    _spouseNameController.dispose();
    _numberOfChildrenController.dispose();
    motherNameController.dispose();
    
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
                  buildProgressIndicator(2, 4),
                  SizedBox(height: 20),
                  Text(
                    "Step 3: Family Information",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: motherNameController,
                          decoration: InputDecoration(
                            labelText: "Mother's Name",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.person, color: primaryColor),
                          ),
                        ),
                        SizedBox(height: 15,),
                        TextFormField(
                          controller: _spouseNameController,
                          decoration: InputDecoration(
                            labelText: "Spouse's Name (if applicable)",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.person, color: primaryColor),
                          ),
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          controller: _numberOfChildrenController,
                          decoration: InputDecoration(
                            labelText: 'Number of Children',
                            border: OutlineInputBorder(),
                            prefixIcon:
                                Icon(Icons.child_care, color: primaryColor),
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
                        SizedBox(height: 15),
                        
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
                                  // Update the application data
                                  widget.applicationData.spouseName =
                                      _spouseNameController.text;
                                  widget.applicationData.numberOfChildren =
                                      int.parse(
                                          _numberOfChildrenController.text);
                                  widget.applicationData.motherNameController =
                                      motherNameController.text;
                                  
            
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => VisaDetailsPage(
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
