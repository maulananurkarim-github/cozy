import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/space.dart';

final recommendedSpaceProvider = Provider<RecommendedSpaceReposritory>((ref) {
  return RecommendedSpaceReposritory();
});

class RecommendedSpaceReposritory {
  Future<List<Space>> getRecommendedSpace() async {
    try {
      final response = await Dio().get('https://bwa-cozy.herokuapp.com/recommended-spaces');
      return spaceFromJson(jsonEncode(response.data));
    } on DioError catch (e) {
      throw Exception(e.error);
    }
  }
}
