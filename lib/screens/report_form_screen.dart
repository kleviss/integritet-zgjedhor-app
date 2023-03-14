import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';
import 'package:go_router/go_router.dart';
import 'package:integriteti_zgjedhor_app/widgets/my_cupertino_action_sheet.dart';

class ReportFormScreen extends StatefulWidget {
  @override
  _ReportFormScreenState createState() => _ReportFormScreenState();
}

class _ReportFormScreenState extends State<ReportFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _nameSurnameController = TextEditingController();
  final _bashkiaController = TextEditingController();
  final _field3Controller = TextEditingController();
  final _field4Controller = TextEditingController();
  final _fieldDataShkeljes = TextEditingController();
  final _field6Controller = TextEditingController();
  final _field7Controller = TextEditingController();
  final _field8Controller = TextEditingController();
  final _field9Controller = TextEditingController();
  final _field10Controller = TextEditingController();

  List<String> _options = ['Option 1', 'Option 2', 'Option 3'];
  String? _selectedOption = '';

  List<String> _bashkiaOptions = ['Bashkia Vlorë', 'Bashkia Tiranë', 'Bashkia Kavajë', 'Bashkia Rrogozhinë'];

  _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform submit operation here
      print('Form submitted');
    }
  }

  String reportPageInfo =
      'Ju po sinjalizoni për shkeljen e Kodit Zgjedhor si shit-blerja e votës, keqpërdorimi i burimeve shteterore dhe krimet zgjedhore. Për më shumë informacion sesi administrohen këto raportime, ju lutem ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Raporto shkelje',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8.0),
                  Text.rich(
                    TextSpan(
                      text: reportPageInfo,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                      ),
                      children: [
                        TextSpan(
                          text: 'klikoni këtu.',
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.push(
                                '/privacy-policy',
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CupertinoTextFormFieldRow(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22.0,
                      vertical: 8.0,
                    ),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: CupertinoColors.separator,
                          width: 0.0,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                    prefix: const Icon(CupertinoIcons.person),
                    placeholder: 'Emri dhe mbiemri i shkelësit',
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    autocorrect: false,
                    onChanged: (value) {
                      setState(() {
                        _nameSurnameController.text = value;
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Ju lutem shkruani emrin dhe mbiemrin e shkelësit';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),

                  GestureDetector(
                    child: Stack(
                      children: [
                        CupertinoTextFormFieldRow(
                          smartDashesType: SmartDashesType.disabled,
                          controller: _bashkiaController,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 22.0,
                            vertical: 8.0,
                          ),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: CupertinoColors.separator,
                                width: 0.0,
                                style: BorderStyle.solid,
                              ),
                            ),
                          ),
                          prefix: const Icon(Icons.domain),
                          placeholder: 'Bashkia',
                          keyboardType: TextInputType.none,
                          textCapitalization: TextCapitalization.words,
                          autocorrect: false,
                          onTap: () {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) => MyCupertinoActionSheet(
                                controller: _bashkiaController,
                                options: _bashkiaOptions,
                                sheetTitle: 'Zgjidhni bashkinë',
                                sheetSubtitle: 'Ju lutem zgjidhni bashkinë ku ka ndodhur shkelja',
                              ),
                            );
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Ju lutem shkruani emrin dhe mbiemrin e shkelësit';
                            }
                            return null;
                          },
                        ),
                        const Positioned(
                          top: 6,
                          right: 26,
                          child: Icon(
                            Icons.arrow_drop_down_sharp,
                            size: 26,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(height: 16.0),

                  // Description field
                  CupertinoTextFormFieldRow(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22.0,
                      vertical: 8.0,
                    ),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: CupertinoColors.separator,
                          width: 0.0,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                    prefix: const Icon(CupertinoIcons.t_bubble),
                    minLines: 1,
                    maxLines: 5,
                    placeholder: 'Përshkruani shkeljen e vëzhguar',
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    autocorrect: false,
                    onChanged: (value) {
                      setState(() {
                        _field4Controller.text = value;
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Ju lutem vendosni datën';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),

                  // Date Picker field
                  CupertinoTextFormFieldRow(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22.0,
                      vertical: 8.0,
                    ),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: CupertinoColors.separator,
                          width: 0.0,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                    prefix: const Icon(CupertinoIcons.calendar),
                    placeholder: 'Vendi ku ka ndodhur shkelja e supozuar',
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    autocorrect: false,
                    onChanged: (value) {
                      setState(() {
                        _field3Controller.text = value;
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Ju lutem vendosni vendin';
                      }

                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FastDatePicker(
                      icon: const Icon(CupertinoIcons.calendar),
                      adaptive: true,
                      modalCancelButtonText: 'Anulo',
                      name: 'Data e shkeljes',
                      labelText: 'Data e shkeljes',
                      onChanged: (value) {
                        setState(() {
                          _field4Controller.text = value.toString();
                        });
                      },
                      firstDate: DateTime.now().subtract(
                        const Duration(days: 365),
                      ),
                      lastDate: DateTime.now().add(
                        const Duration(days: 1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FastSegmentedControl(
                      name: 'field_destination',
                      labelText: 'Gjinia',
                      children: const {
                        '1': Text('Mashkull'),
                        '2': Text('Femer'),
                      },
                      onChanged: (value) {
                        setState(() {
                          _field6Controller.text = value.toString();
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 16.0),

                  GestureDetector(
                    child: Stack(
                      children: [
                        CupertinoTextFormFieldRow(
                          controller: _bashkiaController,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 22.0,
                            vertical: 8.0,
                          ),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: CupertinoColors.separator,
                                width: 0.0,
                                style: BorderStyle.solid,
                              ),
                            ),
                          ),
                          prefix: const Icon(Icons.domain),
                          placeholder: 'Burimi i informacionit',
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.words,
                          autocorrect: false,
                          onTap: () {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) => MyCupertinoActionSheet(
                                controller: _bashkiaController,
                                options: _bashkiaOptions,
                                sheetTitle: 'Zgjidhni bashkinë',
                                sheetSubtitle: 'Ju lutem zgjidhni bashkinë ku ka ndodhur shkelja',
                              ),
                            );
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Ju lutem shkruani emrin dhe mbiemrin e shkelësit';
                            }
                            return null;
                          },
                        ),
                        const Positioned(
                          top: 6,
                          right: 26,
                          child: Icon(
                            Icons.arrow_drop_down_sharp,
                            size: 26,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 26.0,
                      right: 26.0,
                      bottom: 6.0,
                      top: 12.0,
                    ),
                    child: Text(
                      "Qendresa Qytetare mban përgjegjësi ligjore sipas ligjit për mbrojtjen e të dhënave personale në lidhje me mbledhjen e informacionit personal të denoncuesve dhe deklaron se ky informacion nuk do t'u shpërndahet palëve të treta.",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: OutlinedButton(
                      onPressed: _submitForm,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.white),
                        foregroundColor: MaterialStateProperty.all(Colors.blue),
                        side: MaterialStateProperty.all(
                          const BorderSide(
                            color: Colors.blue,
                            width: 0.0,
                          ),
                        ),
                      ),
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
