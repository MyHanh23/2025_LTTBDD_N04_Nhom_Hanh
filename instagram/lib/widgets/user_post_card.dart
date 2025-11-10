import 'package:flutter/material.dart';
import 'package:instagram/domain/utils.dart';
import 'package:instagram/widgets/comment_bottom_sheet.dart';
import 'package:instagram/widgets/share_bottom_sheet.dart';

class UserPostCard extends StatefulWidget {
  final String postProfile;
  final List<String> postImage;
  final String userName;
  final String musicTitle;

  const UserPostCard({
    super.key,
    required this.musicTitle,
    required this.postImage,
    required this.userName,
    required this.postProfile,
  });

  @override
  State<UserPostCard> createState() => _UserPostCardState();
}

class _UserPostCardState extends State<UserPostCard> {
  bool _isLiked = false;
  bool _isSaved = false;
  bool _showEmojiInput = false;
  bool _isRefreshed = false;
  final TextEditingController _commentController = TextEditingController();
  int _currentLikes = 966;
  int _currentRefreshes = 966; // Số lượt thích ban đầu

  // Danh sách để lưu trữ các bình luận
  final List<String> _comments = [];

  int _currentImageIndex = 0;

  @override
  void dispose() {
    _commentController.dispose(); // Giải phóng controller khi widget bị hủy
    super.dispose();
  }

  // Hàm để thêm bình luận
  void _addComment(String commentText) {
    setState(() {
      _comments.add("${widget.userName}: $commentText");
    });
  }

  void _sendEmoji(String emoji) {
    if (emoji.isNotEmpty) {
      setState(() {
        _comments.add("${widget.userName} sent an emoji: $emoji");
        _showEmojiInput = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.66,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(widget.userName, style: myTextStyle15(fontWeight: FontWeight.bold)),
            leading: ClipOval(
              child: Image.asset(widget.postProfile, height: 50, width: 50, fit: BoxFit.cover),
            ),
            subtitle: Row(
              children: [
                Image.asset(
                  'assets/icons/music-player.png',
                  height: 12,
                  width: 12,
                  color: Colors.black,
                ),
                const SizedBox(width: 8),
                Text(widget.musicTitle),
              ],
            ),

            trailing: const Icon(Icons.more_horiz),
          ),
          Stack(
            // Sử dụng Stack để chồng ảnh và các chỉ báo
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                height: 450,
                width: double.infinity,
                child: PageView.builder(
                  itemCount: widget.postImage.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentImageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Image.asset(widget.postImage[index], fit: BoxFit.cover);
                  },
                ),
              ),
              // Chỉ báo số trang (dots)
              if (widget.postImage.length > 1)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(widget.postImage.length, (index) {
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentImageIndex == index
                              ? Colors
                                    .blue // Dot xanh - ảnh hiện tại
                              : Colors.grey, // Dot xám - ảnh khác
                        ),
                      );
                    }),
                  ),
                ),
              if (_showEmojiInput)
                Positioned(
                  bottom: 60.0,
                  left: 10.0,
                  right: 10.0,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.emoji_emotions_outlined, color: Colors.grey),
                          const SizedBox(width: 8),
                          Text('Drop an emoji...', style: myTextStyle15(fontColor: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Row(
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
                                ? const Icon(Icons.favorite, color: Colors.red, size: 36)
                                : Image.asset("assets/icons/heart.png", height: 20, width: 20),
                          ),
                          Text(
                            '$_currentLikes', // Hiển thị lượt thích
                            style: myTextStyle15(),
                          ),
                        ],
                      ),
                      Row(
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
                            icon: Image.asset("assets/icons/chat.png", height: 20, width: 20),
                          ),
                          Text('${_comments.length}', style: myTextStyle15()),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (_isRefreshed) {
                                  _currentRefreshes--;
                                } else {
                                  _currentRefreshes++;
                                }
                                _isRefreshed = !_isRefreshed;
                                _showEmojiInput = !_showEmojiInput;
                              });
                            },
                            icon: Image.asset("assets/icons/refresh.png", height: 20, width: 20),
                          ),
                          Text('$_currentRefreshes', style: myTextStyle15()),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true, // Kéo lên cao hơn
                                builder: (context) {
                                  return ShareBottomSheet(
                                    postImageUrl: widget.postImage[_currentImageIndex],
                                    currentUserName: widget.userName,
                                  );
                                },
                              );
                            },
                            icon: Image.asset("assets/icons/share.png", height: 20, width: 20),
                          ),
                          Text('966', style: myTextStyle15()),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isSaved = !_isSaved; // Bỏ lưu
                      });
                    },
                    icon: _isSaved
                        ? const Icon(Icons.bookmark, color: Colors.black, size: 28)
                        : Image.asset("assets/icons/saved.png", height: 20, width: 20),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
            child: Text('5 days ago', style: myTextStyle12(fontColor: Colors.grey)),
          ),
        ],
      ),
    );
  }
}
