import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3, Matrix4;
import 'package:visibility_detector/visibility_detector.dart';

class TinderCard extends StatefulWidget {
  Color color;
  TinderCard(this.color);

  @override
  _TinderCardState createState() => _TinderCardState();
}

class _TinderCardState extends State<TinderCard>
    with SingleTickerProviderStateMixin {
  double xOffset = 0.0;
  double endVelocity = 0;
  bool swipeRight = true;
  bool dismissed = false;
  AnimationController _animationController;

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
    if (endVelocity < 2) return 0;
    return (swipeRight ? 1 : -1) * _animationController.value * 200;
  }

  @override
  Widget build(BuildContext context) {
    if (dismissed) {
      return Container(
        width: 200,
        height: MediaQuery.of(context).size.height / 2,
      );
    }
    return Container(
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform(
            origin: Offset(100, -100),
            child: child,
            transform: Matrix4.identity()
              ..rotateZ(xOffset / 800 * 0.5)
              ..translate(xOffset + getAnimationValue(), 0),
          );
        },
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 2,
          child: GestureDetector(
            dragStartBehavior: DragStartBehavior.start,
            behavior: HitTestBehavior.translucent,
            onPanUpdate: (details) {
              setState(() {
                xOffset += details.delta.dx;
              });
            },
            onPanEnd: (details) {
              // Continue motion.
              setState(() {
                swipeRight = details.velocity.pixelsPerSecond.dx > 0;
              });
              endVelocity = details.velocity.pixelsPerSecond.distance /
                  MediaQuery.of(context).size.width;
              _animationController.fling(velocity: endVelocity);
            },
            onPanStart: (details) {},
            child: Container(
              alignment: Alignment.center,
              child: VisibilityDetector(
                key: Key('tinder card'),
                onVisibilityChanged: (info) {
                  if (info.visibleFraction == 0) {
                    setState(() {
                      dismissed = true;
                    });
                  } else if (info.visibleFraction != 1) {
                    print('VIS');
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    // color: widget.color,

                    image: DecorationImage(
                      image: NetworkImage(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Ed_Sheeran-6886_%28cropped%29.jpg/220px-Ed_Sheeran-6886_%28cropped%29.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  width: 200,
                  child: Container(
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
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
