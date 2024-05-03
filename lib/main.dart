import 'package:books_read_api/algorithms/connectionToApi.dart';
import 'package:books_read_api/algorithms/functions.dart';
import 'package:books_read_api/widgets/monitoringPageInformation.dart';
import 'package:books_read_api/widgets/widgetsFunctions.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ///all information from file api to Map value
  List<dynamic> body = [];

  ///information title for all books
  List<List<String>> allBooks = [];

  ///value for checking completion of request API
  bool apiCompletion = false;

  @override
  void initState() {
    super.initState();
    initializationApi();
  }

  ///get Api body List<dynamic> value from all books
  initializationApi() async {
    body = await ConnectionToApi()
        .getBooksDataApi('https://www.abibliadigital.com.br/api/books');
    allBooks = getDataBooks(body);
    apiCompletion = true;
    setState(() {});
  }

  ///widget body for build
  Widget bodyWidget(double height) {
    if (allBooks.isNotEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          for (int i = 0; i < allBooks.length; i++)
            buttonWidget(
                allBooks[i],
                () => {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              MonitoringPage(abbrev: allBooks[i][0]),
                        ),
                      )
                    })
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
        title: const Text(
          'All Books',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(child: bodyWidget(height)),
    );
  }
}
