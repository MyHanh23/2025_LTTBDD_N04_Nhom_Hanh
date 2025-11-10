import 'package:flutter/material.dart';
import 'package:instagram/domain/utils.dart';
import 'package:video_player/video_player.dart';
import 'package:instagram/widgets/comment_bottom_sheet.dart';
import 'package:instagram/widgets/share_bottom_sheet.dart';

class ReelsCard extends StatefulWidget {
  final String postProfile;
  final String userName;
  final List<String> postImage;

  const ReelsCard({
    super.key,
    required this.userName,
    required this.postProfile,
    required this.postImage,
  });

  @override
  State<ReelsCard> createState() => _ReelsCardState();
}

class _ReelsCardState extends State<ReelsCard> {
  VideoPlayerController? _videoPlayerController;
  int currentVideoIndex = 0;
  List<String> shortVideo = [
    'assets/video/v2.mp4',
    'assets/video/v3.mp4',
    'assets/video/v4.mp4',
    'assets/video/v5.mp4',
    'assets/video/v6.mp4',
    'assets/video/v7.mp4',
    'assets/video/v8.mp4',
    'assets/video/v9.mp4',
  ];

  bool _isLiked = false;
  int _currentLikes = 966;

  final List<String> _comments = [];

  @override
  void initState() {
    super.initState();
    initialize();
  }

  void _addComment(String commentText) {
    setState(() {
      _comments.add("${widget.userName}: $commentText");
    });
  }

  void initialize() {
    _videoPlayerController?.dispose();
    _videoPlayerController = VideoPlayerController.asset(shortVideo[currentVideoIndex])
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController!.play();
        _videoPlayerController!.setLooping(true);
      });
  }

  void changeShort(bool isNext) {
    _videoPlayerController?.pause();
    if (isNext) {
      currentVideoIndex = (currentVideoIndex + 1) % shortVideo.length;
    } else {
      currentVideoIndex = (currentVideoIndex - 1 + shortVideo.length) % shortVideo.length;
    }
    initialize();
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final videoController = _videoPlayerController;
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (videoController != null && videoController.value.isInitialized)
            Center(
              child: GestureDetector(
                onVerticalDragEnd: (drag) {
                  if (drag.velocity.pixelsPerSecond.dy > 0) {
                    changeShort(false);
                  } else if (drag.velocity.pixelsPerSecond.dy < 0) {
                    changeShort(true);
                  }
                },
                onTap: () {
                  if (videoController.value.isPlaying) {
                    videoController.pause();
                  } else {
                    videoController.play();
                  }
                },
                child: AspectRatio(
                  aspectRatio: videoController.value.aspectRatio,
                  child: VideoPlayer(videoController),
                ),
              ),
            )
          else
            CircularProgressIndicator(color: Colors.black26), //Loading
          Positioned(
            bottom: 15,
            left: 10,
            right: 10,
            child: Column(
              children: [
                Row(
                  // mainAxisAlignment:
                  //     MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [Colors.purple, Colors.red, Colors.orange, Colors.yellow],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            border: Border.all(width: 3, color: Colors.red),
                            image: DecorationImage(
                              image: AssetImage('assets/images/i10.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "my_hanh",
                              style: myTextStyle15(
                                fontColor: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 2),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/icons/music-player.png',
                                  height: 12,
                                  width: 12,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'Sunset',
                                  style: myTextStyle15(fontColor: Colors.white70),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        // foregroundColor: Colors.white30,
                        side: BorderSide(color: Colors.white30, width: 1),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        minimumSize: Size(0, 28),
                      ),
                      child: Text(
                        'Follow',
                        style: myTextStyle15(fontColor: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Where would you go first?',
                      style: myTextStyle15(fontColor: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // SizedBox(height: 6),
          Positioned(
            top: 360,
            right: 20,
            child: Column(
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _isLiked = !_isLiked; // Bỏ thích
                          if (_isLiked) {
                            _currentLikes++;
                          } else {
                            _currentLikes--;
                          }
                        });
                      },
                      icon: _isLiked
                          ? const Icon(Icons.favorite, color: Colors.red, size: 28)
                          : Image.asset(
                              "assets/icons/heart.png",
                              height: 30,
                              width: 30,
                              color: Colors.white,
                            ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      '$_currentLikes', // Hiển thị lượt thích
                      style: myTextStyle15(fontWeight: FontWeight.bold, fontColor: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 22),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        // Hiển thị bottom sheet
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return CommentBottomSheet(
                              comments: _comments,
                              onAddComment: _addComment, // Truyền callback
                              currentUserProfile: widget.postProfile, // Truyền ảnh profile
                              currentUserName: widget.userName, // Truyền tên người dùng
                            );
                          },
                        );
                      },
                      icon: Image.asset(
                        "assets/icons/chat.png",
                        height: 30,
                        width: 30,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      '${_comments.length}',
                      style: myTextStyle15(fontWeight: FontWeight.bold, fontColor: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 22),
                Column(
                  children: [
                    Image.asset(
                      'assets/icons/refresh.png',
                      height: 30,
                      width: 30,
                      color: Colors.white,
                    ),
                    SizedBox(height: 6),
                    Text(
                      '20k',
                      style: myTextStyle15(fontWeight: FontWeight.bold, fontColor: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 22),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true, // Kéo lên cao hơn
                          builder: (context) {
                            return ShareBottomSheet(
                              postImageUrl: widget.postImage[currentVideoIndex],
                              currentUserName: widget.userName,
                            );
                          },
                        );
                      },
                      icon: Image.asset(
                        "assets/icons/share.png",
                        height: 30,
                        width: 30,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      '20k',
                      style: myTextStyle15(fontWeight: FontWeight.bold, fontColor: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 22),

                Column(children: [Icon(Icons.more_horiz, color: Colors.white, size: 30)]),
                SizedBox(height: 23),
                Container(
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assets/images/i10.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
