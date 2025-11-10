import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<String> post = [
    'assets/images/i1.jpg',
    'assets/images/i2.jpg',
    'assets/images/i3.jpg',
    'assets/images/i4.jpg',
    'assets/images/i5.jpg',
    'assets/images/i6.jpg',
    'assets/images/i7.jpg',
    'assets/images/i8.jpg',
    'assets/images/i9.jpg',
    'assets/images/i10.jpg',
    'assets/images/i11.jpg',
    'assets/images/i12.jpg',
    'assets/images/i13.jpg',
    'assets/images/i14.jpg',
    'assets/images/i15.jpg',
    'assets/images/i16.jpg',
    'assets/images/i17.jpg',
    'assets/images/i18.jpg',
    'assets/images/i19.jpg',
    'assets/images/i20.jpg',
    'assets/images/i21.jpg',
    'assets/images/i22.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.builder(
          itemCount: post.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
          ),
          itemBuilder: (context, index) {
            return SizedBox(
              height: 100,
              width: 100,
              child: Image.asset(post[index], fit: BoxFit.cover),
            );
          },
        ),
      ),
    );
  }
}
