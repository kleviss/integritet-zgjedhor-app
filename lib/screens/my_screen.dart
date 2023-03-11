import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyScreen extends StatefulWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
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
      appBar: AppBar(
        title: const Text('My Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: 'Search',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () => _submitSearch(_searchController.text),
                  ),
                ),
              ),
            ),
            if (_searchSuccessful && _filteredData.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Search Results',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16.0),
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
                  ],
                ),
              ),
            if (_searchSuccessful && _filteredData.isEmpty)
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'No results found for "${_searchController.text}"',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
