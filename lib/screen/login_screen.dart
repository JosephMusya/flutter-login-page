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
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Opacity(
              opacity: 0.5,
              child: ClipPath(
                clipper: CustomClipperPath(),
                child: Container(
                    width: double.infinity,
                    height: 340,
                    decoration: const BoxDecoration(color: Colors.blueAccent)),
              ),
            ),
            ClipPath(
              clipper: CustomClipperPath(),
              child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  width: double.infinity,
                  height: 330,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 100, 0, 10),
                    child: Column(
                      children: [
                        const Text(
                          "Innovators' Club",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Opacity(
                          opacity: 0.5,
                          child: SizedBox(
                              height: 120,
                              child: Image.asset(
                                'assets/cover/logo.png',
                                fit: BoxFit.contain,
                              )),
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ),
        const SizedBox(height: 50),
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
            color: Colors.white,
            elevation: 5,
            borderRadius: BorderRadius.circular(35),
            child: MaterialButton(
              padding: const EdgeInsets.all(10),
              minWidth: MediaQuery.of(context).size.width * 0.5,
              onPressed: () {},
              child: const Text(
                "Login",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        const SizedBox(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Dont have an account yet?'),
            const SizedBox(
              width: 10,
            ),
            Material(
              child: MaterialButton(
                onPressed: () {},
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class CustomClipperPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double x = size.width;
    double y = size.height;
    final path = Path();
    path.lineTo(0, y);
    var firstPoint = Offset(x / 5, y);
    var firstEnd = Offset(x / 2.25, y - 50);
    path.quadraticBezierTo(
        firstPoint.dx, firstPoint.dy, firstEnd.dx, firstEnd.dy);
    var secondStart = Offset(x * 0.7, y * 0.7);
    var secondEnd = Offset(x, y - 50);

    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(x, 0);
    // path.lineTo(x, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}
