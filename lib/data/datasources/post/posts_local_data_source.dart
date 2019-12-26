import 'dart:convert' show json;
import 'package:mel/core.dart' show CacheException;
import 'package:mel/models.dart' show PostModel;
import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;
import 'package:meta/meta.dart' show required;

abstract class PostsLocalDataSource {
  Future<List<PostModel>> getCachedPostsData();
  Future<void> cachePostsData({List<PostModel> posts});
  Future<void> cachePostData({PostModel post});
  Future<void> cleanPostsData();
}

const CACHED_POSTS_DATA = 'cached_post_data';

class PostsLocalDataSourceImpl implements PostsLocalDataSource {
  final SharedPreferences sharedPreferences;

  PostsLocalDataSourceImpl({@required this.sharedPreferences})
      : assert(sharedPreferences != null);

  @override
  Future<void> cachePostsData({@required List<PostModel> posts}) {
    if (posts == null || posts.length < 1) throw CacheException();

    final jsonStringList =
        posts.map((post) => json.encode(post.toJson())).toList();

    return sharedPreferences.setStringList(
      CACHED_POSTS_DATA,
      jsonStringList,
    );
  }

  @override
  Future<void> cachePostData({@required PostModel post}) {
    if (post == null) throw CacheException();

    final jsonStringList = sharedPreferences.getStringList(
      CACHED_POSTS_DATA,
    );
    jsonStringList.add(json.encode(post.toJson()));

    return sharedPreferences.setStringList(
      CACHED_POSTS_DATA,
      jsonStringList,
    );
  }

  @override
  Future<void> cleanPostsData() {
    return sharedPreferences.remove(CACHED_POSTS_DATA);
  }

  @override
  Future<List<PostModel>> getCachedPostsData() {
    final jsonStringList = sharedPreferences.getStringList(
      CACHED_POSTS_DATA,
    );

    if (jsonStringList == null || jsonStringList.length < 1) return null;

    final postList =
        jsonStringList.map((item) => PostModel.fromJson(json.decode(item)));

    return Future.value(postList.toList());
  }
}
