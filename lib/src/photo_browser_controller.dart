import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:photo_browser/src/photo_browser_model.dart';
import 'package:photo_browser/src/photo_browser_service.dart';

class PhotoBrowserController extends ChangeNotifier {
  PhotoBrowserController._();
  static PhotoBrowserController? _instance;
  factory PhotoBrowserController() {
    _instance ??= PhotoBrowserController._();
    return _instance!;
  }

  final model = PhotoBrowserModel();

  Future getPhotos(String tags) async {
    final service = PhotoBrowserService();
    final response = await service.getPhotos(tags);
    if (response != null) {
      final result = jsonDecode(response.body) as Map;
      final photos = result['photos']['photo'] as List;
      for (final photo in photos) {
        model.photos.add(Photo.fromMap(photo));
      }
      notifyListeners();

      print(model.photos);
    }
  }
}
