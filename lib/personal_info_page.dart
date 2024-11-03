import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ihm/main.dart';
import 'package:image_picker/image_picker.dart';
import 'visa_application_data.dart';
import 'contact_info_page.dart';
import 'package:ihm/components/day_selector.dart';
import 'package:ihm/components/droppy.dart';
import 'package:ihm/constants.dart';

class PersonalInfoPage extends StatefulWidget {
  final VisaApplicationData applicationData;
  final VoidCallback onNext;

  PersonalInfoPage({required this.applicationData, required this.onNext});

  @override
  _PersonalInfoPageState createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _nationalityController = TextEditingController();
  String _gender = 'Male';
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _firstNameController.text = widget.applicationData.firstName;
    _lastNameController.text = widget.applicationData.lastName;
    _dobController.text = widget.applicationData.dateOfBirth;
    _gender = widget.applicationData.gender.isNotEmpty
        ? widget.applicationData.gender
        : 'Male';
    _nationalityController.text = widget.applicationData.nationality;
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _dobController.dispose();
    _nationalityController.dispose();
    super.dispose();
  }
Future<void> pickImage() async {
  if (Platform.isAndroid || Platform.isIOS) {
    // Use image_picker for mobile platforms
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Handle mobile image file
    }
  } else if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    // Use file_picker for desktop platforms
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      setState(() {
        _selectedImage = File(result.files.single.path!);  // Store selected file as a File object
      });
    }
  }
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
                  buildProgressIndicator(0, 4),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: pickImage,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey.shade300,
                      backgroundImage: _selectedImage != null
                          ? FileImage(_selectedImage!)
                          : null,
                      child: _selectedImage == null
                          ? Icon(Icons.add_a_photo, size: 50, color: Colors.grey)
                          : ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),  // Rounded corners
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),  // Same border radius as ClipRRect
                      ),
                      child: Image.file(
                        _selectedImage!,
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Step 1: Personal Information",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _firstNameController,
                          decoration: InputDecoration(
                            labelText: 'First Name',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.person, color: primaryColor),
                          ),
                          validator: (value) =>
                              value!.isEmpty ? 'Required' : null,
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          controller: _lastNameController,
                          decoration: InputDecoration(
                            labelText: 'Last Name',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.person_outline,
                                color: primaryColor),
                          ),
                          validator: (value) =>
                              value!.isEmpty ? 'Required' : null,
                        ),
                        SizedBox(height: 15),
                        BirthdaySelectorScreen(myDobController: _dobController),
                        Dropyy(
                          hintText: 'Gender',
                          dropItems: ['Male', 'Female'],
                          controller: _genderController,
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          controller: _nationalityController,
                          decoration: InputDecoration(
                            labelText: 'Nationality',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.flag, color: primaryColor),
                          ),
                          validator: (value) =>
                              value!.isEmpty ? 'Required' : null,
                        ),
                        SizedBox(height: 30),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 20),
                            foregroundColor: Colors.white,
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              widget.applicationData.firstName =
                                  _firstNameController.text;
                              widget.applicationData.lastName =
                                  _lastNameController.text;
                              widget.applicationData.dateOfBirth =
                                  _dobController.text;
                              widget.applicationData.gender = _gender;
                              widget.applicationData.nationality =
                                  _nationalityController.text;

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ContactInfoPage(
                                    applicationData: widget.applicationData,
                                    onNext: () {},
                                  ),
                                ),
                              );
                            }
                          },
                          child: Text("Next",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18)),
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
