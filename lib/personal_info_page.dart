import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ihm/main.dart';
import 'package:image_picker/image_picker.dart';
import 'visa_application_data.dart';
import 'package:ihm/components/day_selector.dart';
import 'package:ihm/components/droppy.dart';
import 'package:ihm/constants.dart';
import 'package:ihm/personal_info_page2.dart';

class PersonalInfoPage extends StatefulWidget {
  final VisaApplicationData applicationData;
  final VoidCallback onNext;

  const PersonalInfoPage({super.key, required this.applicationData, required this.onNext});

  @override
  // ignore: library_private_types_in_public_api
  _PersonalInfoPageState createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _placeOfBirthController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _sexController = TextEditingController();
  final TextEditingController _professionController = TextEditingController();
  final TextEditingController _qualificationController =
      TextEditingController();
  final TextEditingController _placeOfIssueController = TextEditingController();
  String _sex = 'Male';
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _fullNameController.text = widget.applicationData.fullName;
    _placeOfBirthController.text = widget.applicationData.placeOfBirth;
    _dobController.text = widget.applicationData.dateOfBirth;
    _sex = widget.applicationData.sex.isNotEmpty
        ? widget.applicationData.sex
        : 'Male';
    _professionController.text = widget.applicationData.profession;
    _qualificationController.text = widget.applicationData.qualification;
    _placeOfIssueController.text = widget.applicationData.placeOfIssue;
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _placeOfBirthController.dispose();
    _dobController.dispose();
    _professionController.dispose();
    _qualificationController.dispose();
    _placeOfIssueController.dispose();
    super.dispose();
  }

  Future<void> pickImage() async {
    if (Platform.isAndroid || Platform.isIOS) {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _selectedImage = File(pickedFile.path);
        });
      }
    } else if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      final result = await FilePicker.platform.pickFiles(type: FileType.image);
      if (result != null) {
        setState(() {
          _selectedImage = File(result.files.single.path!);
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
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.65,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  buildProgressIndicator(0, 4),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: pickImage,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey.shade300,
                      backgroundImage: _selectedImage != null
                          ? FileImage(_selectedImage!)
                          : null,
                      child: _selectedImage == null
                          ? const Icon(Icons.add_a_photo,
                              size: 50, color: Colors.grey)
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
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
                  const SizedBox(height: 20),
                  Text(
                    "Step 1: Personal Information",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _fullNameController,
                          decoration: InputDecoration(
                            labelText: 'Full Name',
                            border: const OutlineInputBorder(),
                            prefixIcon: Icon(Icons.person, color: primaryColor),
                          ),
                          validator: (value) =>
                              value!.isEmpty ? 'Required' : null,
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: _placeOfBirthController,
                          decoration: InputDecoration(
                            labelText: 'Place of Birth',
                            border: const OutlineInputBorder(),
                            prefixIcon:
                                Icon(Icons.location_city, color: primaryColor),
                          ),
                          validator: (value) =>
                              value!.isEmpty ? 'Required' : null,
                        ),
                        const SizedBox(height: 15),
                        BirthdaySelectorScreen(myDobController: _dobController),
                        Dropyy(
                          hintText: 'Sex',
                          dropItems: const ['Male', 'Female'],
                          controller: _sexController,
                          onChanged: (value) {
                            setState(() {
                              _sex = value;
                            });
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: _professionController,
                          decoration: InputDecoration(
                            labelText: 'Profession',
                            border: const OutlineInputBorder(),
                            prefixIcon: Icon(Icons.work, color: primaryColor),
                          ),
                          validator: (value) =>
                              value!.isEmpty ? 'Required' : null,
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: _qualificationController,
                          decoration: InputDecoration(
                            labelText: 'Qualification',
                            border: const OutlineInputBorder(),
                            prefixIcon: Icon(Icons.school, color: primaryColor),
                          ),
                          validator: (value) =>
                              value!.isEmpty ? 'Required' : null,
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: _placeOfIssueController,
                          decoration: InputDecoration(
                            labelText: 'Place of Issue',
                            border: const OutlineInputBorder(),
                            prefixIcon:
                                Icon(Icons.location_on, color: primaryColor),
                          ),
                          validator: (value) =>
                              value!.isEmpty ? 'Required' : null,
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 20),
                            foregroundColor: Colors.white,
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              widget.applicationData.fullName =
                                  _fullNameController.text;
                              widget.applicationData.placeOfBirth =
                                  _placeOfBirthController.text;
                              widget.applicationData.dateOfBirth =
                                  _dobController.text;
                              widget.applicationData.sex = _sex;
                              widget.applicationData.profession =
                                  _professionController.text;
                              widget.applicationData.qualification =
                                  _qualificationController.text;
                              widget.applicationData.placeOfIssue =
                                  _placeOfIssueController.text;

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PersonalDetails2Page(
                                          applicationData:
                                              widget.applicationData,
                                          onNext: widget.onNext,
                                        )),
                              );
                            }
                          },
                          child: const Text("Next",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18)),
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
