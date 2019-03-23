import 'package:flutter/material.dart';

final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   String username ; 
   String password ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background_rblue.png"),
                fit: BoxFit.cover)),
        child: Center(
            child: Padding(
          padding: EdgeInsets.all(50.0),
          child: buildForm(context),
        )),
      ),
    );
  }

  Widget buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/Intel.ect.png",
              height: 60.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            autocorrect: false,
            decoration: InputDecoration(
                hintText: '@username',
                labelText: 'Username',
                border: OutlineInputBorder(),
                fillColor: Colors.white30,
                filled: true),
            onSaved: (str)=>username=str,
            validator: (str) => !str.contains('@') ? "Invalid EMail ID!" : null,
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
          ),
          TextFormField(
            obscureText: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                border: OutlineInputBorder(),
                fillColor: Colors.white30,
                filled: true),
            onSaved: (str)=>password=str,
            validator:(str)=> str.length <= 7 ? "Password must be 8 characters long!" : null,
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
          ),
          RaisedButton(
            child: Text(
              'GO!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 32.0,
              ),
            ),
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
            onPressed: (){doGo(context);},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          )
        ],
      ),
    );
  }

  void doGo(context) {
    var formKey = _formKey.currentState;
    if (formKey.validate()) {
      print('Login Called !');
    }
  }
}
