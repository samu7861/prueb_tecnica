import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {

  static String keyApi = dotenv.env["CINEAPP_KEY"] ?? "no hay api";

}