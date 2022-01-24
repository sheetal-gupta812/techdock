import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techdock_task/provider.dart';
import 'package:techdock_task/widgets/color.dart';
import 'package:techdock_task/widgets/text.dart';

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    final postMdl = Provider.of<PostDataProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorData.white,
        elevation: 0.0,
        title: NormalText(
            size: 20,
            color: ColorData.black,
            text: 'Screen 2',
            weight: FontWeight.bold),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: postMdl.loading
            ? const CircularProgressIndicator()
            : ListView.builder(
                itemCount: postMdl.post.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10.0,
                          ),
                          NormalText(
                            text: postMdl.post[i].userId.toString(),
                            size: 16,
                            color: ColorData.black,
                            weight: FontWeight.w500,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          NormalText(
                            text: postMdl.post[i].body,
                            size: 16,
                            color: ColorData.black,
                            weight: FontWeight.w500,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    )),
                  );
                },
              ),
      ),
    );
  }
}
