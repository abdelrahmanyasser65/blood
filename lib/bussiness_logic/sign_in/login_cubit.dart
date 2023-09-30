


import 'package:blood/bussiness_logic/sign_in/login_states.dart';
import 'package:blood/core/api_service.dart';
import 'package:blood/core/api_url.dart';
import 'package:blood/screens/home_screen.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInState>{

 SignInCubit():super(SignInInitState());
 final TextEditingController emailController=TextEditingController();
 final TextEditingController passwordController=TextEditingController();
 Future postLogin(context)async{

   try{
     var json = {
       'email': emailController.text,
       'password': passwordController.text,
     };
     emit(SignInLoading());
     var re=await DioHelper.postData(
         url: ApiUrl.login,
         data: json
     );
     if(re.statusCode==200){
       print("success");
       print(re.statusCode);
       Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
     }
     emit(SignInSuccess());
   }
   on DioError catch(e){
     print(e.message.toString());
     print(e.response!.data.toString());
     print("error");
     emit(SignInError());
   }
}

}