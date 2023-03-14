import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';
import 'package:go_router/go_router.dart';

class ReportFormScreen extends StatefulWidget {
  @override
  _ReportFormScreenState createState() => _ReportFormScreenState();
}

class _ReportFormScreenState extends State<ReportFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _field1Controller = TextEditingController();
  final _field2Controller = TextEditingController();
  final _field3Controller = TextEditingController();
  final _field4Controller = TextEditingController();
  final _field5Controller = TextEditingController();
  final _field6Controller = TextEditingController();
  final _field7Controller = TextEditingController();
  final _field8Controller = TextEditingController();
  final _field9Controller = TextEditingController();
  final _field10Controller = TextEditingController();

  List<String> _options = ['Option 1', 'Option 2', 'Option 3'];
  String? _selectedOption = '';

  _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform submit operation here
      print('Form submitted');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
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
              padding: EdgeInsets.all(22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.0),
                  Text.rich(
                    TextSpan(
                      text:
                          'Ju po sinjalizoni për shkeljen e Kodit Zgjedhor si shit-blerja e votës, keqpërdorimi i burimeve shteterore dhe krimet zgjedhore. Për më shumë informacion sesi administrohen këto raportime, ju lutem ',
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
                        _field1Controller.text = value;
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Ju lutem shkruani emrin dhe mbiemrin e shkelësit';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),

                  GestureDetector(
                    child: Stack(
                      children: [
                        CupertinoTextFormFieldRow(
                          controller: _field2Controller,
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
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.words,
                          autocorrect: false,
                          onTap: () {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) => CupertinoActionSheet(
                                title: const Text('Zgjidh Bashkinë',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600)),
                                actions: <CupertinoActionSheetAction>[
                                  CupertinoActionSheetAction(
                                    child: const Text(
                                      'Bashkia Vlorë',
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _field2Controller.text =
                                            'Bashkia Vlorë';
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                  CupertinoActionSheetAction(
                                    child: const Text('Bashkia Tiranë'),
                                    onPressed: () {
                                      setState(() {
                                        _field2Controller.text =
                                            'Bashkia Vlorë';
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                  CupertinoActionSheetAction(
                                    child: const Text('Bashkia Kavaje'),
                                    onPressed: () {
                                      setState(() {
                                        _field2Controller.text =
                                            'Bashkia Vlorë';
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                  CupertinoActionSheetAction(
                                    child: const Text('Bashkia Rrogozhine'),
                                    onPressed: () {
                                      setState(() {
                                        _field2Controller.text =
                                            'Bashkia Vlorë';
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                  CupertinoActionSheetAction(
                                    child: const Text(
                                      'Bashkia Peqin',
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _field2Controller.text =
                                            'Bashkia Peqin';
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                  CupertinoActionSheetAction(
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.red,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
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
                          right: 20,
                          child: Icon(
                            Icons.arrow_drop_down_sharp,
                            size: 26,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (context) => CupertinoActionSheet(
                          title: const Text('Zgjidh Bashkinë',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600)),
                          actions: <CupertinoActionSheetAction>[
                            CupertinoActionSheetAction(
                              child: const Text(
                                'Bashkia Vlorë',
                              ),
                              onPressed: () {
                                print("Bashkia Vlorë");
                              },
                            ),
                            CupertinoActionSheetAction(
                              child: const Text('Bashkia Tiranë'),
                              onPressed: () {
                                print("Bashkia Vlorë");
                              },
                            ),
                            CupertinoActionSheetAction(
                              child: const Text('Bashkia Kavaje'),
                              onPressed: () {
                                print("Bashkia Vlorë");
                              },
                            ),
                            CupertinoActionSheetAction(
                              child: const Text('Bashkia Rrogozhine'),
                              onPressed: () {
                                print("Bashkia Vlorë");
                              },
                            ),
                            CupertinoActionSheetAction(
                              child: const Text(
                                'Bashkia Peqin',
                              ),
                              onPressed: () {},
                            ),
                            CupertinoActionSheetAction(
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w600),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 16.0),

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
                  SizedBox(height: 16.0),

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
                      adaptive: true,
                      modalCancelButtonText: 'Anulo',
                      name: 'Data e shkeljes',
                      labelText: 'Data e shkeljes',
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
                      children: {
                        '1': Text('Mashkull'),
                        '2': Text('Femer'),
                      },
                    ),
                  ),
                  SizedBox(height: 16.0),

                  GestureDetector(
                    child: Stack(
                      children: [
                        CupertinoTextFormFieldRow(
                          controller: _field2Controller,
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
                              builder: (context) => CupertinoActionSheet(
                                title: const Text('Zgjidh Burimin',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600)),
                                actions: <CupertinoActionSheetAction>[
                                  CupertinoActionSheetAction(
                                    child: const Text(
                                      'Bashkia Vlorë',
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _field2Controller.text =
                                            'Bashkia Vlorë';
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                  CupertinoActionSheetAction(
                                    child: const Text('Bashkia Tiranë'),
                                    onPressed: () {
                                      setState(() {
                                        _field2Controller.text =
                                            'Bashkia Vlorë';
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                  CupertinoActionSheetAction(
                                    child: const Text('Bashkia Kavaje'),
                                    onPressed: () {
                                      setState(() {
                                        _field2Controller.text =
                                            'Bashkia Vlorë';
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                  CupertinoActionSheetAction(
                                    child: const Text('Bashkia Rrogozhine'),
                                    onPressed: () {
                                      setState(() {
                                        _field2Controller.text =
                                            'Bashkia Vlorë';
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                  CupertinoActionSheetAction(
                                    child: const Text(
                                      'Bashkia Peqin',
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _field2Controller.text =
                                            'Bashkia Peqin';
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                  CupertinoActionSheetAction(
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.red,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
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
                          right: 20,
                          child: Icon(
                            Icons.arrow_drop_down_sharp,
                            size: 26,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (context) => CupertinoActionSheet(
                          title: const Text('Zgjidh Bashkinë',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600)),
                          actions: <CupertinoActionSheetAction>[
                            CupertinoActionSheetAction(
                              child: const Text(
                                'Bashkia Vlorë',
                              ),
                              onPressed: () {
                                print("Bashkia Vlorë");
                              },
                            ),
                            CupertinoActionSheetAction(
                              child: const Text('Bashkia Tiranë'),
                              onPressed: () {
                                print("Bashkia Vlorë");
                              },
                            ),
                            CupertinoActionSheetAction(
                              child: const Text('Bashkia Kavaje'),
                              onPressed: () {
                                print("Bashkia Vlorë");
                              },
                            ),
                            CupertinoActionSheetAction(
                              child: const Text('Bashkia Rrogozhine'),
                              onPressed: () {
                                print("Bashkia Vlorë");
                              },
                            ),
                            CupertinoActionSheetAction(
                              child: const Text(
                                'Bashkia Peqin',
                              ),
                              onPressed: () {},
                            ),
                            CupertinoActionSheetAction(
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w600),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 22.0,
                      right: 22.0,
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
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        foregroundColor: MaterialStateProperty.all(Colors.blue),
                        side: MaterialStateProperty.all(
                          const BorderSide(
                            color: Colors.blue,
                            width: 0.0,
                          ),
                        ),
                      ),
                      child: Text('Submit'),
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
