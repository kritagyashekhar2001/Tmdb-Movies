// ignore_for_file: prefer_if_null_operators, camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdb_movie/pages.dart/desc.dart';

class tvshows extends StatelessWidget {
  final List tv;
  const tvshows({Key? key, required this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Top Shows",
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
            itemCount: tv.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => Description(
                  //               name: tv[index]['original_name'],
                  //               desc: tv[index]['overview'],
                  //               bannerurl: 'https://image.tmdb.org/t/p/w500' +
                  //                   tv[index]['backdrop_path'],
                  //               vote: tv[index]['vote_average'].toString(),
                  //               launch: tv[index]['release_date'],
                  //               poster: 'https://image.tmdb.org/t/p/w500' +
                  //                   tv[index]['poster_path'],
                  //             )));
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
                            tv[index]['poster_path'],
                      ))),
                    ),
                    Text(
                      tv[index]['original_name'] != null
                          ? tv[index]['original_name']
                          : 'Loading',
                      style: TextStyle(fontSize: 20),
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
