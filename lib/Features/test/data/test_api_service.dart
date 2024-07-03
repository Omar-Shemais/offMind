import 'dart:convert';
import 'package:adhd/Features/test/data/model/test_model.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class TestApiService {
  final Dio _dio = Dio();
  static const String _baseUrl = 'https://mennahmed-fastapi-docker.hf.space/predict';

  Future<PredictionResponse> getPrediction(PredictionRequest request) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(request.toJson()),
    );

    if (response.statusCode == 200) {
      return PredictionResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load prediction');
    }
  }




  // file predict
    Future<int> filePredict(String filePath) async {
    const String url = 'https://off-mind.onrender.com/predict';
    try {
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(filePath),
      });

      final response = await _dio.post(url, data: formData);

      if (response.statusCode == 200) {
        return int.parse(response.data.toString());
      } else {
        throw Exception('Failed to upload file');
      }
    } catch (e) {
      throw Exception('Failed to upload file');
    }
  }
   Future<int> uploadFile(String filePath) async {
    try {
      int result = await filePredict(filePath);
      return result;
    } catch (e) {
      // ignore: avoid_print
      print('File upload failed: $e');
      return 0; // Return 0 if there is an error
    }
  }

}