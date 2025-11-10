import 'package:flutter/material.dart';

class PostAddScreen extends StatefulWidget {
  const PostAddScreen({super.key});

  @override
  State<PostAddScreen> createState() => _PostAddScreen();
}

class _PostAddScreen extends State<PostAddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context, true); // Quay lại màn hình trước
                      },
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.flash_off, color: Colors.white),
                          onPressed: () {
                            // Xử lý flash
                          },
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          icon: const Icon(Icons.settings, color: Colors.white),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Icon(Icons.text_fields, color: Colors.white, size: 28),
                          SizedBox(height: 26),
                          Icon(Icons.loop, color: Colors.white, size: 28),
                          SizedBox(height: 26),
                          Icon(Icons.grid_on, color: Colors.white, size: 28),
                          SizedBox(height: 26),
                          Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 28),
                        ],
                      ),
                    ),
                    const Spacer(), // Đẩy các điều khiển sang trái
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildStoryCircle('assets/images/i17.jpg'),
                        _buildStoryCircle('assets/images/i19.jpg'),
                        _buildCaptureButton(),
                        _buildStoryCircle('assets/images/i20.jpg'),
                        _buildStoryCircle('assets/images/i22.jpg'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildTextOption('POST', false),
                        const SizedBox(width: 20),
                        _buildTextOption('STORY', true),
                        const SizedBox(width: 20),
                        _buildTextOption('REEL', false),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            right: 16,
            child: IconButton(
              icon: const Icon(Icons.autorenew, color: Colors.white, size: 30),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoryCircle(String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
          border: Border.all(color: Colors.white54, width: 1),
        ),
      ),
    );
  }

  Widget _buildCaptureButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 3),
        ),
        child: Container(
          margin: const EdgeInsets.all(4),
          decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildTextOption(String text, bool isSelected) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white54,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
