import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  Widget build(context){
    return Scaffold(
      body:SingleChildScrollView(child: centerContainer(context)),
    );
  }

  Widget centerContainer(context){
    return Column(
      children: <Widget>[
        Container(
          width: 800,
          height : 91,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/shape_top.png'),
              fit: BoxFit.contain
            )
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom:18.0),
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/logo_symbol.png')
              )
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
          child: Container(
            padding: EdgeInsets.only(top:24.0),
            width: 350,
            height: 400,
            decoration: BoxDecoration(
              color: const Color(0xffe9e9e9),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(20.0))
            ),
            child: Column(
              children: <Widget>[
                Text(
                  'Login',
                  style:TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize:23,
                  )
                ),
                buildForm(context)
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              autocorrect: false,
              decoration: InputDecoration(
                  hintText: '@username',
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))
                  ),
                  fillColor: Colors.white,
                  filled: true),
              onSaved: (str)=>username=str,
              validator: (str)=> str.length <= 2 ? "username not valid" : null,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: 'Password',
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))
                  ),
                  fillColor: Colors.white,
                  filled: true),
              onSaved: (str)=>password=str,
              validator:(str)=> str.length <= 2 ? "Password must be 3 characters long!" : null,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
          ),
          MaterialButton(
            child: Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Button.png'),
                  fit: BoxFit.cover
                )
              ),
            ),
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
      _formKey.currentState.save();
      var url = 'http://104.248.227.68/';
      http.post(url, body: {"userName": username, "password": password})
      .then((response) {
        print("Response status: ${response.statusCode}");
        print("Response body: ${response.body}");
      });
      
    }
  }
}
