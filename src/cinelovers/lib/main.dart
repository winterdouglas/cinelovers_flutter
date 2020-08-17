import 'package:flutter/material.dart';

void main() {
  runApp(CineloversApp());
}

class CineloversApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinelovers',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: UpcomingMoviesPage(title: 'Upcoming movies'),
    );
  }
}

class UpcomingMoviesPage extends StatefulWidget {
  UpcomingMoviesPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _UpcomingMoviesPageState createState() => _UpcomingMoviesPageState();
}

class _UpcomingMoviesPageState extends State<UpcomingMoviesPage> {
  final _upcomingMovies = <String>[];
  final _biggerFont = TextStyle(fontSize: 18.0);

  Widget _buildUpcomingMovies() {
    return ListView.builder(itemBuilder: (context, i) {
      if (i.isOdd) return Divider();

      final index = i ~/ 2;
      if (index >= _upcomingMovies.length) {
        _upcomingMovies.add('Item $i');
      }
      return _buildMovieRow(_upcomingMovies[index]);
    });
  }

  Widget _buildMovieRow(String item) {
    return Card(
      child: Column(children: <Widget>[
        Text(item, style: _biggerFont),
        Image.network('https://picsum.photos/200/300',
            width: 200, height: 300, cacheWidth: 200, cacheHeight: 300)
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextField(
            autocorrect: false,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                border: UnderlineInputBorder()),
          ),
          Expanded(child: _buildUpcomingMovies())
        ],
      ),
    );
  }
}
