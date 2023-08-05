import 'package:chat_app/pages/auth/register_page.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  bool _isSecurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Groupie' , style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 10,),
                    const Text('Login now to see what they are talking!', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
                    Image.asset('assets/images/login.png'),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                        labelText: "Email",
                        prefixIcon: Icon(Icons.email,color: Theme.of(context).primaryColor,),
                      ),
                      validator: (value){
                        return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!) ? null : "Please enter a valid email";
                      },
                      onChanged: (val){
                        setState(() {
                          email = val;
                        }
                        );
                      },
                    ),
                    const SizedBox(height: 15,),
                    TextFormField(
                      obscureText: _isSecurePassword,
                      decoration: textInputDecoration.copyWith(
                        labelText: "Password",
                        prefixIcon: Icon(Icons.lock,color: Theme.of(context).primaryColor,),
                        suffixIcon: togglePassword(),
                      ),
                      validator: (value){
                        if(value!.length < 6){
                          return "Password must be at least 6 characters";
                        }else{
                          return null;
                        }
                      },
                      onChanged: (val){
                        setState(() {
                          password = val;
                        }
                        );
                      },
                    ),
                    const SizedBox(height: 15,),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                          )
                        ),
                          onPressed: (){
                          login();
                          },
                          child: const Text('Sign In', style: TextStyle(color: Colors.white,fontSize: 16),
                          )
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text.rich(
                        TextSpan(
                      text: "Don't have an account? ",
                          children: [
                            TextSpan(
                              text: 'Register here',
                              style: const TextStyle(color: Colors.red),
                              recognizer: TapGestureRecognizer()..onTap = (){
                      nextScreen(context, const RegisterPage());
                            }
                            )
                          ],
                          style: const TextStyle(color: Colors.black,fontSize: 14)
                    ))
                  ],
                )
            ),
          ),
        ),
      ),
    );
  }

  Widget togglePassword(){
    return IconButton(onPressed: (){
      setState(() {
        _isSecurePassword = !_isSecurePassword;
      });
    }, icon: _isSecurePassword ? Icon(Icons.visibility) : Icon(Icons.visibility_off), color: Theme.of(context).primaryColor, );
  }

}

 login() {}
