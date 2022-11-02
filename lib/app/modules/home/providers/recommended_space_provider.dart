import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/space.dart';
import '../../../data/repository/recommended_space_repository.dart';

final recommendedSpaceFutureProvider = FutureProvider<List<Space>>((ref) async {
  final recommendedSpaceRepo = ref.watch(recommendedSpaceProvider);
  return recommendedSpaceRepo.getRecommendedSpace();
});
