import 'post.dart';
import 'post_file_repository.dart';
import 'post_manager.dart';
import 'post_repository.dart';

void main() async {
  final PostRepository postRepository = PostFileRepository();
  final PostManager postManager = PostManager(postRepository: postRepository);

  final Post newPost = Post(userId: 1, id: 1, title: '제목1', body: '내용1');
  final Post updatePost = Post(userId: 1, id: 1, title: '제목(업데이트됨)', body: '내용(업데이트됨)');
  final Post otherPost = Post(userId: 2, id: 2, title: '다른 제목', body: '다른 내용');

  final List<Post> postList = await postManager.getPosts();
  print(postList);
  print('------------------------------------------');

  await postManager.addPost(newPost);
  print(postList);
  print('------------------------------------------');

  await postManager.deletePost(otherPost);
  print(postList);
  print('------------------------------------------');

  await postManager.updatePost(updatePost);
  print(postList);
  print('------------------------------------------');
}