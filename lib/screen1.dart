import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techdock_task/provider.dart';
import 'package:techdock_task/screen2.dart';
import 'package:techdock_task/widgets/button.dart';
import 'package:techdock_task/widgets/color.dart';
import 'package:techdock_task/widgets/text.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  void initState() {
    super.initState();
    final postMdl = Provider.of<PostDataProvider>(context, listen: false);
    postMdl.getAllDataList(context);
  }

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
                itemCount: postMdl.post1.length,
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
                            text: postMdl.post1[i].id.toString(),
                            size: 16,
                            color: ColorData.black,
                            weight: FontWeight.w500,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          NormalText(
                            text: postMdl.post1[i].title,
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30.0),
        child: BorderButton(
          size: 20,
          weight: FontWeight.w500,
          textName: 'Next',
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Screen2(),
                ));
          },
          width: double.infinity,
        ),
      ),
    );
  }
}
