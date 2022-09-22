import 'package:flutter/material.dart';
import 'package:measurements/main.dart';
import 'package:measurements/Meas.dart';

double LengthUnits(double input,String Measin,String Measout){
  //input output=KM M DCM CM MM
  //             1000 10 10 10
  double output=0.0;
  if(Measin==Measout)
    {
      output=input;
    }
  switch(Measin)
  {
    case "KM":
      if(Measout=="M") output=input*1000;
      if(Measout=="DCM")output=input*10000;
      if(Measout=="CM")output=input*100000;
      if(Measout=="MM")output=input*1000000;
      break;
    case "M":
      if(Measout=="KM") output=input/1000;
      if(Measout=="DCM")output=input*10;
      if(Measout=="CM")output=input*100;
      if(Measout=="MM")output=input*1000;
      break;
    case "DCM":
      if(Measout=="KM") output=input/10000;
      if(Measout=="M")output=input/10;
      if(Measout=="CM")output=input*10;
      if(Measout=="MM")output=input*100;
      break;
    case "CM":
      if(Measout=="KM") output=input/100000;
      if(Measout=="M")output=input/100;
      if(Measout=="DCM")output=input/10;
      if(Measout=="MM")output=input*10;
      break;
    case "MM":
      if(Measout=="KM") output=input/1000000;
      if(Measout=="M")output=input/1000;
      if(Measout=="DCM")output=input/100;
      if(Measout=="CM")output=input/10;
      break;
  }
  return output;

}