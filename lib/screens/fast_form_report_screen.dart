import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';

class MyFormPage extends StatelessWidget {
  MyFormPage({Key? key, required this.title}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: FastForm(
            formKey: formKey,
            children: [
              SizedBox(height: 16.0),
              FastFormSection(
                header: const Text('My Form'),
                padding: EdgeInsets.all(16.0),
                children: [
                  FastTextField(
                    name: 'field_destination',
                    labelText: 'Destination',
                    placeholder: 'Where are you going?',
                  ),
                  FastDateRangePicker(
                    name: 'field_check_in_out',
                    labelText: 'Check-in - Check-out',
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  ),
                  FastCheckbox(
                    name: 'field_travel_purpose',
                    labelText: 'Travel purpose',
                    titleText: 'I am travelling for work',
                  ),
                ],
              ),
              FastFormSection(
                header: const Text('My Form'),
                padding: EdgeInsets.all(16.0),
                children: [
                  FastDropdown(
                    name: 'field_number_of_guests',
                    labelText: 'Number of guests',
                    items: [
                      Text('1'),
                      Text('2'),
                    ],
                  ),
                  FastDatePicker(
                    name: 'Data',
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(
                      const Duration(days: 365),
                    ),
                  ),
                  FastTimePicker(
                    name: 'field_destination',
                    labelText: 'Destination',
                  ),
                  FastSegmentedControl(
                    name: 'field_destination',
                    labelText: 'Gjinia',
                    children: {
                      '1': Text('Mashkull'),
                      '2': Text('Femer'),
                    },
                  ),
                  FastDropdown(
                    name: 'field_number_of_guests',
                    labelText: 'Number of guests',
                    items: [
                      DropdownMenuItem(
                        child: Text('1'),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text('2'),
                        value: 2,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
