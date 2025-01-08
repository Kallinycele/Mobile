import 'package:flutter/material.dart';

class PhotoCard extends StatelessWidget {
  final String date;
  final String photoCount;
  final String imagePath;

  const PhotoCard({
    Key? key,
    required this.date,
    required this.photoCount,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 210,
      child: Column(
        children: [
          Container(
            width: 350,
            height: 210,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    date,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "$photoCount fotos",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Image.asset(
          //   imagePath,
          //   fit: BoxFit.cover,
          //   width: double.infinity,
          //   height: 250,
          // ),
        ],
      ),
    );
  }
}
