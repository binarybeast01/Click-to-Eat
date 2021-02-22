import 'package:click_to_eat/Providers/Authentication.dart';
import 'package:click_to_eat/Views/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white24),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                  text: TextSpan(
                text: "Click",
                style: TextStyle(
                  fontSize: 56.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: " to",
                    style: TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: " Eat",
                    style: TextStyle(
                      fontSize: 56.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    color: Colors.black,
                    onPressed: () {
                      loginSheet(context);
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  MaterialButton(
                    color: Colors.black,
                    onPressed: () {
                      singInSheet(context);
                    },
                    child: Text(
                      "SignIn",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  loginSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: new Container(
              height: 400.0,
              width: 400.0,
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade700,
              ),
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Enter email",
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        controller: emailController,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Enter password",
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        obscureText: true,
                        controller: passwordController,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        color: Colors.redAccent,
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => Provider.of<Authentication>(context,
                                listen: false)
                            .logInAccount(
                                emailController.text, passwordController.text)
                            .whenComplete(() {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  child: HomePage(),
                                  type: PageTransitionType.bottomToTop));
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  singInSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: new Container(
              height: 400.0,
              width: 400.0,
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade700,
              ),
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Enter email",
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        controller: emailController,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Enter password",
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        obscureText: true,
                        controller: passwordController,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        color: Colors.redAccent,
                        child: Text(
                          "SignIn",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => Provider.of<Authentication>(context,
                                listen: false)
                            .createNewAccount(
                                emailController.text, passwordController.text)
                            .whenComplete(() {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  child: HomePage(),
                                  type: PageTransitionType.bottomToTop));
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
