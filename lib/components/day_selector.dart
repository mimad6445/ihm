import 'package:flutter/material.dart';
import 'package:ihm/constants.dart';

class BirthdaySelectorScreen extends StatefulWidget {
 final TextEditingController myDobController = TextEditingController();

  BirthdaySelectorScreen({super.key, required myDobController});
 
  @override
  _BirthdaySelectorScreenState createState() => _BirthdaySelectorScreenState();
}

class _BirthdaySelectorScreenState extends State<BirthdaySelectorScreen> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: widget.myDobController,
            readOnly: true, 
            onTap: () => _selectDate(context), 
            decoration: InputDecoration(
              labelText: 'Select Birthday',
              hintText: _selectedDate == null
                  ? 'No date selected'
                  : '${_selectedDate!.toLocal()}'.split(' ')[0],
              prefixIcon: Icon(Icons.calendar_today,color: primaryColor,),
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
