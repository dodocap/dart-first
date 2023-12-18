import 'package:untitled/23_12_18/practice_5/post.dart';
import 'package:untitled/23_12_18/practice_5/post_repository.dart';

class MockPostMemoryRepository implements PostRepository {
  final List<Post> _postList = [];

  @override
  Future<void> addPost(Post post) async {
    if (_postList.any((e) => e.id == post.id && e.userId == post.userId)) {
      print('포스트 추가 실패 : 동일 ID 존재');
      return;
    }

    _postList.add(post);
    print('포스트 추가 성공!');
  }

  @override
  Future<void> deletePost(Post post) async {
    if(!_postList.remove(post)) {
      print('포스트 삭제 실패 : 해당 포스트 없음');
      return;
    }

    print('포스트 삭제 성공!');
  }

  @override
  Future<void> updatePost(Post post) async {
    final int findIndex = _postList.indexWhere((e) => e.id == post.id && e.userId == post.userId);
    if(findIndex == -1) {
      print('포스트 업데이트 실패 : 해당 포스트 없음');
      return;
    }

    _postList[findIndex] = post;
    print('포스트 업데이트 성공!');
  }

  @override
  Future<List<Post>> getPosts() async {
    return Future.value(_postList);
  }
}
