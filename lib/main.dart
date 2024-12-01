import 'package:flutter/material.dart';
import 'package:ihm/constants.dart';
import 'package:ihm/personal_info_page.dart';
import 'visa_application_data.dart'; 
void main() {
  runApp(const VisaApplicationForm());
}

class VisaApplicationForm extends StatefulWidget {
  const VisaApplicationForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VisaApplicationFormState createState() => _VisaApplicationFormState();
}

class _VisaApplicationFormState extends State<VisaApplicationForm> {
  VisaApplicationData applicationData = VisaApplicationData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Visa Application Form',
      theme: ThemeData(
        buttonTheme: ButtonThemeData(
          buttonColor: secondaryColor
        ),
        focusColor: primaryColor,
        primaryColor: primaryColor,
        hoverColor: Colors.orangeAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          headlineLarge: TextStyle(
              color: primaryColor, fontWeight: FontWeight.bold, fontSize: 24),
          
          bodyMedium: const TextStyle(fontSize: 16),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(color: Color.fromARGB(255, 96, 95, 95)),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
      
      ),
      home: PersonalInfoPage(
        applicationData: applicationData,
        onNext: () {
          setState(() {}); 
        },
      ),
    );
  }
}

Widget buildProgressIndicator(int currentStep, int totalSteps) {
  return Row(
    children: List.generate(totalSteps, (index) {
      return Expanded(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          height: 8.0,
          decoration: BoxDecoration(
            color: index <= currentStep
                ? primaryColor
                : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      );
    }),
  );
}

Widget customButton(String text, VoidCallback onPressed) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      foregroundColor: primaryColor,
      backgroundColor: secondaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    ),
    onPressed: onPressed,
    child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 18)),
  );
}
