import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(debugShowCheckedModeBanner: false, home: ImageGallery()),
);

class ImageGallery extends StatefulWidget {
  const ImageGallery({super.key});

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  List<String> images = [
    "assets/images/W7/w4-s2/bird.jpg",
    "assets/images/W7/w4-s2/bird2.jpg",
    "assets/images/W7/w4-s2/insect.jpg",
    "assets/images/W7/w4-s2/girl.jpg",
    "assets/images/W7/w4-s2/man.jpg",
  ];

  int currentIndex = 0;

  void goNext() {
    setState(() {
      currentIndex = (currentIndex + 1) % images.length;
    });
  }

  void goPrevious() {
    setState(() {
      currentIndex = (currentIndex - 1 + images.length) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: Text("Image Viewer"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: goPrevious,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: goNext,
            ),
          )
        ],
      ),
      body: Center(child: Image.asset(images[currentIndex])),
    );
  }
}
