import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemangment/provider.dart';
import 'package:statemangment/second_page.dart';

TextEditingController name = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController phone = TextEditingController();
TextEditingController password = TextEditingController();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (context)=> Data(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool val = false;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffCBF4FF),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Sign Up...",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                field(context, name , "name"),
                field(context, email, "email"),
                field(context, phone, "phone"),
                field(context, password , "password"),
                Row(
                  children: [
                    Checkbox(value: val, onChanged: (val) {}),
                    const Text("I agree with the Terms & services")
                  ],
                ),
                Consumer(builder: (BuildContext context, Data data, Widget? child) {
                  return Container(
                    width: 400,
                    height: 65,
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: Colors.black,
                        ),
                        onPressed: () {
                          data.SignIn(name.text.toString(), email.text.toString() , phone.text.toString());
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SecondPage()));
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 30),
                        )),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget field (BuildContext context, TextEditingController controller , String hint) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: const OutlineInputBorder(),
        hintText: hint ),
    ),
  );
}