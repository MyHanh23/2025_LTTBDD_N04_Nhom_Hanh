import 'package:flutter/material.dart';
import 'package:instagram/domain/utils.dart';
import 'package:instagram/screen/bottom_navigation_screen/create_story_screen.dart';
import 'package:instagram/widgets/story_show_card.dart';
import 'package:instagram/widgets/user_post_card.dart';

class HomeScreen extends StatefulWidget {
  
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MediaQueryData? mqData;
  @override
  Widget build(BuildContext context) {
    mqData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/icons/Insta.png', height: 46),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset("assets/icons/heart.png", height: 20, width: 20),
          ),
          const SizedBox(width: 5),
          IconButton(
            onPressed: () {},
            icon: Image.asset("assets/icons/messenger.png", height: 20, width: 20),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: mqData!.size.width * 0.34,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Column(
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
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const CreateStoryScreen(),
                                        ),
                                      );
                                    },
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
                                      // color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text("Your Story", style: myTextStyle15(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      StoryShowCard(userName: "my_hanh", image: "assets/images/i17.jpg"),
                      StoryShowCard(userName: "sophiee_", image: "assets/images/i19.jpg"),
                      StoryShowCard(userName: "happii_01", image: "assets/images/i18.jpg"),
                      StoryShowCard(userName: "hihi_", image: "assets/images/i16.jpg"),
                      StoryShowCard(userName: "ann_ni", image: "assets/images/i20.jpg"),
                      StoryShowCard(userName: "quoc_ah", image: "assets/images/i10.jpg"),
                      StoryShowCard(userName: "van_quaq", image: "assets/images/i13.jpg"),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            UserPostCard(
              postImage: [
                'assets/images/i1.jpg',
                'assets/images/i5.jpg',
                'assets/images/i16.jpg',
                'assets/images/i6.jpg',
                'assets/images/i10.jpg',
                'assets/images/i6.jpg',
              ],
              postProfile: 'assets/images/i9.jpg',
              userName: 'my_hah',
              musicTitle: 'beatiful day',
            ),
            UserPostCard(
              postImage: ['assets/images/i2.jpg'],
              postProfile: 'assets/images/i10.jpg',
              userName: 'happi_',
              musicTitle: 'love story',
            ),
            UserPostCard(
              postImage: ['assets/images/i3.jpg'],
              postProfile: 'assets/images/i11.jpg',
              userName: 'quoc_anq',
              musicTitle: 'blue',
            ),
            UserPostCard(
              postImage: ['assets/images/i4.jpg'],
              postProfile: 'assets/images/i7.jpg',
              userName: 'quanq_96',
              musicTitle: 'Photograph',
            ),
            UserPostCard(
              postImage: ['assets/images/i5.jpg'],
              postProfile: 'assets/images/i12.jpg',
              userName: 'hihiii',
              musicTitle: 'beautiful things',
            ),
            UserPostCard(
              postImage: ['assets/images/i6.jpg'],
              postProfile: 'assets/images/i13.jpg',
              userName: 'sophiee',
              musicTitle: 'Nguời Đầu Tiên',
            ),
            UserPostCard(
              postImage: ['assets/images/i7.jpg'],
              postProfile: 'assets/images/i14.jpg',
              userName: 'redamancy_23',
              musicTitle: 'Golden',
            ),
            UserPostCard(
              postImage: ['assets/images/i8.jpg'],
              postProfile: 'assets/images/i15.jpg',
              userName: '_jassmine_',
              musicTitle: 'Little Life',
            ),
            UserPostCard(
              postImage: ['assets/images/i9.jpg'],
              postProfile: 'assets/images/i22.jpg',
              userName: 'nquang',
              musicTitle: 'Snowman',
            ),
            UserPostCard(
              postImage: ['assets/images/i10.jpg'],
              postProfile: 'assets/images/i21.jpg',
              userName: 'cozy_',
              musicTitle: 'Ordinary',
            ),
            UserPostCard(
              postImage: ['assets/images/i11.jpg'],
              postProfile: 'assets/images/i20.jpg',
              userName: 'torotoo',
              musicTitle: '',
            ),
            UserPostCard(
              postImage: ['assets/images/i12.jpg'],
              postProfile: 'assets/images/i19.jpg',
              userName: 'han.naa',
              musicTitle: 'Can You Hear My Heart',
            ),
            UserPostCard(
              postImage: ['assets/images/i13.jpg'],
              postProfile: 'assets/images/i18.jpg',
              userName: 'annn',
              musicTitle: 'Little Life',
            ),
            UserPostCard(
              postImage: ['assets/images/i14.jpg'],
              postProfile: 'assets/images/i17.jpg',
              userName: '_im.qanh',
              musicTitle: 'blue',
            ),
            UserPostCard(
              postImage: ['assets/images/i15.jpg'],
              postProfile: 'assets/images/i16.jpg',
              userName: 'skyyy_',
              musicTitle: 'Nguời Đầu Tiên',
            ),
          ],
        ),
      ),
    );
  }
}
