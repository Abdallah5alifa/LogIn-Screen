import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn ()async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(), 
      password: _passwordController.text.trim());
  }

  @override
  void dispose (){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
  
        body: SafeArea(
          child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image
                Image.asset('assets/animal.png',
                height: 180,
                ),
                SizedBox(height: 20,),
            
                // Title
                Text('SIGN IN',
                style: GoogleFonts.robotoCondensed(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                ),
               // SizedBox(height: 5,),
            
                // Subtitle
                Text('welcom back nice to sea you again',
                style: GoogleFonts.robotoCondensed(fontSize: 18),),
            
                SizedBox(height: 50,),
            
                // Email Textfield
                Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                child:GestureDetector(
                  onTap: signIn,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email'
                        ),
                      ),
                    ),
                  ),
                ) ,
                ),
                const SizedBox(height: 10,),
            
                // Password Textfield
                Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                child:Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration:const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password'
                      ),
                    ),
                  ),
                ) ,
                ),
                SizedBox(height: 15,),
                
                
                //sign in Botton
                Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.amber[900],
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Center(
                    child: Text('Sign in',
                    style: GoogleFonts.robotoCondensed(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    ),
                  ),
                ),
                ),
                SizedBox(height: 20,),
            
                //text: sign up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not yet a member? ',
                    style: GoogleFonts.robotoCondensed(fontWeight: FontWeight.bold),
                    ),
                    Text('Sign up now',
                    style: GoogleFonts.robotoCondensed(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    ),
                    )
                  ],
                )
            
              ],
            ),
          ),
                ),
        ),
    );
  }
}