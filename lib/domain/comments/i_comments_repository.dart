import 'package:newsproject_monolith/domain/comments/comment.dart';
import 'package:newsproject_monolith/domain/comments/comment_list.dart';

abstract class ICommentsRepository {
  Future<CommentList>? fetchCommentList(String url);
  Future<void> sendComment(String url,Comment comment);
}
