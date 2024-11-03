// review_submit_page.dart
import 'package:flutter/material.dart';
import 'package:ihm/constants.dart';
import 'package:ihm/main.dart';
import 'visa_application_data.dart';

class ReviewSubmitPage extends StatelessWidget {
  final VisaApplicationData applicationData;

  ReviewSubmitPage({required this.applicationData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildProgressIndicator(4, 4),
            SizedBox(height: 20),
            Text(
              "Step 5: Review & Submit",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 20),
            // Display all the collected information
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Personal Information",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Divider(),
                    Text("First Name: ${applicationData.firstName}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text("Last Name: ${applicationData.lastName}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text("Date of Birth: ${applicationData.dateOfBirth}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text("Gender: ${applicationData.gender}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text("Nationality: ${applicationData.nationality}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    SizedBox(height: 15),
                    Text("Contact Information",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Divider(),
                    Text("Email: ${applicationData.email}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text("Phone Number: ${applicationData.phoneNumber}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text("Address: ${applicationData.address}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    SizedBox(height: 15),
                    Text("Family Information",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Divider(),
                    Text(
                        "Mother's Name: ${applicationData.motherNameController}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text("Spouse's Name: ${applicationData.spouseName}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text(
                        "Number of Children: ${applicationData.numberOfChildren}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    
                    SizedBox(height: 15),
                    Text("Visa Details",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Divider(),
                    Text(
                        "Passport Number: ${applicationData.passportNumber}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text("Visa Type: ${applicationData.visaType}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text(
                        "Purpose of Visit: ${applicationData.purposeOfVisit}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text(
                        "Length of Stay: ${applicationData.lengthOfStay} days",
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                    side: BorderSide(color: primaryColor),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
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
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    foregroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                  onPressed: () {
                    // Implement form submission logic here
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Submission Successful"),
                        content: Text(
                            "Your visa application has been submitted successfully."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .popUntil((route) => route.isFirst);
                            },
                            child: Text("OK"),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text("Submit",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
