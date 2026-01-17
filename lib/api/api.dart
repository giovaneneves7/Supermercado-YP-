import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:app_supermercado_ype/util/app_constants.dart';

/// @author Giovane Neves
class Api {

  static const Map<String, String> _defaultHeaders = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };

  static Future<Map<String, dynamic>> post({
    required String uri,
    required Map<String, dynamic> body,
  }) async {
    try {
      final url = Uri.parse('${AppConstants.API_BASE_URL}/$uri');

      print("Requisitando POST: $url");
      print("Body: $body");

      final response = await http.post(
        url,
        headers: _defaultHeaders,
        body: jsonEncode(body),
      );

      print("Response Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode >= 200 && response.statusCode < 300) {

        if (response.body.isEmpty) return {};

        return jsonDecode(response.body);
      } else {
        throw Exception(
            'Erro na requisição: ${response.statusCode} - ${response.body}');
      }
    } on SocketException {
      throw Exception('Sem conexão com a internet.');
    } on FormatException {
      throw Exception('Erro ao processar resposta do servidor.');
    } catch (e) {
      rethrow;
    }
  }
}