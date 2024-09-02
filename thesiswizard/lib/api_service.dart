import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://localhost:5000'; // server URL

  Future<String> callLlama(String prompt) async {
    final response = await http.post(
      Uri.parse('$baseUrl/llama'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'prompt': prompt}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['response'];
    } else {
      throw Exception('Failed to call Llama API');
    }
  }
}
