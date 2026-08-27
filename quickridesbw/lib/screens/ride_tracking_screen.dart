import 'package:flutter/material.dart';
class RideTrackingScreen extends StatelessWidget{final String rideId;const RideTrackingScreen({super.key,required this.rideId});@override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:const Text('Your ride')),body:Center(child:Text('Ride: $rideId')));}
