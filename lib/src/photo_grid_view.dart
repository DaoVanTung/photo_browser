import 'package:flutter/material.dart';
import 'package:photo_browser/src/photo_browser_controller.dart';
import 'package:photo_browser/src/photo_browser_model.dart';

class PhotoGridView extends StatelessWidget {
  const PhotoGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kết quả'),
      ),
      body: AnimatedBuilder(
        animation: PhotoBrowserController(),
        builder: (context, child) {
          return GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            children: [
              for (final photo in PhotoBrowserModel().photos)
                Image.network(
                  'https://live.staticflickr.com/${photo.server}/${photo.id}_${photo.secret}_w.jpg',
                  fit: BoxFit.cover,
                ),
            ],
          );
        },
      ),
    );
  }
}
