import 'package:flutter/material.dart';
import 'package:integriteti_zgjedhor_app/widgets/my_app_bar.dart';
import 'package:integriteti_zgjedhor_app/widgets/search_input.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  final _searchController = TextEditingController();
  bool _searchSuccessful = false;
  var _searchedValue;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  _submitSearch(value) {
    // Perform search operation here and set _searchSuccessful to true if successful
    setState(() {
      _searchSuccessful = true;
      _searchedValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('_searchSuccessful: $_searchSuccessful');
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Targat',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Kontrollo targat e shkelesve',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  SearchInput(
                    controller: _searchController,
                    onSubmit: _submitSearch(_searchController.text),
                  )
                ],
              ),
            ),
            if (_searchSuccessful)
              Container(
                padding: EdgeInsets.all(16.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Search Results',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      // Display search results here
                      Center(
                        child: Text(
                          'Search results for "$_searchedValue"',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            if (_searchSuccessful)
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 36.0, vertical: 16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Container(
                    height: 200.0,
                    padding: EdgeInsets.all(16.0),
                    color: Colors.grey.shade200,
                    child: Center(
                      child: Text(
                        'Information Box',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
