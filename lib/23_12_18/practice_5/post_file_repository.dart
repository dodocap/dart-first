import 'dart:convert';
import 'dart:io';
import 'post.dart';
import 'post_repository.dart';

class PostFileRepository implements PostRepository {
  final File _file = File('${Directory(Platform.script.toFilePath()).parent.path}/Posts.txt');
  final List<Post> _postList = [];
  bool _isReadFromFile = false;

  Future<void> _readFromFile() async {
    if (_isReadFromFile) {
      return;
    }

    try {
      final String readString = await _file.readAsString();
      _postList.addAll((jsonDecode(readString) as List<dynamic>).map((e) => Post.fromJson(e)));
    } catch (e) {
      print('파일을 찾을 수 없어, 신규 파일을 생성합니다.');
    } finally {
      _isReadFromFile = true;
    }
  }

  Future<void> _writeToFile() async {
    final String writeString = jsonEncode(_postList);
    await _file.writeAsString(writeString);
  }

  @override
  Future<void> addPost(Post post) async {
    await _readFromFile();

    if (_postList.any((e) => e.id == post.id && e.userId == post.userId)) {
      print('포스트 추가 실패 : 동일 ID 존재');
      return;
    }

    _postList.add(post);
    await _writeToFile();
    print('포스트 추가 성공!');
  }

  @override
  Future<void> deletePost(Post post) async {
    await _readFromFile();

    if(!_postList.remove(post)) {
      print('포스트 삭제 실패 : 해당 포스트 없음');
      return;
    }

    await _writeToFile();
    print('포스트 삭제 성공!');
  }

  @override
  Future<void> updatePost(Post post) async {
    await _readFromFile();

    final int findIndex = _postList.indexWhere((e) => e.id == post.id && e.userId == post.userId);
    if(findIndex == -1) {
      print('포스트 업데이트 실패 : 해당 포스트 없음');
      return;
    }

    _postList[findIndex] = post;
    await _writeToFile();
    print('포스트 업데이트 성공!');
  }

  @override
  Future<List<Post>> getPosts() async {
    await _readFromFile();

    return _postList;
  }
}
