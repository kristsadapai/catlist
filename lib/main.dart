import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:catlist/api/cat_api.dart';
import 'package:catlist/catdata/catModel.dart';

void main() {
  runApp(MyApp());
}

class Todo {
  final String catId;
  final String catBreed;

  Todo(this.catId, this.catBreed);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CatListPage(title: 'CatList'),
    );
  }
}

class CatListPage extends StatefulWidget {
  CatListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CatListPageState createState() => _CatListPageState();
}

class _CatListPageState extends State<CatListPage> {
  int index;
  final List<Todo> todos = [];
  CatList catList = CatList();
  BreedList breedList = BreedList();

  int _counter = 0;
  @override
  void initState() {
    super.initState();
    getCatData();
  }

  void getCatData() async {
    var result = await CatAPI().getCatBreeds();
    var catMap = json.decode(result);
    setState(() {
      breedList = BreedList.fromJson(catMap);
    });
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          child: ListView.builder(
            itemCount: (breedList == null ||
                    breedList.breeds == null ||
                    breedList.breeds.length == 0)
                ? 0
                : breedList.breeds.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CatInfoPage(
                        catId: breedList.breeds[index].id,
                        catBreed: breedList.breeds[index].name);
                  }));
                },
                title: Row(
                  children: [
                    // Image.network(catList.breeds[index].url),
                    Text(breedList.breeds[index].name),
                  ],
                ),
                subtitle: Text(breedList.breeds[index].temperament),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class CatInfoPage extends StatefulWidget {
  final String catId;
  final String catBreed;
  CatInfoPage(
      {Key key, this.title, @required this.catId, @required this.catBreed})
      : super(key: key);

  final String title;

  @override
  _CatInfoPageState createState() => _CatInfoPageState();
}

class _CatInfoPageState extends State<CatInfoPage> {
  CatList catList = CatList();
  BreedList breedList = BreedList();
  @override
  void initState() {
    super.initState();
    getCatsData();
    getCatData();
  }

  void getCatsData() async {
    var catJson = await CatAPI().getCatBreed(widget.catId);
    print(catJson);
    var catMap = json.decode(catJson);
    print(catMap);
    setState(() {
      catList = CatList.fromJson(catMap);
    });
  }

  void getCatData() async {
    var result = await CatAPI().getCatBreeds();
    var catMap = json.decode(result);
    setState(() {
      breedList = BreedList.fromJson(catMap);
    });
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.catBreed),
      ),
      body: Center(
        child: Container(
          child: ListView.builder(
            itemCount: (catList == null ||
                    catList.breeds == null ||
                    catList.breeds.length == 0)
                ? 0
                : catList.breeds.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {},
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Image.network(
                        catList.breeds[index].url,
                        width: 200,
                        height: 200,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'รายละเอียด',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      width: 120,
                      height: 30,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      alignment: Alignment.center,
                      child: Text(breedList.breeds[index].description),
                      width: 200,
                      height: 200,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
