import 'package:cinelovers/screens/movies/models/movies.dart';
import 'package:flutter/material.dart';

class UpcomingMoviesScreen extends StatefulWidget {
  UpcomingMoviesScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _UpcomingMoviesScreenState createState() => _UpcomingMoviesScreenState();
}

class _UpcomingMoviesScreenState extends State<UpcomingMoviesScreen> {
  final _biggerFont = TextStyle(fontSize: 18.0);
  Future<List<Movie>> futureMovies;

  @override
  void initState() {
    super.initState();
    futureMovies = fetchMovies();
  }

  Widget _buildUpcomingMoviesListView() {
    return FutureBuilder<List<Movie>>(
      future: futureMovies,
      builder: (ctx, snapshot) {
        return ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          itemCount: snapshot.data.length,
          itemBuilder: (context, i) {
            return _buildMovieRow(snapshot.data[i]);
          },
        );
      },
    );
  }

  Widget _buildMovieRow(Movie item) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: Text(
                item.title,
                style: _biggerFont,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Image.network(
              'https://picsum.photos/200/300',
              height: 300,
              alignment: Alignment.center,
              cacheWidth: 200,
              cacheHeight: 300,
            ),
          ],
        ),
      ),
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
              fillColor: Colors.white,
              filled: true,
              prefixIcon: Icon(Icons.search),
              hintText: 'Search',
              border: UnderlineInputBorder(),
            ),
          ),
          Expanded(
            child: _buildUpcomingMoviesListView(),
          )
        ],
      ),
    );
  }
}
