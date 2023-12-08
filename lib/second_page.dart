import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemangment/provider.dart';
import 'package:statemangment/third_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context, Data data, Widget? child) {
      return SafeArea(
        child:
        Scaffold(
          appBar: AppBar(
            title: Text(data.name),
            backgroundColor: const Color(0xffFFCC9D),
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            actions: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                Text("${data.quantity}", style: TextStyle(fontSize: 20),),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.shopping_cart)),

              ],

              )
            ],
          ),
          backgroundColor: const Color(0xffFFCC9D),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/chairwithoutbg.png"),
                  Text(
                    "Welcome ${data.name} your email address is ${data.email} and your mobile Phone is ${data.phone}",
                    style: const TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Consumer(builder: (context, Data data, child) {
                    return Container(
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                data.inc();
                              }),
                          Text(data.quantity.toString()),
                          IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                data.dec();
                              }),
                        ],
                      ),
                    );
                  }),
                  Consumer(builder:
                      (BuildContext context, Data data, Widget? child) {
                    return Container(
                      width: 200,
                      height: 60,
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: Colors.orange,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const ThirdPage()));
                          },
                          child: const Text(
                            "Add To Cart",
                            style: TextStyle(fontSize: 25),
                          )),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
