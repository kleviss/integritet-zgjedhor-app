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
  final _nameSurnameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _bashkiaController = TextEditingController();
  final _fieldShkeljaVezhguar = TextEditingController();
  final _fieldVendiController = TextEditingController();
  final _fieldDataShkeljesController = TextEditingController();
  final _fieldGjiniaController = TextEditingController();
  final _fieldBurimiInformacionitController = TextEditingController();
  final _fieldkryeresiShkeljesController = TextEditingController();
  final _fieldLinkController = TextEditingController();
  final _fieldNrTelController = TextEditingController();

  List<String> _options = ['Option 1', 'Option 2', 'Option 3'];
  String? _selectedOption = '';

  final List<String> _bashkiaOptions = [
    'Bashkia Tiranë',
    'Bashkia Vlorë',
    'Bashkia Elbasan',
    'Bashkia Durrës',
    'Bashkia Berat',
    'Bashkia Korçë',
    'Bashkia Fier',
    'Bashkia Gjirokastër',
    'Bashkia Shkodër',
    'Bashkia Dibër',
    'Bashkia Malësi e Madhe',
    'Bashkia Kukës',
    'Bashkia Lezhë',
    'Në të gjithë Shqipërinë',
  ];
  final List<String> _burimiInformacionitOptions = [
    'Media',
    'Rrjete sociale',
    'Votues',
    'Kandidatet Politike',
    'Terreni',
    'Tjetër'
  ];

  final List<String> _kryeresiShkeljesOptions = [
    'Garues elektoral - parti politike',
    'Garues elektoral - kandidat',
    'Organi i administratës zgjedhore',
    'Nëpunës publik',
    'Zyrtar i zgjedhur (për shembull Anëtar i Këshillit Bashkiak)',
  ];

  _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform submit operation here
      print('Form submitted');
      // print all the controller fields
      print('Name: ${_nameSurnameController.text}');
      print('Description: ${_descriptionController.text}');
      print('Bashkia: ${_bashkiaController.text}');
      print('Shkelja Vezhguar: ${_fieldShkeljaVezhguar.text}');
      print('Vendi: ${_fieldVendiController.text}');
      print('Data Shkeljes: ${_fieldDataShkeljesController.text}');
      print('Gjinia: ${_fieldGjiniaController.text}');
      print('Burimi Informacionit: ${_fieldBurimiInformacionitController.text}');
      print('Kryeresi Shkeljes: ${_fieldkryeresiShkeljesController.text}');
      print('Link: ${_fieldLinkController.text}');
      print('Nr Tel: ${_fieldNrTelController.text}');
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

            // Form
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // emri dhe mbiemri
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

                  // Bashkia
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
                        _fieldShkeljaVezhguar.text = value;
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Kjo fushë nuk mund të lihet bosh';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),

                  // vendi field
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
                    prefix: const Icon(CupertinoIcons.placemark),
                    placeholder: 'Vendi ku ka ndodhur shkelja e supozuar',
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    autocorrect: false,
                    onChanged: (value) {
                      setState(() {
                        _fieldVendiController.text = value;
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Ju lutem vendosni vendin';
                      }

                      return null;
                    },
                  ),

                  // Data e shkeljes
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
                          _fieldDataShkeljesController.text = value.toString();
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
                        '1': Text('Femer'),
                        '2': Text('Mashkull'),
                      },
                      onChanged: (value) {
                        setState(() {
                          _fieldGjiniaController.text = value.toString();
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 16.0),

                  // burimi i informacionit
                  GestureDetector(
                    child: Stack(
                      children: [
                        CupertinoTextFormFieldRow(
                          controller: _fieldBurimiInformacionitController,
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
                          prefix: const Icon(Icons.newspaper),
                          placeholder: 'Burimi i informacionit',
                          keyboardType: TextInputType.none,
                          textCapitalization: TextCapitalization.words,
                          autocorrect: false,
                          onTap: () {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) => MyCupertinoActionSheet(
                                controller: _fieldBurimiInformacionitController,
                                options: _burimiInformacionitOptions,
                                sheetTitle: 'Burimi i informacionit',
                                sheetSubtitle:
                                    'Zgjidhni burimin e informacionit që ju ka informuar për shkeljen e vëzhguar',
                              ),
                            );
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Ju lutem zgjidhni burimin e informacionit';
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
                    onTap: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (context) => MyCupertinoActionSheet(
                          controller: _fieldBurimiInformacionitController,
                          options: _burimiInformacionitOptions,
                          sheetTitle: 'Burimi i informacionit',
                          sheetSubtitle: 'Zgjidhni burimin e informacionit që ju ka informuar për shkeljen e vëzhguar',
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16.0),

                  // kryerësi i shkeljes field
                  GestureDetector(
                    child: Stack(
                      children: [
                        CupertinoTextFormFieldRow(
                          controller: _fieldkryeresiShkeljesController,
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
                          prefix: const Icon(Icons.person_add_alt_1),
                          placeholder: 'Kryerësi i shkeljes',
                          keyboardType: TextInputType.none,
                          textCapitalization: TextCapitalization.words,
                          autocorrect: false,
                          onTap: () {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) => MyCupertinoActionSheet(
                                controller: _fieldkryeresiShkeljesController,
                                options: _kryeresiShkeljesOptions,
                                sheetTitle: 'Kryerësi i shkeljes',
                                sheetSubtitle: 'Zgjidhni kryerësin e shkeljes',
                              ),
                            );
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Ju lutem zgjidhni kryerësin e shkeljes';
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
                    onTap: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (context) => MyCupertinoActionSheet(
                          controller: _fieldBurimiInformacionitController,
                          options: _burimiInformacionitOptions,
                          sheetTitle: 'Burimi i informacionit',
                          sheetSubtitle: 'Zgjidhni burimin e informacionit që ju ka informuar për shkeljen e vëzhguar',
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16.0),

                  // Link field
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
                    prefix: const Icon(CupertinoIcons.link),
                    placeholder: 'Linku i shkeljes (nëse ka)',
                    keyboardType: TextInputType.url,
                    textCapitalization: TextCapitalization.none,
                    autocorrect: false,
                    onChanged: (value) {
                      setState(() {
                        _fieldLinkController.text = value;
                      });
                    },
                    validator: (value) {
                      if (!value!.startsWith('http')) {
                        return 'Ju lutem vendosni një link të saktë';
                      }

                      return null;
                    },
                  ),

                  // Nr teli field
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
                    prefix: const Icon(CupertinoIcons.phone),
                    placeholder: 'Nr juaj i telefonit',
                    keyboardType: TextInputType.number,
                    textCapitalization: TextCapitalization.none,
                    autocorrect: false,
                    onChanged: (value) {
                      setState(() {
                        _fieldNrTelController.text = value;
                      });
                    },
                  ),
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
