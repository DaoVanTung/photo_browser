import 'package:flutter/material.dart';
import 'photo_browser_controller.dart';
import 'photo_grid_view.dart';

class PhotoBrowserView extends StatelessWidget {
  PhotoBrowserView({super.key});

  final textKey = GlobalKey<FormFieldState>();
  final controller = PhotoBrowserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 280,
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    // controller: textController,
                    key: textKey,
                    decoration: const InputDecoration(
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(99),
                      // ),
                      hintText: 'Nhập từ khóa cần tìm kiếm...',
                    ),
                    validator: (value) {
                      if (value == null || value.length < 2) {
                        return 'Từ khóa phải có 2 ký tự';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton.icon(
                    onPressed: () {
                      final isValid = textKey.currentState?.validate();
                      if (isValid == true) {
                        final tags = textKey.currentState?.value;
                        controller.getPhotos(tags);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const PhotoGridView(),
                          ),
                        );
                      }
                    },
                    icon: const Icon(Icons.search_rounded),
                    label: const Text('Tìm kiếm'),
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
