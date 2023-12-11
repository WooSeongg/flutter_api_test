import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class JmPricePage extends StatelessWidget{

  const JmPricePage({super.key});

//isFirstLaunch_beogohae_S
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Color(0xFF1A1A1A),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("자산관리의 시작", style:TextStyle(color:Colors.white, fontSize: 28, fontStyle: FontStyle.normal, decoration: TextDecoration.none)),
          Text("벌고해S와 함께해요", style:TextStyle(color:Colors.white, fontSize: 28, fontStyle: FontStyle.normal, decoration: TextDecoration.none)),
          Lottie.asset('lib/assets/introCard.json'),

          Row(
            children:[
              Expanded(
                  child: ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.fromLTRB(20, 15, 20, 15)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
                        backgroundColor: MaterialStatePropertyAll(Color(0xFFFAD113))
                      ),
                      onPressed: (){
                        Get.back();
                      },
                      child: Text("시작하기", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                  )
              )

            ]
          )
        ]
      )
    );
  }

}