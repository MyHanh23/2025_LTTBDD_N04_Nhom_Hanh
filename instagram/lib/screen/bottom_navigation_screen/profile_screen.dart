import 'package:flutter/material.dart';
import 'package:instagram/domain/utils.dart';
import 'package:instagram/screen/tabs/post_screen.dart';
import 'package:instagram/widgets/full_screen_image_screen.dart';
import 'package:instagram/widgets/story_show_card.dart'; // Đảm bảo tệp này định nghĩa myTextStyle15, myTextStyle18, myTextStyle20

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  MediaQueryData? mqData;
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

  List<String> tagPost = [
    'assets/images/i16.jpg',
    'assets/images/i17.jpg',
    'assets/images/i18.jpg',
    'assets/images/i19.jpg',
    'assets/images/i20.jpg',
    'assets/images/i21.jpg',
    'assets/images/i22.jpg',
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
  ];
  @override
  Widget build(BuildContext context) {
    mqData = MediaQuery.of(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          // Đặt màu nền AppBar nếu muốn
          title: Text(
            "myhanh_dt",
            style: myTextStyle20(
              fontWeight: FontWeight.bold,
            ), 
          ),
          actions: [
            Image.asset('assets/icons/threads.png', height: 20, width: 20),
            SizedBox(width: 16),
            Image.asset('assets/icons/more.png', height: 20, width: 20),
            SizedBox(width: 16),
            Image.asset('assets/icons/menu.png', height: 28, width: 28),
            SizedBox(width: 12),
          ],
        ),
        body: Container(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, 
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 10.0, // Thêm padding dọc 
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center, // Canh giữa theo chiều dọc
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/i22.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: SizedBox(
                            height: 30,
                            width: 30,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(100),
                                ),
                                padding: EdgeInsets.zero,
                              ),

                              child: Image.asset(
                                "assets/icons/plus.png",
                                height: 24,
                                width: 24,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(width: 16), 
                    Expanded(
                      // Sử dụng Expanded để phần này chiếm hết không gian còn lại
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, 
                        children: [
                          Text("Đỗ Thị Mỹ Hạnh", style: myTextStyle18(fontWeight: FontWeight.bold)),
                          SizedBox(height: 10), 
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text('2', style: myTextStyle18(fontWeight: FontWeight.bold)),
                                  Text('posts', style: myTextStyle15()),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('54', style: myTextStyle18(fontWeight: FontWeight.bold)),
                                  Text('followers', style: myTextStyle15()),
                                ],
                              ),
                              Column(
                                children: [
                                  Text('188', style: myTextStyle18(fontWeight: FontWeight.bold)),
                                  Text('following', style: myTextStyle15()),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 5), 
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text('Độc lập - Tự do - Hạnh phúc ✨🕊️', style: myTextStyle15()),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Colors.white38,
                        ),
                        child: Text(
                          'Edit profile',
                          style: myTextStyle15(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Colors.white38,
                        ),
                        child: Text(
                          'Share profile',
                          style: myTextStyle15(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      height: 36,
                      width: 36,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Colors.white38,
                          padding: EdgeInsets.zero,
                        ),
                        child: Image.asset('assets/icons/add-user.png', height: 23, width: 23),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    StoryShowCard(image: 'assets/images/i8.jpg', userName: 'Hihi'),
                    StoryShowCard(image: 'assets/images/i1.jpg', userName: 'Happy'),
                    StoryShowCard(image: 'assets/images/i2.jpg', userName: 'Peaceful'),
                    StoryShowCard(image: 'assets/images/i4.jpg', userName: 'Chill'),
                    StoryShowCard(image: 'assets/images/i5.jpg', userName: '96'),
                    StoryShowCard(image: 'assets/images/i21.jpg', userName: 'SKHT'),
                    StoryShowCard(image: 'assets/images/i18.jpg', userName: 'Folower'),
                    StoryShowCard(image: 'assets/images/i10.jpg', userName: 'River'),
                  ],
                ),
              ),

              TabBar(
                tabs: [
                  Tab(icon: Image.asset('assets/icons/grid.png', height: 20, width: 20)),
                  Tab(icon: Image.asset('assets/icons/video.png', height: 23, width: 23)),
                  Tab(icon: Image.asset('assets/icons/comment.png', height: 26, width: 26)),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    GridView.builder(
                      itemCount: post.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FullScreenImageScreen(imagePath: post[index]),
                              ),
                            );
                          },
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: Image.asset(post[index], fit: BoxFit.cover),
                          ),
                        );
                      },
                    ),
                    GridView.builder(
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
                                  image: DecorationImage(
                                    image: AssetImage(post[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 5,
                                top: 10,
                                child: Image.asset(
                                  'assets/icons/video.png',
                                  color: Colors.black87,
                                  height: 28,
                                  width: 28,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    GridView.builder(
                      itemCount: tagPost.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                      ),
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.asset(tagPost[index], fit: BoxFit.cover),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
