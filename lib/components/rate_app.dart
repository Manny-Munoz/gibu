import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RateMyApp extends StatefulWidget {
  const RateMyApp({super.key});
  @override
  _RateMyAppState createState() => _RateMyAppState();
}

class _RateMyAppState extends State<RateMyApp> {
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Text('Rating: $rating'),
              const SizedBox(height: 2),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 40.0,
                updateOnDrag: true,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) => setState(() {
                  this.rating = rating;
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
