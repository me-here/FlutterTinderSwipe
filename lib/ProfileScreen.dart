import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();

  static const String lorem =
      '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi molestie imperdiet euismod. Phasellus sit amet enim erat. Duis volutpat nunc nisi, at interdum eros vehicula ac. Nullam sed magna aliquam quam eleifend vehicula ac non eros. Morbi suscipit orci ac lacus cursus sollicitudin eget et nisl. Fusce a augue a lorem vulputate rutrum. In ut semper sapien, sit amet aliquam odio. Aenean vitae tellus consectetur, fermentum enim at, dictum ipsum. Proin in metus libero. Cras eget risus felis. Cras in hendrerit massa. Aenean sem nulla, pellentesque fringilla facilisis vel, pellentesque vitae metus. Curabitur mollis ante sed neque sollicitudin, vel elementum dolor laoreet. Suspendisse eu magna id lorem lacinia scelerisque.

Integer pulvinar porttitor eros et euismod. Sed porttitor risus ut ipsum luctus, sed condimentum nisl molestie. Mauris eu ultricies ex, vel rutrum ex. Vestibulum orci velit, molestie ut nibh eget, gravida fermentum nunc. Vivamus elementum id metus id aliquam. Aenean vitae finibus ex, nec aliquet mauris. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nulla rhoncus tempor leo nec vestibulum. Nunc mattis nulla ac facilisis tincidunt. Morbi venenatis in nulla et eleifend. Etiam venenatis orci eget turpis vulputate efficitur. Vestibulum congue libero in magna tincidunt congue. Aenean placerat a enim et auctor. Aenean ut iaculis justo. Proin a nisl id augue suscipit imperdiet eu eget leo.

Duis euismod aliquet lorem, et cursus eros. Aliquam convallis rhoncus bibendum. Aliquam quis enim nisl. Maecenas condimentum pharetra nunc, id consectetur lorem maximus ut. Aliquam lobortis lorem ut lectus lobortis porta et facilisis nisi. Aliquam imperdiet lorem in metus vehicula, ac feugiat arcu blandit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed mollis quis ante et maximus. Nam hendrerit, odio sed molestie cursus, quam sapien dapibus justo, et interdum elit sapien ac turpis.

Ut fermentum, justo ac malesuada euismod, mauris ligula elementum leo, non pretium purus orci ac sem. Pellentesque lacinia nec purus egestas viverra. Donec et nulla arcu. Nam semper tincidunt nisi vitae gravida. Donec ut turpis eget nunc aliquet dictum sed eu urna. Donec pulvinar mollis turpis, vitae mattis justo condimentum sed. Nulla interdum malesuada quam vitae pellentesque. Nunc vel sem commodo, facilisis ante eget, commodo metus. Ut accumsan bibendum egestas. Morbi ultricies tellus dignissim nulla finibus interdum. Fusce et leo ac nibh fringilla fringilla ac non ante. Ut viverra risus malesuada nulla elementum eleifend. Phasellus non maximus purus.

Curabitur feugiat suscipit dui id cursus. Integer eleifend ligula et finibus gravida. Morbi lacinia ligula a mi commodo, id congue lacus semper. Sed non arcu id ante feugiat feugiat. Donec dictum tincidunt augue a facilisis. Pellentesque commodo, odio nec imperdiet consequat, lorem nunc finibus turpis, eget viverra nisi lorem hendrerit urna. Quisque ut efficitur tortor. Maecenas fringilla porttitor dolor at varius.''';
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Hero(
                    tag: 'pfp',
                    child: Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Ed_Sheeran-6886_%28cropped%29.jpg/220px-Ed_Sheeran-6886_%28cropped%29.jpg',
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(16),
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  )
                ],
              ),
              Text(
                ProfileScreen.lorem,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
