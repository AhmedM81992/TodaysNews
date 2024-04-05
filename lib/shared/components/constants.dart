import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  static const String BASE_URL = "newsapi.org";
  static String? API_KEY = dotenv.env['HTTP_API_KEY_BROWSER'];
}
