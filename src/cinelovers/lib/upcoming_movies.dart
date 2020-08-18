import 'package:flutter/material.dart';

class UpcomingMoviesPage extends StatefulWidget {
  UpcomingMoviesPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _UpcomingMoviesPageState createState() => _UpcomingMoviesPageState();
}

class _UpcomingMoviesPageState extends State<UpcomingMoviesPage> {
  final _upcomingMovies = <String>[];
  final _biggerFont = TextStyle(fontSize: 18.0);

  Widget _buildUpcomingMoviesListView() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      itemBuilder: (context, i) {
        _upcomingMovies
            .add('Super lenghty text just to see if it will break the line $i');

        return _buildMovieRow(_upcomingMovies[i]);
      },
    );
  }

  Widget _buildMovieRow(String item) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: Text(
                item,
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
