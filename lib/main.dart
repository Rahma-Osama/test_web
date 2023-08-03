import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var formKey= GlobalKey<FormState>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
final emailController = TextEditingController();
final passwordController = TextEditingController();
var formKey= GlobalKey<FormState>();
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6C0414),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
         Image.asset('assets/images/img.png',width: MediaQuery.of(context).size.width/2,),
          Center(
            child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height/6),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: customTextFormField(
                          controller: emailController,
                          pref: Icons.email,
                          label: "email"),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height /40,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: customTextFormField(
                          controller: passwordController,
                          pref: Icons.remove_red_eye,
                          label: "password",
                          isobsecure: true),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 40,
                    ),
                    customButton(
                        context: context,
                        text: "Log In",
                        fun: () async {
                          // if(formKey.currentState!.validate()){
                          //   BlocProvider.of<AuthCubit>(context).logIn(email: emailController.text, password: passwordController.text);
                          //   await BlocProvider.of<LayoutCubit>(context).getUsersData();
                          // }
                        }),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 40,
                    ),

                  ],
                )
              ],
            ),
        ),
          ),
    ],
      )
    ));
  }Widget customTextFormField({
    required controller,
    required pref,
    required label,
    bool isobsecure = false

  }
      ){
    return TextFormField(
      obscureText: isobsecure,
      cursorColor: Colors.black,
      controller: controller ,
      validator: (String ? value){
        if(value ==null || value.isEmpty){
          return "required";
        }
        else return null;
      },
      decoration: InputDecoration(

          prefixIcon: Icon(pref,color: Colors.white,),
          label: Text("$label",style: TextStyle(
              color: Colors.white
          ),),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder()
      ),
    );
  }
  Widget customButton({
    required text,
    required fun(),
    required context
  }){
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width/6,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
        alignment: Alignment.center,
        child: Text("$text",
          style: TextStyle(
              color: Color(0xFF6C0414),
              fontSize: 18
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
        ),
      ),
      onTap: fun,
    );
  }
}




