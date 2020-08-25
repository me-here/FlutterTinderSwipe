import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3, Matrix4;
import 'package:visibility_detector/visibility_detector.dart';

class TinderCard extends StatefulWidget {
  final String imageURL;
  TinderCard(this.imageURL);

  @override
  _TinderCardState createState() => _TinderCardState();
}

class _TinderCardState extends State<TinderCard>
    with SingleTickerProviderStateMixin {
  double _xOffset = 0;
  double _endVelocity = 0;
  bool _swipeRight = true;
  bool _dismissed = false;

  AnimationController _animationController;

  final double _card_width = 200;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  double getAnimationValue() {
    // Trigger threshold.
    if (_endVelocity < 2) return 0;

    // How much to go add in either direction to position.
    return (_swipeRight ? 1 : -1) * _animationController.value * 200;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    if (_dismissed) {
      // Get rid of the card after a swipe (only empty container left).
      return Container(
        width: 200,
        height: screenSize.height / 2,
      );
    }

    return Container(
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform(
            origin: Offset(
              // where to rotate about
              _card_width / 2,
              -screenSize.height / 4,
            ),
            child: child,
            transform: Matrix4.identity()
              ..rotateZ(_xOffset / 1600)
              ..translate(_xOffset + getAnimationValue(), 0),
          );
        },
        child: Container(
          width: double.infinity, // gesture area can take up whole screen width
          height: screenSize.height / 2,
          child: GestureDetector(
            dragStartBehavior: DragStartBehavior.start,
            behavior: HitTestBehavior.translucent,
            onPanUpdate: (details) {
              setState(() {
                _xOffset += details.delta.dx;
              });
            },
            onPanEnd: (details) {
              // Continue motion.
              setState(() {
                _swipeRight = details.velocity.pixelsPerSecond.dx > 0;
              });
              _endVelocity =
                  details.velocity.pixelsPerSecond.distance / screenSize.width;
              _animationController.fling(velocity: _endVelocity);
            },
            onTapUp: (details) {
              final y = details.localPosition.dy;
              print(y);
            },
            child: Container(
              alignment: Alignment.center,
              child: VisibilityDetector(
                key: Key('TCard'),
                onVisibilityChanged: (info) {
                  if (info.visibleFraction == 0) {
                    setState(() {
                      // Get rid of it, no longer visible.
                      _dismissed = true;
                    });
                  } else if (info.visibleFraction != 1) {
                    // Spring back
                    print('VIS');
                  }
                },
                child: _card,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// This is the main card with the image.
  Container get _card {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(widget.imageURL),
          fit: BoxFit.cover,
        ),
      ),
      width: _card_width,
      child: _details(),
    );
  }

  /// This contains the details at the bottom of the card of who the person is.
  Widget _details() {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ed Sheeran',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Singer songwriter',
                  style: TextStyle(
                    color: Colors.grey.shade300,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.info,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
