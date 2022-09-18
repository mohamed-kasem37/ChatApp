import 'package:chat_app/validateEmail.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routname = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool vispassword = true;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    const color = const Color(0xFF4E312A);

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/BG.jpg'), fit: BoxFit.fill)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              'Create Account',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
          ),
          body: Container(
            child: Form(
              key: formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .3,
                    ),
                    TextFormField(
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'please enter full Name';
                        } else
                          return null;
                      },
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(labelText: 'Enter Full Name'),
                    ),
                    TextFormField(
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'please enter User Name';
                        }
                        return null;
                      },
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(labelText: 'User Name'),
                    ),
                    TextFormField(
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'please enter e-mail';
                        }
                        if (!Validate.isvalid(text)) {
                          return 'plese enter valid email';
                        }
                        return null;
                      },
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(labelText: 'E-mail'),
                    ),
                    TextFormField(
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'please enter password';
                        } else {
                          if (text.length < 6)
                            return 'please enter valid password';
                          return null;
                        }
                      },
                      style: TextStyle(fontSize: 20),
                      obscureText: vispassword,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: InkWell(
                              onTap: () {
                                vispassword = !vispassword;
                                setState(() {});
                              },
                              child: Icon(Icons.visibility))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        padding: EdgeInsets.all(20),
                        // decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
                        child: ElevatedButton(
                          onPressed: () {
                            onclickbutton();
                            setState(() {});
                          },
                          child: Text(
                            'Create Account',
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(color),
                          ),
                        ))
                  ]),
            ),
          )),
    );
  }

  void onclickbutton() {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    setState(() {});
  }
}
