import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdb_movie/pages.dart/desc.dart';

class TrendinMovies extends StatelessWidget {
  final List trending;
  const TrendinMovies({Key? key, required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Trending Movies",
          style: GoogleFonts.breeSerif(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 270,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: trending.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Description(
                                name: trending[index]['title'],
                                desc: trending[index]['overview'],
                                bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                    trending[index]['backdrop_path'],
                                vote:
                                    trending[index]['vote_average'].toString(),
                                launch: trending[index]['release_date'],
                                poster: 'https://image.tmdb.org/t/p/w500' +
                                    trending[index]['poster_path'],
                              )));
                },
                child: Container(
                  width: 140,
                  child: Column(children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                        'https://image.tmdb.org/t/p/w500' +
                            trending[index]['poster_path'],
                      ))),
                    ),
                    Flexible(
                      child: Container(
                        child: Text(
                          trending[index]['title'] != null
                              ? trending[index]['title']
                              : 'Loading',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    )
                  ]),
                ),
              );
            },
          ),
        )
      ]),
    );
  }
}
