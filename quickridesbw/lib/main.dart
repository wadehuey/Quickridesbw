import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/home_screen.dart';
import 'screens/auth_screen.dart';

const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
const supabaseAnonKey = String.fromEnvironment('SUPABASE_ANON_KEY');

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (supabaseUrl.isNotEmpty && supabaseAnonKey.isNotEmpty) {
    await Supabase.initialize(url:supabaseUrl,anonKey:supabaseAnonKey);
  }
  runApp(const QuickRidesApp());
}
class QuickRidesApp extends StatelessWidget { const QuickRidesApp({super.key});
 @override Widget build(BuildContext context)=>MaterialApp(title:'QuickRidesBW',debugShowCheckedModeBanner:false,theme:ThemeData(useMaterial3:true,colorScheme:ColorScheme.fromSeed(seedColor:const Color(0xFF0877C9)),scaffoldBackgroundColor:const Color(0xFFF7F9FC)),home:const _Gate()); }
class _Gate extends StatelessWidget { const _Gate(); @override Widget build(BuildContext context){if(supabaseUrl.isEmpty||supabaseAnonKey.isEmpty)return const HomeScreen(); final client=Supabase.instance.client;return StreamBuilder<AuthState>(stream:client.auth.onAuthStateChange,builder:(context,s){return client.auth.currentSession==null?const AuthScreen():const HomeScreen();});}}
