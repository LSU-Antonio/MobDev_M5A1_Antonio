import 'package:flutter/material.dart';
import 'package:antonio_m5a1/data/notifier.dart';

class HomeLogin extends StatefulWidget {
  const HomeLogin({super.key});

  @override
  State<HomeLogin> createState() => _HomeLoginState();
}

class _HomeLoginState extends State<HomeLogin> {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  String _name = "";
  String _password = "";
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDarkMode, child) {
        return MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: !isDarkMode
                ? const Color.fromARGB(255, 59, 57, 57)
                : const Color.fromARGB(255, 230, 224, 224),
          ),
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: Center(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white,
                height: 350,
                width: 350,
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Username",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: "Enter your username",
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.lime, width: 10)),
                        ),
                        maxLength: 25),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Password",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: "Enter your password",
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: Icon(Icons.key),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.lime, width: 10)),
                      ),
                      obscureText: true,
                      obscuringCharacter: "*",
                      maxLength: 25,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              foregroundColor: Colors.white,
                              minimumSize: Size(100, 60),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                _name = _nameController.text;
                                _password = _passwordController.text;
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                        _name == "admin" && _password == "admin"
                                            ? "Login Successful"
                                            : "Login Failed",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      content: Text(
                                        _name == "admin" && _password == "admin"
                                            ? "Welcome, $_name. You can now access the app."
                                            : "Invalid credentials. Please try again.",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      backgroundColor: _name == "admin" &&
                                              _password == "admin"
                                          ? Colors.green
                                          : Colors.redAccent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            style: TextButton.styleFrom(
                                              backgroundColor:
                                                  Colors.blueAccent,
                                              foregroundColor: Colors.white,
                                              minimumSize: Size(90, 40),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            child: Text(
                                              "Ok",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ))
                                      ],
                                    );
                                  },
                                );
                              });
                            },
                            child: Text("Submit")),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
