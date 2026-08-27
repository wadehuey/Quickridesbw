import 'package:flutter/material.dart';
import 'ride_request_screen.dart';
import 'driver_screen.dart';
class HomeScreen extends StatelessWidget{const HomeScreen({super.key});@override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:const Text('QuickRidesBW')),body:ListView(padding:const EdgeInsets.all(20),children:[const Text('Move smarter.\nMove with QuickRidesBW.',style:TextStyle(fontSize:28,fontWeight:FontWeight.w900)),const SizedBox(height:20),FilledButton(onPressed:()=>Navigator.push(c,MaterialPageRoute(builder:(_)=>const RideRequestScreen())),child:const Text('Request CAB')),OutlinedButton(onPressed:()=>Navigator.push(c,MaterialPageRoute(builder:(_)=>const DriverScreen())),child:const Text('Driver mode'))]));}}
