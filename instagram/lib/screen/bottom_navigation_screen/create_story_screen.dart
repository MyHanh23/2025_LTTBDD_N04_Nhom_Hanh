import 'package:flutter/material.dart';

class CreateStoryScreen extends StatefulWidget {
  const CreateStoryScreen({super.key});

  @override
  State<CreateStoryScreen> createState() => _CreateStoryScreenState();
}

class _CreateStoryScreenState extends State<CreateStoryScreen> {
  final List<String> _imagePaths = [
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
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Không có đổ bóng
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Quay lại màn hình trước
          },
        ),
        title: const Text(
          'Add to story',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildOptionButton(icon: Icons.add, text: 'Add Yours', onPressed: () {}),
                _buildOptionButton(icon: Icons.music_note, text: 'Music', onPressed: () {}),
                _buildOptionButton(icon: Icons.grid_on, text: 'Collage', onPressed: () {}),
              ],
            ),
          ),
          const Divider(height: 1, color: Colors.grey),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: 'Recents', // Giá trị mặc định
                    icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {});
                    },
                    items: <String>['Recents', 'Camera Roll', 'Videos']
                        .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(value: value, child: Text(value));
                        })
                        .toList(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.camera_alt_outlined, color: Colors.black),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 3 cột
                crossAxisSpacing: 2, // Khoảng cách ngang giữa các item
                mainAxisSpacing: 2, // Khoảng cách dọc giữa các item
              ),
              itemCount: _imagePaths.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      color: Colors.grey[200],
                      child: const Center(
                        child: Icon(Icons.camera_alt, size: 40, color: Colors.black54),
                      ),
                    ),
                  );
                }
                final String imagePath = _imagePaths[index - 1];
                return Container(
                  color: Colors.grey[300],
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(child: Icon(Icons.image, color: Colors.grey[600]));
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionButton({
    required IconData icon,
    required String text,
    required VoidCallback onPressed,
  }) {
    return Expanded(
      // Dùng Expanded để các nút chia đều không gian
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[200],
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 0,
          ),
          child: Column(
            children: [
              Icon(icon, size: 24),
              const SizedBox(height: 5),
              Text(text, style: const TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}
