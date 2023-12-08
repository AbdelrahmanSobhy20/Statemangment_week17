import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemangment/provider.dart';
import 'package:statemangment/second_page.dart';

TextEditingController name = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController phone = TextEditingController();
TextEditingController password = TextEditingController();
bool checkpass = false;

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
    return Consumer(builder: (context , Data data , child){
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
                  decoration: TextDecoration.underline,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              field(context, name , "name"),
              field(context, email, "email"),
              field(context, phone, "phone"),
              fieldpass(context, password , "password", IconButton(onPressed: () {
                checkpass =! checkpass;
                data.viewPassword(checkpass);
              }, icon: data.passicon)),
              Row(
                children: [
                  Checkbox(value: data.value, onChanged: (value) {
                    data.check();
                  }),
                   const Text.rich(TextSpan(
                       text:"I agree with the",
                       style: TextStyle(
                         fontSize: 17
                       ),
                       children:[TextSpan(text:" Terms & services" , style: TextStyle(
                         fontSize: 20,
                         decoration: TextDecoration.underline,
                         fontWeight: FontWeight.bold,
                       ))]
                       ))
                ],
              ),
              Container(
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
            ),
            ],
          ),
        ),
      ),
      )
      );}
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

Widget fieldpass (BuildContext context, TextEditingController controller , String hint , IconButton viewpass) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
          suffixIcon: viewpass,
          filled: true,
          fillColor: Colors.white,
          border: const OutlineInputBorder(),
          hintText: hint ),
    ),
  );
}