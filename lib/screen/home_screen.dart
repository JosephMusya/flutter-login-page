import 'package:flutter/material.dart';
import 'package:innovator/api_models/api_service.dart';
import 'package:innovator/api_models/model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Ebook',
              textAlign: TextAlign.end,
            ),
          ),
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
  late List<Model> _model = [];
  var _loading = true;
  @override
  void initState() {
    super.initState();
    _fetch();
  }

  void _fetch() async {
    _loading = true;
    _model = (await ApiService.getBooks());
    _loading = false;
    // Future.delayed(const Duration(seconds: 3)).then((value) => setState(() {}));
    setState(() {
      _loading;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return const Text("Youre home");
    return _loading
        ? const Center(child: CircularProgressIndicator())
        : _model.isEmpty
            ? Center(
                child: Material(
                  elevation: 8,
                  child: Stack(
                      // clipBehavior: Clip.none,
                      // padding: const EdgeInsets.all(10.0),
                      alignment: AlignmentDirectional.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 2, 25, 30),
                          child: Text(
                            "Error Occurred",
                            style:
                                TextStyle(color: Colors.red[400], fontSize: 17),
                          ),
                        ),
                        Positioned(
                          bottom: 1,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _loading = true;
                              });
                              _fetch();
                            },
                            child: const Icon(
                              Icons.refresh,
                            ),
                          ),
                        )
                      ]),
                ),
              )
            : ListView.builder(
                itemCount: _model.length,
                // itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Card(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                height: 200,
                                child: Image.network(
                                  _model[index].coverImage.toString(),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    _model[index].title.toString() +
                                        ' by ' +
                                        _model[index].author.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        _model[index].status.toString(),
                                        style: const TextStyle(
                                            color: Colors.green),
                                      ),
                                      // Text(_model![index].price.toString()),
                                      const Icon(
                                        Icons.download,
                                        color: Colors.grey,
                                      ),
                                      Text('QTY: ' +
                                          _model[index].quantity.toString()),
                                      _model[index].trending
                                          ? const Icon(Icons.star,
                                              color: Colors.redAccent)
                                          : const Text(''),
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
