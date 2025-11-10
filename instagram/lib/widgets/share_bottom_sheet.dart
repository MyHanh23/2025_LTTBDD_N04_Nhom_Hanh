import 'package:flutter/material.dart';
import 'package:instagram/domain/utils.dart'; // Đảm bảo import file chứa các style của bạn

class ShareBottomSheet extends StatefulWidget {
  final String postImageUrl; // Ảnh của bài đăng cần chia sẻ (để dùng cho "Add to story")
  final String currentUserName; // Tên người dùng hiện tại

  const ShareBottomSheet({super.key, required this.postImageUrl, required this.currentUserName});

  @override
  State<ShareBottomSheet> createState() => _ShareBottomSheetState();
}

class _ShareBottomSheetState extends State<ShareBottomSheet> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, String>> _users = [
    {'name': 'happi_', 'profile': 'assets/images/i16.jpg', 'time': '48m'},
    {'name': 'quoc_anq', 'profile': 'assets/images/i6.jpg', 'time': ''},
    {'name': 'iam_nguyen...', 'profile': 'assets/images/i15.jpg', 'time': ''},
    {'name': 'quang_96', 'profile': 'assets/images/i11.jpg', 'time': '8m'},
    {'name': 'sophiee', 'profile': 'assets/images/i9.jpg', 'time': ''},
    {'name': 'myhanhhh', 'profile': 'assets/images/i20.jpg', 'time': ''},
    {'name': 'Another User', 'profile': 'assets/images/i7.jpg', 'time': ''},
  ];

  List<Map<String, String>> _filteredUsers = [];

  @override
  void initState() {
    super.initState();
    _filteredUsers = _users;
    _searchController.addListener(_filterUsers);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterUsers() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredUsers = _users;
      } else {
        _filteredUsers = _users
            .where((user) => user['name']!.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  Widget _buildShareOption({
    IconData? icon,
    String? imagePath,
    bool isImage = false,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey[200]),
              child: Center(
                child: isImage
                    ? Image.asset(imagePath!, width: 28, height: 28)
                    : Icon(icon, size: 28, color: Colors.black),
              ),
            ),
            const SizedBox(height: 5),
            Text(label, style: myTextStyle12(), maxLines: 1, overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // Drag handle
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      isDense: true,
                    ),
                    style: myTextStyle15(),
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(Icons.person_add_alt_1, color: Colors.black),
              ],
            ),
          ),
          const SizedBox(height: 16),

          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 0.8,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: _filteredUsers.length,
              itemBuilder: (context, index) {
                final user = _filteredUsers[index];
                return Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        ClipOval(
                          child: Image.asset(
                            user['profile']!,
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        if (user['time']!.isNotEmpty)
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                user['time']!,
                                style: myTextStyle12(
                                  fontColor: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      user['name']!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: myTextStyle12(),
                    ),
                  ],
                );
              },
            ),
          ),
          const Divider(height: 1, color: Colors.grey),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  _buildShareOption(
                    icon: Icons.add_circle_outline,
                    label: 'Add to story',
                    onTap: () {
                      print('Add to story: ${widget.postImageUrl}');
                      Navigator.pop(context);
                    },
                  ),
                  _buildShareOption(
                    label: 'WhatsApp',
                    isImage: true,
                    imagePath: 'assets/icons/whatsapp.png',
                    onTap: () {
                      print('Share to WhatsApp');
                      Navigator.pop(context);
                    },
                  ),
                  _buildShareOption(
                    icon: Icons.ios_share,
                    label: 'Share to...',
                    onTap: () {
                      print('Share to other apps');
                      Navigator.pop(context);
                    },
                  ),
                  _buildShareOption(
                    icon: Icons.link,
                    label: 'Copy link',
                    onTap: () {
                      print('Link copied');
                      Navigator.pop(context);
                    },
                  ),
                  _buildShareOption(
                    icon: Icons.chat_bubble_outline,
                    label: 'Messages',
                    isImage: true,
                    imagePath: 'assets/icons/messenger.png',
                    onTap: () {
                      print('Share to Instagram Messages');
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
