import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:folio/pages/pageHandler.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String name, email, displayPicture;

  final googleBlue = const Color(0xFF4285F4);
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<FirebaseUser> _handleSignIn() async {
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    var user = await auth.signInWithCredential(credential);
    return user.user;
  }

  Widget signInButton(){
   return new Container(
      child: new RaisedButton(
        onPressed: () async{
          FirebaseUser user = await _handleSignIn();
          name = user.displayName;
          email = user.email;
          displayPicture = user.photoUrl;
          print(name);
          print(email);
          print(displayPicture);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => PageHandler(
                name: name,
                email: email,
                profileImage: displayPicture,
              )
            )
          );
        },
        padding: EdgeInsets.only(top: 3.0,bottom: 3.0,left: 3.0),
        color: const Color(0xFF4285F4),
        child: new Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Image.asset(
              'assets/images/google-logo.jpg',
              height: 52.0,
            ),
            new Container(
              padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: new Text("Sign in with Google",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
            ),
          ],
        )
      ),
    );
  }

  signInSilently() async{
    var user = await googleSignIn.signInSilently();
    if(user != null){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => PageHandler(
            name: user.displayName,
            email: user.email,
            profileImage: user.photoUrl,
          )
        )
      );
    }
  }

  @override
  void initState() {
    signInSilently();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 6,
              ),
              CircleAvatar(
                radius: 72,
                backgroundImage: AssetImage(
                  'assets/images/avatar.jpg',
                ),
              ),
              SizedBox(
                height: 48,
              ),
              signInButton(),
              SizedBox(
                height: MediaQuery.of(context).size.height / 6,
              )
            ],
          ),
        ),
      )
    );
  }
}