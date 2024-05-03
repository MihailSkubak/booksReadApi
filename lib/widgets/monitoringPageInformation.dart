// ignore_for_file: file_names
import 'package:books_read_api/algorithms/connectionToApi.dart';
import 'package:books_read_api/algorithms/functions.dart';
import 'package:flutter/material.dart';

class MonitoringPage extends StatefulWidget {
  const MonitoringPage({required this.abbrev, super.key});

  //data from API therefore the value reads information about the book (comment)
  final String abbrev;

  @override
  State<MonitoringPage> createState() => _MonitoringPageState();
}

class _MonitoringPageState extends State<MonitoringPage> {
  ///all information from THE book
  Map<String, dynamic> bookInformation = {};

  ///value for checking completion of request API
  bool apiCompletion = false;

  @override
  void initState() {
    super.initState();
    initializationApi();
  }

  ///get Api body Map value from one book
  initializationApi() async {
    bookInformation = await ConnectionToApi().getBookDataApi(
        'https://www.abibliadigital.com.br/api/books/${widget.abbrev}');
    apiCompletion = true;
    setState(() {});
  }

  ///widget body for build
  Widget bodyWidget(double height) {
    if (getDataBook(bookInformation) != '') {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(10),
            child: Text(getDataBook(bookInformation)),
          ),
        ],
      );
    } else {
      return Center(
        child: Container(
          padding: EdgeInsets.only(top: height / 2 - 70),
          child: Text(apiCompletion ? 'Not found information!' : ''),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ///height of the entire page with AppBar
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Book Information',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(child: bodyWidget(height)),
    );
  }
}
