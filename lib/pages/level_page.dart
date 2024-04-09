import 'package:flutter/material.dart';
import 'package:ar_interior/pages/picture_page.dart';

class LevelPage extends StatelessWidget {
  const LevelPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        title: Text(
          'Levels',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 3.0,
            color: theme.textTheme.bodyLarge!.color,
            shadows: [
              Shadow(
                color: theme.colorScheme.onPrimary,
                blurRadius: 5.0,
                offset: const Offset(1.5, 1.5),
              ),
            ],
          ),
        ),
        centerTitle: true,
        elevation: 10.0,
      ),
      body: Center(
        child: ListView(
          children: [
            _buildLevelItem(context, 'BedRoom', bedroom),
            _buildLevelItem(context, 'DiningRoom', diningroom),
            _buildLevelItem(context, 'OfficeRoom', officeroom),
            _buildLevelItem(context, 'Hotel', hotel),
            // Add more levels similarly
          ],
        ),
      ),
    );
  }

  Widget _buildLevelItem(
      BuildContext context, String title, List<String> images) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      elevation: 5.0,
      color: Colors.cyan, // Set background color to blue
      child: InkWell(
        onTap: () {
          // Navigate to the picture page with all images for the selected level
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PicturePage(images: images),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 37.0), // Add horizontal padding
              child: SizedBox(
                height: 100,
                child: GridView.count(
                  crossAxisCount: 3,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 4.0, // Add vertical spacing between images
                  crossAxisSpacing:
                      4.0, // Add horizontal spacing between images
                  children: images.take(3).map((image) {
                    return Image.asset(
                      image,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    );
                  }).toList(),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Click to view more >>'),
            )
          ],
        ),
      ),
    );
  }
}

// Define your image paths for each level
List<String> bedroom = [
  'assets/bedroom/bedroom1.jpeg',
  'assets/bedroom/bedroom2.jpeg',
  'assets/bedroom/bedroom3.jpeg',
  'assets/bedroom/bedroom4.jpeg',
  // Add more images for level 1
];

List<String> diningroom = [
  'assets/diningroom/diningroom1.jpeg',
  'assets/diningroom/diningroom2.jpeg',
  'assets/diningroom/diningroom3.jpeg',
  'assets/diningroom/diningroom4.jpeg',
  // Add more images for level 2
];

List<String> officeroom = [
  'assets/officeroom/officeroom1.jpeg',
  'assets/officeroom/officeroom2.jpeg',
  'assets/officeroom/officeroom3.jpeg',
  'assets/officeroom/officeroom4.jpeg',
  // Add more images for level 3
];

List<String> hotel = [
  'assets/hotel/hotel1.jpeg',
  'assets/hotel/hotel2.jpeg',
  'assets/hotel/hotel3.jpeg',
  'assets/hotel/hotel4.jpeg',
  // Add more images for level 4
];

// Define images for other levels similarly
