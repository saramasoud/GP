
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_design/modules/loginscreen/cubit/states.dart';



class LoginCubit extends Cubit<DoctorLoginStates> {
  LoginCubit() : super(DoctorLoginInitialState());

  get isEmailVerified => null;

  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({

    required String email,
    required String password,


  }) {

    emit(DoctorLoginLoadingState());


  }




}

