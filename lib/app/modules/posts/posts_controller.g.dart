// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $PostsController = BindInject(
  (i) => PostsController(i<IPostRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PostsController on _PostsControllerBase, Store {
  final _$postsAtom = Atom(name: '_PostsControllerBase.posts');

  @override
  List<PostModel> get posts {
    _$postsAtom.reportRead();
    return super.posts;
  }

  @override
  set posts(List<PostModel> value) {
    _$postsAtom.reportWrite(value, super.posts, () {
      super.posts = value;
    });
  }

  final _$statusAtom = Atom(name: '_PostsControllerBase.status');

  @override
  Status get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(Status value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$getPostsAsyncAction = AsyncAction('_PostsControllerBase.getPosts');

  @override
  Future getPosts() {
    return _$getPostsAsyncAction.run(() => super.getPosts());
  }

  final _$removePostAsyncAction =
      AsyncAction('_PostsControllerBase.removePost');

  @override
  Future removePost(PostModel post, int index) {
    return _$removePostAsyncAction.run(() => super.removePost(post, index));
  }

  @override
  String toString() {
    return '''
posts: ${posts},
status: ${status}
    ''';
  }
}
