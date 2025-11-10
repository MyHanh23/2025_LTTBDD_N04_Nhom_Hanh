import 'package:flutter/material.dart';
import 'package:instagram/domain/utils.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
      body: Column(
        children: [
          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.only(top: 10.0, right: 10, left: 10, bottom: 0),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black12,
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: myTextStyle15(),
                    filled: false,
                    prefixIcon: Icon(Icons.search_rounded, size: 26),
                    fillColor: Colors.black12,
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
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
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(post[index]), fit: BoxFit.cover),
                        ),
                      ),
                      Positioned(
                        right: 5,
                        top: 10,
                        child: Image.asset(
                          'assets/icons/video.png',
                          color: Colors.black87,
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
