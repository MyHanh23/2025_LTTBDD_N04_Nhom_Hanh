// full_screen_image_screen.dart
import 'package:flutter/material.dart';

class FullScreenImageScreen extends StatelessWidget {
  final String imagePath;

  const FullScreenImageScreen({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, 
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: InteractiveViewer(
          // Cho phép zoom và pan ảnh
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain, // Hiển thị toàn bộ ảnh mà không bị cắt
          ),
        ),
      ),
    );
  }
}
