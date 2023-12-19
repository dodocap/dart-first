import 'package:test/test.dart';
import 'package:untitled/23_12_18/practice_5/post.dart';
import 'package:untitled/23_12_18/practice_5/post_manager.dart';
import 'package:untitled/23_12_18/practice_5/post_repository.dart';
import 'mock_post_memory_repository.dart';

void main() {
  late PostManager postManager;
  late Post newPost;
  late Post updatePost;
  late Post otherPost;

  setUpAll(() {
    newPost = Post(userId: 1, id: 1, title: '제목1', body: '내용1');
    updatePost = Post(userId: 1, id: 1, title: '제목(업데이트됨)', body: '내용(업데이트됨)');
    otherPost = Post(userId: 2, id: 2, title: '다른 제목', body: '다른 내용');
  });

  setUp(() async {
    PostRepository postRepository = MockPostMemoryRepository();
    postManager = PostManager(postRepository: postRepository);

    // given 신규 포스트 1개 삽입
    await postManager.addPost(newPost);
  });

  test('연습문제5_포스트 불러오기', () async {
    // when (포스트를 불러옴)
    List<Post> postList = await postManager.getPosts();

    // then (저장된 포스트가 있으므로, isEmpty는 false이고, 크기는 1)
    expect(postList.isEmpty, false);
    expect(postList.length, 1);
  });

  test('연습문제5_포스트 저장', () async {
    // when (새로운 포스트를 저장하고, 다시 불러옴)
    await postManager.addPost(otherPost);
    List<Post> postList = await postManager.getPosts();

    // then (otherPost가 저장되었으므로, 2개의 포스트를 반환)
    expect(postList.length, 2);
    expect(postList.first, newPost);
    expect(postList.last, otherPost);
  });

  test('연습문제5_포스트 중복 저장 실패', () async {
    // when (기존 포스트와 동일한 userId, Id의 포스트를 저장, 다시 불러옴)
    await postManager.addPost(updatePost);
    List<Post> postList = await postManager.getPosts();

    // then (중복 저장이 실패하였다면, List 크기는 1이고 마지막 포스트는 newPost)
    expect(postList.length, 1);
    expect(postList.last, newPost);
  });

  test('연습문제5_포스트 업데이트 성공', () async {
    // when (userId, Id가 동일한 다른 내용의 포스트 업데이트 요청, 다시 불러옴)
    await postManager.updatePost(updatePost);
    List<Post> postList = await postManager.getPosts();

    // then (업데이트 되었다면, 업데이트 된 내용과 일치)
    expect(postList[0], updatePost);
  });

  test('연습문제5_포스트 업데이트 실패', () async {
    // when (userId, Id가 다른 내용의 포스트 업데이트 요청, 다시 불러옴)
    await postManager.updatePost(otherPost);
    List<Post> postList = await postManager.getPosts();

    // then (업데이트가 실패하여, 기존 포스트와 일치)
    expect(postList[0], newPost);
  });

  test('연습문제5_포스트 삭제 성공', () async {
    // when (newPost와 동일한 포스트 삭제 요청, 다시 불러옴)
    await postManager.deletePost(newPost);
    List<Post> postList = await postManager.getPosts();

    // then (삭제가 성공하여, 리스트 크기는 0)
    expect(postList.isEmpty, true);
  });

  test('연습문제5_포스트 삭제 실패1', () async {
    // when (newPost와 다른 포스트 내용 삭제 요청, 다시 불러옴)
    await postManager.deletePost(otherPost);
    List<Post> postList = await postManager.getPosts();

    // then (삭제가 실패하여, newPost가 담긴 리스트를 반환)
    expect(postList.first, newPost);
  });

  test('연습문제5_포스트 삭제 실패2', () async {
    // when (newPost와 userId, Id는 동일하지만 제목과 내용이 다른 포스트 삭제 요청)
    await postManager.deletePost(updatePost);
    List<Post> postList = await postManager.getPosts();

    // then (삭제가 실패하여, newPost가 담긴 리스트를 반환)
    expect(postList.first, newPost);
  });
}