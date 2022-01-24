import 'package:flutter/cupertino.dart';
import 'package:techdock_task/post.dart';
import 'api.dart';

class PostDataProvider with ChangeNotifier {
  PostModel post = PostModel(userId: 0, id: 0, title: '', body: '');
  var post1 = [];
  bool loading = false;

  /*getPostData(context) async {
    loading = true;
    post = await getSinglePostData(context);
    loading = false;
    notifyListeners();
  }*/
  getAllDataList(context) async {
    loading = true;
    post1 = await getAllList(context);
    loading = false;
    notifyListeners();
  }


}
