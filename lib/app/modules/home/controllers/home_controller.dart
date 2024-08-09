// ignore_for_file: unnecessary_overrides

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  bool isLoading = false;
  String progressNumber = '';
  @override
  void onInit() {
    super.onInit();
    fetchProgressNumber();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetchProgressNumber() async {
    try {
      isLoading = true;
      final response = await http.get(
        Uri.parse(
            'https://www.randomnumberapi.com/api/v1.0/random?min=100&max=1000&count=1'),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        progressNumber = data[0].toString();
      }
    } catch (e) {
      throw Exception('Failed to load progress number');
    } finally {
      isLoading = false;
      update();
    }
  }
}
