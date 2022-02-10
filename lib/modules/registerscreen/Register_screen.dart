import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register/modules/registerscreen/cubit/cubit.dart';
import 'package:register/modules/registerscreen/cubit/states.dart';
import 'package:register/shared/components/component.dart';

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
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, DoctorRegisterStates>(
        listener: (context, state){},
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
                          'Sign-up',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color:Color(hexcolor('#00ABE1')),

                          ),

                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Center(
                          child: CircleAvatar(
                            radius: 60.0,
                            backgroundColor:Color(hexcolor('#E1E2E2')),



                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        defaultFormField(
                          label: 'name',
                          type: TextInputType.name,
                          prefix:
                          Icons.account_circle,
                        ),
                        SizedBox(
                          height:15.0,
                        ),
                        defaultFormField(
                          label: 'contact number',
                          type: TextInputType.phone,
                          prefix:
                          Icons.phone,
                        ),
                        SizedBox(
                          height:15.0,
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
                            suffix: RegisterCubit.get(context).suffix,
                            onSubmit:(value)
                            {

                            },
                            isPassword:RegisterCubit.get(context).isPassword,
                            suffixPressed: (){
                              RegisterCubit.get(context).ChangePasswordVisibility();
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
                          height:25.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! DoctorRegisterLoadingState,
                          builder: (context) => defaultButton(

                            function: () {

                              if(formKey.currentState!.validate())
                                {
                                  RegisterCubit.get(context).userRegister(
                                    name: namecontroller.text,
                                    email: emailcontroller.text,
                                    password: passwordcontroller.text,
                                    phone: phonecontroller.text,
                                  );
                                }

                            },
                            background: Color(hexcolor('#00ABE1')),
                            width: double.infinity,
                            text: 'sign up',
                            isUpperCase: true,
                          ), fallback: (context) => Center(child: CircularProgressIndicator()),


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
