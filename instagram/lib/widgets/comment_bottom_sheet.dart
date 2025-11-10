import 'package:flutter/material.dart';
import 'package:instagram/domain/utils.dart';

class CommentBottomSheet extends StatefulWidget {
  final List<String> comments;
  final Function(String) onAddComment; // Callback để thêm bình luận
  final String currentUserProfile;
  final String currentUserName;

  const CommentBottomSheet({
    super.key,
    required this.comments,
    required this.onAddComment,
    required this.currentUserProfile,
    required this.currentUserName,
  });

  @override
  State<CommentBottomSheet> createState() => _CommentBottomSheetState();
}

class _CommentBottomSheetState extends State<CommentBottomSheet> {
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  // Hàm thêm emoji vào textbox
  void _addEmojiToCommentInput(String emoji) {
    setState(() {
      _commentController.text += emoji;
      _commentController.selection = TextSelection.fromPosition(
        TextPosition(offset: _commentController.text.length),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Column(
              children: [
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 10),
                Text('Comments', style: myTextStyle15(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const Divider(height: 1, color: Colors.grey),

          // Hiển thị các bình luận hiện có
          Expanded(
            child: ListView.builder(
              itemCount: widget.comments.length, 
              itemBuilder: (context, index) {
                if (index < widget.comments.length) {
                  final comment = widget.comments[index];
                  final parts = comment.split(':');
                  final userName = parts.length > 1 ? parts[0] : widget.currentUserName;
                  final commentText = parts.length > 1
                      ? parts.sublist(1).join(':').trim()
                      : comment;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipOval(
                          child: Image.asset(
                            widget.currentUserProfile,
                            height: 30,
                            width: 30,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    userName,
                                    style: myTextStyle15(
                                      fontWeight: FontWeight.bold,
                                      fontColor: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text('now', style: myTextStyle12(fontColor: Colors.grey)),
                                ],
                              ),
                              const SizedBox(height: 2),
                              Text(commentText, style: myTextStyle15(fontColor: Colors.black87)),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text('Reply', style: myTextStyle12(fontColor: Colors.grey)),
                                  const SizedBox(width: 10),
                                  const Icon(Icons.arrow_downward, size: 12, color: Colors.grey),
                                  const SizedBox(width: 4),
                                  Text('1', style: myTextStyle12(fontColor: Colors.grey)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.favorite_border, size: 20, color: Colors.grey),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => _addEmojiToCommentInput('❤️'),
                  child: const Text('❤️', style: TextStyle(fontSize: 24)),
                ),
                GestureDetector(
                  onTap: () => _addEmojiToCommentInput('🙌'),
                  child: const Text('🙌', style: TextStyle(fontSize: 24)),
                ),
                GestureDetector(
                  onTap: () => _addEmojiToCommentInput('🔥'),
                  child: const Text('🔥', style: TextStyle(fontSize: 24)),
                ),
                GestureDetector(
                  onTap: () => _addEmojiToCommentInput('👏'),
                  child: const Text('👏', style: TextStyle(fontSize: 24)),
                ),
                GestureDetector(
                  onTap: () => _addEmojiToCommentInput('😂'),
                  child: const Text('😂', style: TextStyle(fontSize: 24)),
                ),
                GestureDetector(
                  onTap: () => _addEmojiToCommentInput('🥺'),
                  child: const Text('🥺', style: TextStyle(fontSize: 24)),
                ),
                GestureDetector(
                  onTap: () => _addEmojiToCommentInput('😭'),
                  child: const Text('😭', style: TextStyle(fontSize: 24)),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: Colors.grey),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(widget.currentUserProfile), // Ảnh của người dùng hiện tại
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      hintText: 'Join the conversation...',
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                      isDense: true,
                    ),
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        widget.onAddComment(value);
                        _commentController.clear();
                      }
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send_rounded, color: Colors.blue),
                  onPressed: () {
                    if (_commentController.text.isNotEmpty) {
                      widget.onAddComment(_commentController.text);
                      _commentController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
