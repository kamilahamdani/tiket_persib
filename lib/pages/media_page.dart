import 'package:flutter/material.dart';

class MediaPage extends StatefulWidget {
  const MediaPage({super.key});

  @override
  State<MediaPage> createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "MEDIA",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Icon(Icons.search, color: Colors.black),
          SizedBox(width: 16),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xFF0054A6),
          labelColor: const Color(0xFF0054A6),
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(text: "Photos"),
            Tab(text: "Videos"),
          ],
        ),
      ),

      body: TabBarView(
        controller: _tabController,
        children: [
          buildPhotoGrid(),
          buildVideoList(),
        ],
      ),
    );
  }

  /// ------------------- PHOTO GRID --------------------
  Widget buildPhotoGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 6,
        mainAxisSpacing: 6,
      ),
      itemCount: 18,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: Colors.grey.shade300,
            child: const Icon(Icons.image, size: 40, color: Colors.white70),
          ),
        );
      },
    );
  }

  /// ------------------- VIDEO LIST --------------------
  Widget buildVideoList() {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: 8,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey.shade200,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Container(
                    height: 180,
                    color: Colors.grey.shade400,
                    child: const Center(
                      child: Icon(Icons.play_circle_fill, size: 60, color: Colors.white),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    "Highlight Pertandingan Persib...",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}