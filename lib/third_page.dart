import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemangment/provider.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context , Data data , child){
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(data.name),
            backgroundColor: const Color(0xffFFCC9D),
            elevation: 0,
            leading: IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: () {
              Navigator.of(context).pop();
            },),
          ),
          backgroundColor: const Color(0xffFFCC9D),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text("Modern Sofa Chair" , style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),),
                const SizedBox(
                  height: 50,
                ),
                Image.asset("assets/images/chairwithoutbg.png"),
                const SizedBox(
                  height: 50,
                ),
                Text("Quantity is ${data.quantity}" , style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),)
              ],
            ),
          ),
        ),
      );
    });
  }
}
