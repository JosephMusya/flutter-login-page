import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),

          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
              image: Image.asset("assets/cover/logo.png"),
            ),
            child: Text(
              "Innovators Club",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          // child: Image.asset(
          //   "assets/cover/logo.png",
          //   fit: BoxFit.contain,
          // ),
          const SizedBox(height: 70),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextFormField(
                autofocus: false,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Colors.white,
                    ),
                    hintText: 'Email Adress',
                    border: InputBorder.none),
              ),
            ),
          ),
          const SizedBox(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blueAccent),
              child: TextFormField(
                obscureText: true,
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.remove_red_eye, color: Colors.white),
                  prefixIcon: Icon(Icons.key, color: Colors.white),
                  border: InputBorder.none,
                  hintText: 'Password',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(35),
              child: MaterialButton(
                onPressed: () {},
                child: const Text("Login",
                    style: TextStyle(color: Colors.blue, fontSize: 18)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
