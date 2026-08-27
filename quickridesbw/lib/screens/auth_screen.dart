import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthScreen extends StatefulWidget { const AuthScreen({super.key}); @override State<AuthScreen> createState()=>_AuthScreenState(); }
class _AuthScreenState extends State<AuthScreen>{
  final email=TextEditingController(), password=TextEditingController(), name=TextEditingController();
  bool signup=false, loading=false;
  Future<void> submit() async { setState(()=>loading=true); try { final c=Supabase.instance.client; if(signup){ await c.auth.signUp(email:email.text.trim(),password:password.text, data:{'full_name':name.text.trim()}); } else { await c.auth.signInWithPassword(email:email.text.trim(),password:password.text); } if(mounted) Navigator.pop(context); } catch(e){ if(mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(e.toString()))); } finally { if(mounted)setState(()=>loading=false); } }
  @override Widget build(BuildContext context)=>Scaffold(body:SafeArea(child:Center(child:SingleChildScrollView(padding:const EdgeInsets.all(24),child:Column(children:[
    const Icon(Icons.local_taxi,size:64,color:Color(0xFF0877C9)), const SizedBox(height:12),
    const Text('QuickRidesBW',style:TextStyle(fontSize:30,fontWeight:FontWeight.w900)), const Text('Move smarter. Move with us.',style:TextStyle(color:Colors.black54)), const SizedBox(height:28),
    if(signup) TextField(controller:name,decoration:const InputDecoration(labelText:'Full name',border:OutlineInputBorder())), if(signup) const SizedBox(height:12),
    TextField(controller:email,keyboardType:TextInputType.emailAddress,decoration:const InputDecoration(labelText:'Email',border:OutlineInputBorder())), const SizedBox(height:12),
    TextField(controller:password,obscureText:true,decoration:const InputDecoration(labelText:'Password',border:OutlineInputBorder())), const SizedBox(height:18),
    SizedBox(width:double.infinity,height:52,child:FilledButton(onPressed:loading?null:submit,child:Text(loading?'Please wait…':signup?'Create account':'Sign in'))),
    TextButton(onPressed:loading?null:()=>setState(()=>signup=!signup),child:Text(signup?'Already have an account? Sign in':'New to QuickRidesBW? Create an account')),
  ]))));
}
