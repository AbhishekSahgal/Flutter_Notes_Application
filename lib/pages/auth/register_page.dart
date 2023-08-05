import 'package:chat_app/pages/auth/login_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String fullName = "";
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
                    const Text('Create your account now to chat and explore', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
                    const SizedBox(height: 30,),
                    Image.asset('assets/images/register.png'),
                    const SizedBox(height: 30,),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                        labelText: "Full Name",
                        prefixIcon: Icon(Icons.person,color: Theme.of(context).primaryColor,),
                      ),
                      onChanged: (val){
                        setState(() {
                          fullName = val;
                        }
                        );
                      },
                      validator: (value){
                        if(value!.isEmpty){
                          return "Name cannot be empty";
                        }else{
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 10,),
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
                    const SizedBox(height: 10,),
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
                    const SizedBox(height: 10,),
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
                            register();
                          },
                          child: const Text('Register', style: TextStyle(color: Colors.white,fontSize: 16),
                          )
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text.rich(
                        TextSpan(
                            text: "Already have an account? ",
                            children: [
                              TextSpan(
                                  text: 'Login now',
                                  style: const TextStyle(color: Colors.red),
                                  recognizer: TapGestureRecognizer()..onTap = (){
                                    nextScreen(context, const LoginPage());
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

  register() {}

  Widget togglePassword(){
    return IconButton(onPressed: (){
      setState(() {
        _isSecurePassword = !_isSecurePassword;
      });
    }, icon: _isSecurePassword ? Icon(Icons.visibility) : Icon(Icons.visibility_off), color: Theme.of(context).primaryColor, );
  }
}
