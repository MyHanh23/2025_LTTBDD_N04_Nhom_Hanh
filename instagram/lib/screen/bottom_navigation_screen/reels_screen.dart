import 'package:flutter/material.dart';
import 'package:instagram/widgets/reels_card.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({super.key});

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ReelsCard(
        userName: 'happii',
        postProfile: 'assets/images/i10.jpg',
        postImage: ['assets/images/i6.jpg'],
      ),
    );
  }
}
