import 'package:fetch_api_cubit/services/api_service.dart';

import '../models/post_model.dart';

class ApiRepository {
  const ApiRepository({required this.apiService});

  final ApiService apiService;

  Future<List<Post>?> getPostList() async {
    final response = await apiService.getPostData();

    if(response != null){
      final data = response.data as List<dynamic>;
      return data.map((singlePost) {
        return Post.fromMap(singlePost);
      }).toList();
    }

  }
}
