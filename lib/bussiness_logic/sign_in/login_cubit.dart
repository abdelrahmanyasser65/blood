


import 'package:blood/bussiness_logic/sign_in/login_states.dart';
import 'package:blood/core/api_service.dart';
import 'package:blood/core/api_url.dart';
import 'package:blood/screens/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInState>{

 SignInCubit():super(SignInInitState());
 final TextEditingController emailController=TextEditingController();
 final TextEditingController passwordController=TextEditingController();
 Future postLogin(context)async{
   var json={
     'email':emailController.text,
     'password':passwordController.text
   };
   emit(SignInLoading());
   DioHelper.postData(
     url: ApiUrl.login,
     data: json
   ).then((value){
     if(value.statusCode==200){
       print("success");
       print(value.statusCode);
       Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
     }
     emit(SignInSuccess());
   }).catchError((e){
     print("error");
     emit(SignInError());
   });
}

}