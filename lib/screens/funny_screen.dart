import 'package:flutter/material.dart';

class FunnyScreen extends StatefulWidget {
  @override
  _FunnyScreenState createState() => _FunnyScreenState();
}

class _FunnyScreenState extends State<FunnyScreen> {
  final List<String> imageUrls = [
    "https://i.imgur.com/Gi9cwgR.gif",
    "https://i.imgur.com/KIEY5UX.gif",
    "https://i.imgur.com/gSFsO1m.gif", // Add more URLs if needed
  ];

  int currentIndex = 0;

  void changeImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % imageUrls.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: Text('Funny Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Image covers 80% of width and half of the screen height
            Image.network(
              imageUrls[currentIndex],
              width: screenWidth * 0.8,
              height: screenHeight * 0.5,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            // Button in center
            ElevatedButton(
              onPressed: changeImage,
              child: Text('Change Image'),
            ),
          ],
        ),
      ),
    );
  }
}
