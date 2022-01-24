import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:techdock_task/post.dart';
import 'package:http/http.dart' as https;

Future<List<PostModel>> getAllList(context) async {
  var futureData = <PostModel>[];
  var res;
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