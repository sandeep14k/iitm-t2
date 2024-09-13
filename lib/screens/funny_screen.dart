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
    return Scaffold(
      appBar: AppBar(title: Text('Funny Screen')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(
            imageUrls[currentIndex],
            height: 200,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: changeImage,
            child: Text('Change Image'),
          ),
        ],
      ),
    );
  }
}
