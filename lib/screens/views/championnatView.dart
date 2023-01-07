import 'package:f1_project_manager/screens/views/RickAstleyView.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class championnatView extends StatelessWidget{
  const championnatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Text("La prochaine saison reprend le 5 mars 2023 à Bahreïn!"),
          Padding(padding: EdgeInsets.all(16)),
          GestureDetector(
            onTap: () {
              Get.to(
                RickAstleyView(),
                duration: const Duration(seconds: 1),
              );
            },
            child: Text("Ne pas appuyer"),
          ),
        ]),
    );
  }
}