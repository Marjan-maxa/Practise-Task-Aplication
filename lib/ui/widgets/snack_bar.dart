
import 'package:flutter/material.dart';

showSnakBarMassage(BuildContext context,String message){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}