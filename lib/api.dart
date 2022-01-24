import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:techdock_task/post.dart';
import 'package:http/http.dart' as https;

/*Future<PostModel> getSinglePostData(context) async {
  PostModel result = PostModel(id: 0, userId: 0, title: '', body: '');
  try {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
    final response = await https.get(url,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = PostModel.fromJson(item);
    } else {
      log('DAta not found');
    }
  } catch (e) {
    log('e');
  }
  return result;
}*/

Future<List<PostModel>> getAllList(context) async {
  var futureData = <PostModel>[];
  var res;
  // PostModel result = PostModel(id: 0, userId: 0, title: '', body: '');
  try {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await https.get(url,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
       res = json.decode(response.body);
      for (var data in res) {
        futureData.add(PostModel.fromJson(data));
      }
    }  else {
      log('Data not found');
    }
  } catch (e) {
    log('e');
  }
return futureData;
}