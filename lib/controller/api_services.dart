import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:tmdb_movie/constants/colors.dart';
import 'package:tmdb_movie/models/home_trending.dart';
import 'package:tmdb_movie/models/tn.dart';
import 'package:tmdb_movie/models/tvshow.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  List trendingmovies = [];
  List tvtop = [];
  List top = [];

  loadmovies() async {
    TMDB tmdbcustom = TMDB(
        ApiKeys('df7cefd7061c4e1e39419c269d711f69',
            'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkZjdjZWZkNzA2MWM0ZTFlMzk0MTljMjY5ZDcxMWY2OSIsInN1YiI6IjYyNjI1NTRkMzIyYjJiNGZlMWYzMzEwZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ksWZiW-0tR7KGYgy10ioBAiZeWdcMQ1WyOgS7JMEGy0'),
        logConfig: const ConfigLogger(
          showErrorLogs: true,
          showLogs: true,
        ));
    Map trendingresult = await tmdbcustom.v3.trending.getTrending();
    Map topresult = await tmdbcustom.v3.movies.getTopRated();

    Map tvshowsresult = await tmdbcustom.v3.tv.getPopular();

    setState(() {
      trendingmovies = trendingresult['results'];
      top = topresult['results'];
      tvtop = tvshowsresult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroudcolor,
      appBar: AppBar(
        title: const Text('TMDB Movies'),
        backgroundColor: primarycolor,
      ),
      body: ListView(
        children: [
          TrendinMovies(
            trending: trendingmovies,
          ),
          TopRated(toprated: top),
          tvshows(tv: tvtop),
        ],
      ),
    );
  }
}
