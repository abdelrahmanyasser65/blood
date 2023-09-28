
import 'package:blood/bussiness_logic/sign_in/login_cubit.dart';
import 'package:blood/bussiness_logic/sign_in/login_states.dart';
import 'package:blood/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginScreen extends StatelessWidget{
  static String routeName="LoginScreen";

  const LoginScreen({super.key});

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:const Text('Account Not Found'),
          content:const Text('This account does not exist.'),
          actions: <Widget>[
            TextButton(
              child:const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit,SignInState>(
      builder: (context,state){
        var cubit=BlocProvider.of<SignInCubit>(context);
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.bloodtype_rounded,size: 100,color: Colors.red[700],),
                    const SizedBox(height: 25,),
                    Text("TestBlood",style: TextStyle(fontSize: 32,color: Colors.red[700],fontWeight: FontWeight.bold),),
                    const  SizedBox(height: 14,),
                    const Text('Welcome to our app',style:
                    TextStyle(
                        fontSize: 20
                    ),),
                    const   SizedBox(height: 54,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.white)
                        ),
                        child: Padding(
                          padding:const  EdgeInsets.only(left: 20.0),
                          child: TextField(
                            controller: cubit.emailController,
                            decoration:const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email',

                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.white)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextField(
                            controller: cubit.passwordController,
                            decoration:const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',

                            ),
                          ),
                        ),
                      ),
                    ),

                    const   SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: GestureDetector(
                        onTap: (){
                         cubit.postLogin(context);
                        },
                        child:  InkWell(

                          child: Container(
                            padding:const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.red[700],
                            ),
                            child:const Center(
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const    SizedBox(height: 25,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const    Text(
                          'do not have an account?',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                          },
                          child:const Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
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