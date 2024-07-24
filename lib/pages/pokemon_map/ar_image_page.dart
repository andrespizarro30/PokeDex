import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';

class ARImagePage extends StatefulWidget {
  const ARImagePage({super.key});

  @override
  State<ARImagePage> createState() => _ARImagePageState();
}

class _ARImagePageState extends State<ARImagePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AR Image Example')),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: onPlaceImage,
              child: Text('Place Image'),
            ),
          )
        ],
      ),
    );
  }


  Future<void> onPlaceImage() async {

  }

  @override
  void dispose() {
    super.dispose();
  }

}
