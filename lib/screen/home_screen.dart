import 'package:flutter/material.dart';
import 'package:innovator/api_models/api_service.dart';
import 'package:innovator/api_models/model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ebook'),
        ),
        body: const BookView(),
      ),
    );
  }
}

class BookView extends StatefulWidget {
  const BookView({Key? key}) : super(key: key);

  @override
  State<BookView> createState() => _BookViewState();
}

class _BookViewState extends State<BookView> {
  late List<Model>? _model = [];
  @override
  void initState() {
    super.initState();
    _fetch();
  }

  void _fetch() async {
    _model = (await ApiService.getBooks());
    // Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    setState(() {
      _model;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return const Text("Youre home");
    return ListView.builder(
      itemCount: _model!.length,
      // itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Card(
            child: Column(
              children: [
                Image.asset(
                  'assets/cover/logo.png',
                  fit: BoxFit.contain,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title:
                            const Text("Introduction to Django by William Joe"),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text(
                              "In Stock",
                              style: TextStyle(color: Colors.green),
                            ),
                            Text("Ksh:899/="),
                            Icon(
                              Icons.shopping_cart,
                              color: Colors.red,
                            ),
                            Icon(Icons.event_busy)
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
