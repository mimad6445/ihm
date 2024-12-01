import 'package:flutter/material.dart';
import 'package:ihm/constants.dart';

class Dropyy extends StatefulWidget {
  final List<String> dropItems;
  final String hintText;
  final TextEditingController controller; // Text controller to hold the value
  final void Function(String)? onChanged;

  const Dropyy({
    super.key, 
    required this.hintText, 
    required this.dropItems, 
    required this.controller, // TextEditingController required
    this.onChanged,
  });

  @override
  // ignore: library_private_types_in_public_api
  _DropyyState createState() => _DropyyState();
}

class _DropyyState extends State<Dropyy> {
  String? selectedValue; 
  @override
  void initState() {
    super.initState();
    if (widget.dropItems.contains(widget.controller.text)) {
      selectedValue = widget.controller.text;
    } else {
      selectedValue = null;
    }
  }

  @override
  void didUpdateWidget(Dropyy oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    if (widget.controller.text != selectedValue) {
      if (widget.dropItems.contains(widget.controller.text)) {
        setState(() {
          selectedValue = widget.controller.text;
        });
      } else {
        setState(() {
          selectedValue = null;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final uniqueDropItems = widget.dropItems.toSet().toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       const SizedBox(height: 15,),
        DropdownButtonFormField<String>(
          // ignore: prefer_const_constructors
          hint: Text('Gender'),
          value: selectedValue,
          items: uniqueDropItems.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(value, textAlign: TextAlign.right),
                ],
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedValue = value;
              widget.controller.text = value ?? ''; // Update controller with selected value
            });

            widget.onChanged?.call(value!); // Call the onChanged callback with selected value
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(width: 2, color: primaryColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
