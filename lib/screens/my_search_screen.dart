import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:integriteti_zgjedhor_app/constants/colors.dart';
import 'package:integriteti_zgjedhor_app/widgets/info_box.dart';
import 'package:integriteti_zgjedhor_app/widgets/my_app_bar.dart';
import 'package:integriteti_zgjedhor_app/widgets/search_input.dart';

class MySearchScreen extends StatefulWidget {
  const MySearchScreen({Key? key}) : super(key: key);

  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MySearchScreen> {
  final _searchController = TextEditingController();
  bool _searchSuccessful = false;
  List _filteredData = [];

  Future<List> _fetchData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      print(jsonData);
      return jsonData;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  _submitSearch(value) async {
    if (value.isEmpty) {
      return;
    }

    final data = await _fetchData();
    print('data: $data');
    final filteredData = data
        .where(
            (item) => item['name'].toLowerCase().contains(value.toLowerCase()))
        .toList();
    print('filteredData: $filteredData');
    setState(() {
      _searchSuccessful = true;
      _filteredData = filteredData;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'Targat',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Kontrollo targat e shkelesve',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(left: 18),
                      decoration: BoxDecoration(
                        color: kBackground,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: kFontLight.withOpacity(0.2),
                            offset: const Offset(0, 12),
                            blurRadius: 16,
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Kërko targat (psh. AA123BB)',
                          hintStyle: const TextStyle(color: kFontLight),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () =>
                                _submitSearch(_searchController.text),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '*Të dhënat që gjenden në bazën tonë të të dhënave janë të dhëna jo-zyrtare.',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  if (!_searchSuccessful && !_filteredData.isNotEmpty)
                    Column(children: const [
                      SizedBox(height: 16.0),
                      InfoBox(
                        title: 'Çfarë thotë kodi zgjedhor?',
                        subtitle:
                            'Referuar nenit 91 dhe 92 të Kodit Zgjedhor të Republikës së Shqipërisë, automjetet në pronësi të institucioneve shtetërore nuk mund të përdoren për efekt mbështetjeje gjatë fushatës elektorale të subjekteve zgjedhorë.',
                        secondaryTitle: 'Ke hasur një shkelje?',
                        secondarySubtitle:
                            'Nëse ke hasur një shkelje të këtij lloji, raportoje atë nëpërmjet sistemit tonë të raportimit.',
                        buttonText: 'Raporto Shkeljen',
                        goToPath: '/report',
                      )
                    ]),
                ],
              ),
            ),
            if (_searchSuccessful && _filteredData.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        'Rezultatet e kërkimit',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6.0),
                    Center(
                      child: Text(
                        'Targa "${_searchController.text}" u gjend në:',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 26.0),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _filteredData.length,
                      itemBuilder: (context, index) {
                        final item = _filteredData[index];
                        return ListTile(
                          title: Text(item['name']),
                          subtitle: Text(item['email']),
                        );
                      },
                    ),
                    const SizedBox(height: 16.0),
                    const InfoBox(
                      title: 'Çfarë thotë kodi zgjedhor?',
                      subtitle:
                          'Referuar nenit 91 dhe 92 të Kodit Zgjedhor të Republikës së Shqipërisë, automjetet në pronësi të institucioneve shtetërore nuk mund të përdoren për efekt mbështetjeje gjatë fushatës elektorale të subjekteve zgjedhorë.',
                      secondaryTitle: 'Ke hasur një shkelje?',
                      secondarySubtitle:
                          'Nëse ke hasur një shkelje të këtij lloji, raportoje atë nëpërmjet sistemit tonë të raportimit.',
                      buttonText: 'Raporto Shkeljen',
                      goToPath: '/report',
                    ),
                  ],
                ),
              ),
            if (_searchSuccessful && _filteredData.isEmpty)
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Targa "${_searchController.text}" nuk u gjend',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const InfoBox(
                      title: 'Çfarë thotë kodi zgjedhor?',
                      subtitle:
                          'Referuar nenit 91 dhe 92 të Kodit Zgjedhor të Republikës së Shqipërisë, automjetet në pronësi të institucioneve shtetërore nuk mund të përdoren për efekt mbështetjeje gjatë fushatës elektorale të subjekteve zgjedhorë.',
                      secondaryTitle: 'Ke hasur një shkelje?',
                      secondarySubtitle:
                          'Nëse ke hasur një shkelje të këtij lloji, raportoje atë nëpërmjet sistemit tonë të raportimit.',
                      buttonText: 'Raporto Shkeljen',
                      goToPath: '/report',
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
