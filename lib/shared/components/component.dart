import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultButton({

  //components that are common in each button does not need required
  double width = double.infinity ,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 16,
  //components that are required in each button and differ from one to another
  required Function function ,
  required String text ,
}) =>
    Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      width: width,


      child: MaterialButton(
        onPressed: function(),

        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),

    );
Widget defaultFormField ({

  TextEditingController ? controller ,
  required TextInputType type,
  Function ? validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  bool isPasswordShow = false,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPasswordShow,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null ? Icon(
            suffix
        ) : null,

      ),
      validator: validate!=null ? validate(
        validate
      ): null,

    );
