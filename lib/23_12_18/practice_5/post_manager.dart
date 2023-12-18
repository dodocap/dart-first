import 'post.dart';
import 'post_repository.dart';

class PostManager {
  final PostRepository _postRepository;

  PostManager({
    required PostRepository postRepository,
  }) : _postRepository = postRepository;

  Future<List<Post>> getPosts() async {
    return await _postRepository.getPosts();
  }

  Future<void> addPost(Post post) async {
    await _postRepository.addPost(post);
  }

  Future<void> deletePost(Post post) async {
    await _postRepository.deletePost(post);
  }

  Future<void> updatePost(Post post) async {
    await _postRepository.updatePost(post);
  }
}
