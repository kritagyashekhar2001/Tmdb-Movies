import 'package:flutter/material.dart';
import 'package:tmdb_movie/constants/colors.dart';

class Description extends StatelessWidget {
  const Description(
      {Key? key,
      required this.name,
      required this.desc,
      required this.bannerurl,
      required this.poster,
      required this.vote,
      required this.launch})
      : super(key: key);

  final String name, desc, bannerurl, poster, vote, launch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroudcolor,
      body: ListView(
        children: [
          Container(
            height: 250,
            child: Stack(
              children: [
                Positioned(
                    child: Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    bannerurl,
                    fit: BoxFit.cover,
                  ),
                )),
                Positioned(
                  bottom: 10,
                  child: Text(
                    "Average Rating -" + vote,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsetsDirectional.all(10),
            child: Text(
              name,
              style: const TextStyle(
                  fontSize: 30, color: textcolor, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                height: 200,
                width: 150,
                child: Image.network(poster),
              ),
              Flexible(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Text(
                      desc,
                      style: const TextStyle(
                        fontSize: 20,
                        color: textcolor,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
