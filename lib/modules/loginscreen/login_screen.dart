
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_design/shared/components/component.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';


class Registerscreen extends StatelessWidget
{



  hexcolor(String colorhexcode)
  {
    String colornew = '0xff' + colorhexcode;
    colornew = colornew.replaceAll('#' , '');
    int colorint = int.parse(colornew);
    return colorint;
  }
  var emailcontroller=TextEditingController();
  var passwordcontroller=TextEditingController();
  var namecontroller=TextEditingController();
  var phonecontroller=TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, DoctorLoginStates>(
        listener: (context, state)
        {

        },
        builder: (context, state)
        {
          return Scaffold(

            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey ,
                    child: Column (
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children:
                      [
                        Container(
                          width: double.infinity,
                          color: Colors.white,


                          child: Stack(
                            children: [
                              Image(
                                image: AssetImage('assets/988b4e10-2879-4e2f-936d-017f18cbc649.jfif'),
                                height: 200.0,
                                width: 440.0,
                              ),

                            ],
                          ),
                        ),

                        Text(
                          'Log-in',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color:Color(hexcolor('#00ABE1')),

                          ),

                        ),
                        SizedBox(
                          height: 40.0,
                        ),

                        defaultFormField(
                            label: 'email',
                            type: TextInputType.emailAddress,
                            prefix:
                            Icons.email,

                            validate: (String value)
                            {
                              if(value.isEmpty)
                              {
                                return 'email must not be empty';
                              }


                            },
                            controller: emailcontroller
                        ),
                        SizedBox(
                          height:15.0,
                        ),
                        defaultFormField(
                          label: 'password',
                          type: TextInputType.visiblePassword,
                          controller: passwordcontroller,
                          prefix:
                          Icons.password,

                          onSubmit:(value)
                          {

                          },

                          validate: (String value)
                          {
                            if(value.isEmpty)
                            {
                              return 'password must not be empty';
                            }

                          },


                        ),
                        SizedBox(
                          height:10.0,
                        ),
                        TextButton(
                          onPressed: (){},
                          child:
                          Text
                            (
                            'Forgot Password?',
                            style: TextStyle(

                              color: Colors.black,

                            ),

                          ),

                        ),
                        SizedBox(
                          height:10.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! DoctorLoginLoadingState,
                          builder: (context) => defaultButton(

                            function: () {

                              if(formKey.currentState!.validate())
                              {
                                LoginCubit.get(context).userLogin(

                                  email: emailcontroller.text,
                                  password: passwordcontroller.text,

                                );
                              }

                            },
                            background: Color(hexcolor('#00ABE1')),
                            width: double.infinity,
                            text: 'login',
                            isUpperCase: true,
                          ), fallback: (context) => Center(child: CircularProgressIndicator()),


                        ),

                        SizedBox(
                          height:10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                'Don\'t  have an account?'
                            ),
                            TextButton(
                              onPressed: (){},
                              child:
                              Text
                                (
                                  'Sign Up',
                                style: TextStyle(
                                color:Color(hexcolor('#00ABE1')),

                              ),

                              ),

                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ) ;
        },
      ),
    );
  }





}
