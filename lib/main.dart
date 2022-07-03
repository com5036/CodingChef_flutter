import "package:flutter/material.dart";

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Login",
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 50)),
            const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  'images/luffy.png',
                ),
                backgroundColor: Colors.red,
                radius: 100,
              ),
            ),
            Form(
              child: Theme(
                data: ThemeData(
                  primaryColor: Colors.teal,
                  inputDecorationTheme: const InputDecorationTheme(
                    labelStyle: TextStyle(
                      color: Colors.teal,
                      fontSize: 15,
                    ),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(40.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          labelText: "id",
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      TextField(
                        controller: controller2,
                        decoration: InputDecoration(
                          labelText: "pw",
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ButtonTheme(
                        minWidth: 200,
                        height: 50,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            if (controller.text == "admin" &&
                                controller2.text == "1234") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext ctx) =>
                                      const LoginSuccessPage(),
                                ),
                              );
                            } else if (controller.text != "admin") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("계정이 없다!"),
                                ),
                              );
                            } else if (controller.text == "admin" &&
                                controller2.text != "1234") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("비밀번호가 틀렸다!"),
                                ),
                              );
                            }
                          },
                          child: const Icon(
                            Icons.arrow_forward,
                            size: 30,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LoginSuccessPage extends StatelessWidget {
  const LoginSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Success"),
      ),
      body: const Center(
        child: Text("Login Success"),
      ),
    );
  }
}
