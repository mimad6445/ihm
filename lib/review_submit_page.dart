import 'package:flutter/material.dart';
import 'package:ihm/constants.dart';
import 'package:ihm/main.dart';
import 'visa_application_data.dart';

class ReviewSubmitPage extends StatelessWidget {
  final VisaApplicationData applicationData;

  const ReviewSubmitPage({super.key, required this.applicationData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildProgressIndicator(5, 5),
            const SizedBox(height: 20),
            Text(
              "Step 5: Review & Submit",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 20),
            // Display all the collected information
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Personal Information
                    const Text("Personal Information",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const Divider(),
                    Text("Full Name: ${applicationData.fullName}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text("Place of Birth: ${applicationData.placeOfBirth}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text("Date of Birth: ${applicationData.dateOfBirth}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text("Sex: ${applicationData.sex}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text("Marital Status: ${applicationData.maritalStatus}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text("Profession: ${applicationData.profession}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text("Qualification: ${applicationData.qualification}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text("Place of Issue: ${applicationData.placeOfIssue}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(height: 15),

                    // Contact Information
                    const Text("Contact Information",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const Divider(),
                    Text("Phone Number: ${applicationData.phoneNumber}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text("Email: ${applicationData.email}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text("Address: ${applicationData.address}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(height: 15),

                    // Family Information
                    const Text("Family Information",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const Divider(),
                    Text("Mother's Name: ${applicationData.motherName}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text("Religion: ${applicationData.religion}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text("Sect: ${applicationData.sect}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(height: 15),

                    // Passport Details
                    const Text("Passport Details",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const Divider(),
                    Text("Passport Number: ${applicationData.passportNumber}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text("Date of Passport Issued: ${applicationData.dateOfPassportIssued}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text("Place of Issue: ${applicationData.placeOfIssue2}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text("Date of Passport Expiry: ${applicationData.dateOfPassportExpired}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text("Purpose of Travel: ${applicationData.purposeOfTravel}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(height: 15),

                    // Visa Details
                    const Text("Visa Details",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const Divider(),
                    Text("Visa Type: ${applicationData.visaType}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text("Purpose of Visit: ${applicationData.purposeOfVisit}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text("Length of Stay: ${applicationData.lengthOfStay}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(height: 15),

                    // Travel Details
                    const Text("Travel Details",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const Divider(),
                    Text("Date of Departure: ${applicationData.dateOfDeparture}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text("Date of Arrival: ${applicationData.dateOfArrival}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text("Duration of Stay in Kingdom: ${applicationData.durationOfStayInKingdom}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text("Mode of Payment: ${applicationData.modeOfPayment}",
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back Button
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
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
                // Submit Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    foregroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                  onPressed: () {
                    // Implement form submission logic here
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Submission Successful"),
                        content: const Text(
                            "Your visa application has been submitted successfully."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .popUntil((route) => route.isFirst);
                            },
                            child: const Text("OK"),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text("Submit",
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
