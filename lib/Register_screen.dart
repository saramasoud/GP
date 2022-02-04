import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context)
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
                  TextFormField(
                    onChanged: (String value)
                    {
                      print(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Name',
                      prefixIcon: Icon(
                        Icons.arrow_forward_outlined,
                      ),

                    ),
                  ),
                  SizedBox(
                    height:15.0,
                  ),
                  TextFormField(
                    keyboardType:TextInputType.phone,

                    onChanged: (String value)
                    {
                      print(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Contant Number',
                      prefixIcon: Icon(
                        Icons.phone,
                      ),


                    ),
                  ),
                  SizedBox(
                    height:15.0,
                  ),
                  TextFormField(
                    controller: emailcontroller,
                    keyboardType:TextInputType.emailAddress,
                    onChanged: (String value)
                    {
                      print(value);
                    },
                    validator: (value)
                    {
                      if(value!.isEmpty)
                      {
                        return 'email must not be empty';
                      }
                      return null;

                    },
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      prefixIcon: Icon(
                        Icons.email,
                      ),

                    ),
                  ),
                  SizedBox(
                    height:15.0,
                  ),
                  TextFormField(
                    controller: passwordcontroller,
                    keyboardType:TextInputType.visiblePassword,
                    obscureText: true,
                    onChanged: (String value)
                    {
                      print(value);
                    },
                    validator: (value)
                    {
                      if(value!.isEmpty)
                      {
                        return 'password must not be empty';

                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                      suffixIcon: Icon(
                        Icons.remove_red_eye,
                      ),

                    ),
                  ),
                  SizedBox(
                    height:25.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color:Color(hexcolor('#00ABE1')),
                    ),
                    width: double.infinity,

                    child: MaterialButton(onPressed: ()
                    {
                      if(formKey.currentState!.validate())
                        {
                          print(emailcontroller.text);
                          print(passwordcontroller.text);
                        }




                    },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color:Colors.white
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }





}
