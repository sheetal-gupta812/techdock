import 'package:flutter/cupertino.dart';
import 'package:techdock_task/post.dart';
import 'api.dart';

class PostDataProvider with ChangeNotifier {
  var post = [];
  bool loading = false;

  getAllDataList(context) async {
    loading = true;
    post = await getAllList(context);
    loading = false;
    notifyListeners();
  }


}
