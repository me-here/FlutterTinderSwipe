import 'package:flutter/material.dart';
import 'TinderCard.dart';

class SwipeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Text('Swipe left or right.'),
              ),
            ),
            Stack(
              children: [
                Container(
                  child: TinderCard(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Ed_Sheeran-6886_%28cropped%29.jpg/220px-Ed_Sheeran-6886_%28cropped%29.jpg'),
                ),
                // Container(
                //   child: TinderCard(
                //       'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Ed_Sheeran-6886_%28cropped%29.jpg/220px-Ed_Sheeran-6886_%28cropped%29.jpg'),
                // ),
                // Container(
                //   child: TinderCard(
                //       'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Ed_Sheeran-6886_%28cropped%29.jpg/220px-Ed_Sheeran-6886_%28cropped%29.jpg'),
                // ),
              ],
            ),
            Expanded(
              child: Container(
                child: Center(
                  child: Text('Options'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
