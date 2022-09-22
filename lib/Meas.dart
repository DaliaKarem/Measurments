import 'package:flutter/material.dart';
import 'package:measurements/Meas.dart';
import 'package:measurements/Units.dart';


List<String> Len=["KM","M","DCM","CM","MM"];
List<String> Cir=["KM","M","DCM","CM","MM"];
List <String>Mass=["TN","KG","G"];
List<String> Time=["Year","Month","Day","Hour","Min","Sec"];
List <String>Vol=["KM3","M3","DCM3","CM3","MM3"];
List <String>Area=["KM2","M2","DCM2","CM2","MM2"];
List <String>Speed=["KM/H","KM/M","KM/s","M/M","M/S"];


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home> {
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  final style = TextStyle(
      fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black);
  final DecIn = InputDecoration(border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black, width: 3),
      borderRadius: BorderRadius.circular(20)));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(backgroundColor: Colors.blueGrey,
        title: Text("Measurments", style: TextStyle(color: Colors.black),),),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
        mywidget("images/R.png", "Length",Len),
          mywidget("images/c.png", "circumference",Cir),
          mywidget("images/A.png", "Area",Area),
          mywidget("images/v.png", "Volume",Vol),
         mywidget("images/m.png", "Mass",Mass),
          mywidget("images/s.png", "Speed",Speed),
          mywidget("images/t.png", "Time",Time),


        ],
      ),
    );
  }


  Widget mywidget(String photo, String text,List<String> meas) {
    double input=0.0;
  String meas1="",meas2="";
    double outpt=0.0;
    String dropdownValue = meas.first;
    String dropdownValue2 = meas.first;
    // meas1=dropdownValue;
    // meas2=dropdownValue2;
    setState(() {
      outpt=LengthUnits(input, dropdownValue, dropdownValue2);
    });
    return ElevatedButton(
      child: AspectRatio(
        aspectRatio: 3.0,
        child: Row(
          children: [
            Image.asset(photo, width: 100.0,),
            Text(text,style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
      onPressed: () {
        showModalBottomSheet(context: context, builder: (context) {
          return Form(
              key: formstate,
              child: Container(
                height: double.maxFinite,
                child: Column(
                  children: [
                    Text("Input", style: style,),
                    TextFormField(
                      decoration: DecIn,
                     onSaved: (Text)
                     {
                      setState(() {
                        input = Text! as double;
                        print("input is $input");
                      });
                      },
                    ),
                    DropdownButtonFormField
                      (
                        elevation: 16,
                        style: TextStyle(fontSize: 20,color: Colors.deepPurple,fontWeight: FontWeight.bold),
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_downward),
                        items:meas.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList()
                   , onChanged: (String ? value)
                    {
                     setState(() {
                       dropdownValue=value!;
                       meas1=dropdownValue;
                       print("Input Meas $meas1");
                     });
                    },

                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                          filled: true,
                        hintText: dropdownValue
                      ),
                    ),
                    Text("output", style: style,),
                    DropdownButtonFormField(
                      elevation: 16,
                      style: TextStyle(fontSize: 20,color: Colors.deepPurple,fontWeight: FontWeight.bold),
                      value: dropdownValue2,
                      icon: const Icon(Icons.arrow_downward),
                      items:meas.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList()
                      , onChanged: (String ? value)
                    {
                      setState(() {
                        dropdownValue2=value!;
                        meas2=dropdownValue2;
                        print("output Meas $meas2");
                      });
                    },

                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30))
                          ),
                          filled: true,
                          hintText: dropdownValue2
                      ),
                    ),
                    ElevatedButton(
                        child: Text(
                            "Done".toUpperCase(),
                            style: TextStyle(fontSize: 20)
                        ),
                        style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                    side: BorderSide(color: Colors.red)
                                )
                            )
                        ),
                        onPressed: () {
                          setState(() {
                            outpt = LengthUnits(input, dropdownValue, dropdownValue2);
                            print("OUTPUT is $outpt");
                          });
                        }
                    ),
                    Text(
                      "$outpt",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize:30
                      ),
                      maxLines:1,

                    ),

                  ],
                ),
              )
          );
        }
        );
      },
    );
  }
}
