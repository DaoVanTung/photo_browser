import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class PhotoBrowserService {
  PhotoBrowserService();

  Future<Response?> getPhotos(String tags) async {
    final uri = Uri.https(
      'www.flickr.com',
      '/services/rest/',
      {
        'method': 'flickr.photos.search',
        'api_key': '7b3a708545d4ea4c2169b6bf88936821',
        'tags': tags,
        'format': 'json',
        'nojsoncallback': '1',
      },
    );

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return response;
    }

    return null;
  }
}
