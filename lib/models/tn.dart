import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdb_movie/pages.dart/desc.dart';

class TopRated extends StatelessWidget {
  final List toprated;
  const TopRated({Key? key, required this.toprated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Top Rated Movies",
          style: GoogleFonts.breeSerif(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 270,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: toprated.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Description(
                                name: toprated[index]['title'],
                                desc: toprated[index]['overview'],
                                bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                    toprated[index]['backdrop_path'],
                                vote:
                                    toprated[index]['vote_average'].toString(),
                                launch: toprated[index]['release_date'],
                                poster: 'https://image.tmdb.org/t/p/w500' +
                                    toprated[index]['poster_path'],
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
                            toprated[index]['poster_path'],
                      ))),
                    ),
                    Container(
                      child: Text(
                        toprated[index]['title'] != null
                            ? toprated[index]['title']
                            : 'Loading',
                        style: TextStyle(fontSize: 20),
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
