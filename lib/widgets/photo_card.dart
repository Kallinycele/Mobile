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
      width: 280,
      height: 300,
      child: Column(
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 250,
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    date,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "$photoCount fotos",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}
