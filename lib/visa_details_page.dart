import 'package:flutter/material.dart';
import 'package:ihm/constants.dart';
import 'package:ihm/main.dart';
import 'visa_application_data.dart';
import 'review_submit_page.dart';

class TravelDetailsPage extends StatefulWidget {
  final VisaApplicationData applicationData;

  const TravelDetailsPage({super.key, required this.applicationData});

  @override
  // ignore: library_private_types_in_public_api
  _TravelDetailsPageState createState() => _TravelDetailsPageState();
}

class _TravelDetailsPageState extends State<TravelDetailsPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _dateOfDepartureController = TextEditingController();
  final TextEditingController _dateOfArrivalController = TextEditingController();
  final TextEditingController _durationOfStayController = TextEditingController();
  String _modeOfPayment = 'Credit Card';

  @override
  void initState() {
    super.initState();
    // Initialize the fields with the existing data if available
    _dateOfDepartureController.text = widget.applicationData.dateOfDeparture;
    _dateOfArrivalController.text = widget.applicationData.dateOfArrival;
    _durationOfStayController.text = widget.applicationData.durationOfStayInKingdom;
    _modeOfPayment = widget.applicationData.modeOfPayment.isNotEmpty
        ? widget.applicationData.modeOfPayment
        : 'Credit Card';
  }

  @override
  void dispose() {
    _dateOfDepartureController.dispose();
    _dateOfArrivalController.dispose();
    _durationOfStayController.dispose();
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
                  buildProgressIndicator(3, 4),
                  const SizedBox(height: 20),
                  Text(
                    "Step 4: Travel Details",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _dateOfDepartureController,
                          decoration: InputDecoration(
                            labelText: 'Date of Departure',
                            border: const OutlineInputBorder(),
                            prefixIcon: Icon(Icons.date_range, color: primaryColor),
                          ),
                          keyboardType: TextInputType.datetime,
                          validator: (value) => value!.isEmpty ? 'Required' : null,
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: _dateOfArrivalController,
                          decoration: InputDecoration(
                            labelText: 'Date of Arrival',
                            border: const OutlineInputBorder(),
                            prefixIcon: Icon(Icons.date_range, color: primaryColor),
                          ),
                          keyboardType: TextInputType.datetime,
                          validator: (value) => value!.isEmpty ? 'Required' : null,
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: _durationOfStayController,
                          decoration: InputDecoration(
                            labelText: 'Duration of Stay in Kingdom (in days)',
                            border: const OutlineInputBorder(),
                            prefixIcon: Icon(Icons.timer, color: primaryColor),
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
                        const SizedBox(height: 15),
                        DropdownButtonFormField<String>(
                          value: _modeOfPayment,
                          decoration: InputDecoration(
                            labelText: 'Mode of Payment',
                            border: const OutlineInputBorder(),
                            prefixIcon: Icon(Icons.payment, color: primaryColor),
                          ),
                          items: ['Credit Card', 'Debit Card', 'Bank Transfer', 'Cash']
                              .map((mode) => DropdownMenuItem(
                                    value: mode,
                                    child: Text(mode),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _modeOfPayment = value!;
                            });
                          },
                          validator: (value) =>
                              value == null || value.isEmpty ? 'Required' : null,
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
                                style: TextStyle(color: primaryColor, fontSize: 18),
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
                                  // Update the application data with travel details
                                  widget.applicationData.dateOfDeparture =
                                      _dateOfDepartureController.text;
                                  widget.applicationData.dateOfArrival =
                                      _dateOfArrivalController.text;
                                  widget.applicationData.durationOfStayInKingdom =
                                      _durationOfStayController.text;
                                  widget.applicationData.modeOfPayment = _modeOfPayment;

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ReviewSubmitPage(
                                          applicationData: widget.applicationData),
                                    ),
                                  );
                                }
                              },
                              child: const Text("Next",
                                  style: TextStyle(color: Colors.white, fontSize: 18)),
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
