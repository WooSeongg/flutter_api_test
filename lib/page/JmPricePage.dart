import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../common/constants.dart';
import 'dummyPage.dart';

class JmPricePage extends StatelessWidget{

  const JmPricePage({super.key});

//isFirstLaunch_beogohae_S
  @override
  Widget build(BuildContext context) {
   // print(packageInfo.appName);

    return Stack(
      //padding: EdgeInsets.symmetric(horizontal: 20),
      children: [
        ///상단 텍스트
        Padding(
            padding: const EdgeInsets.only(bottom: 350),
            child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 30),
                      children: [
                        TextSpan(text: "자산관리의 시작\n"),
                        TextSpan(text: "벌고해S와 함께해요"),
                      ]),
                ))),

        ///중앙 카드 이미지
        Center(
          child: Lottie.asset('lib/assets/introCard.json'),
        ),

        ///페이지 이동 버튼
        Container(
            padding: EdgeInsets.only(top: 380, left:20, right:20),
            alignment: Alignment.center,
            child: Row(children: [
              Expanded(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.symmetric(vertical: 25)),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100))),
                          backgroundColor:
                          MaterialStatePropertyAll(Color(0xFFFAD113))),
                      onPressed: () {
                        Get.to(DummyPage());
                      },
                      child: const Text("시작하기",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))))
            ])
        )
      ],
    );
  }

}