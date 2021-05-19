import 'dart:core';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();
  var selectedTime  = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    String date = selectedDate.toIso8601String().split('T').first;
    String time = selectedTime.format(context);
    return Scaffold(
      backgroundColor: Colors.blue[100],
        appBar: AppBar(
         backgroundColor: Colors.blueAccent,
          centerTitle: true,
          title: Text('Date and Time'),
        ),
        body: Builder(
            builder: (context){
              return Center(
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Date :- ${date}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),),
                        Text('Time :- ${time}',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),)
                      ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                    InkWell(
                      child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blueAccent,
                              onPrimary: Colors.deepPurpleAccent
                            ),
                            onPressed: ()async{
                              await showDateTime(context);

                            },
                            child: Text('Select Data&&Time',
                              style: TextStyle(
                                color: Colors.white
                              ),),
                          ),
                      ),
                      splashColor: Colors.deepPurple,
                      highlightColor: Colors.blueAccent,
                    ),
                  ],
                ),
              );
            }
        )
    );
  }

  Future<void> showDateTime(BuildContext context)async{
   var date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1000),
      lastDate: DateTime.now(),
    );
    if(date != null && date!=selectedDate )
     setState(() {
       selectedDate = date;
     });

   TimeOfDay time = await showTimePicker(
       context: context,
       initialTime: selectedTime

   );
   if(time != null && time!=selectedTime )
     setState(() {
       selectedTime = time ;
     });

   await snakbar('Date:- '+ date.toIso8601String().split('T').first +'  Time:- ' + time.format(context));

  }

  Future<void> showTime(BuildContext context) async{
    
  }

  void snakbar(String text)async{
   await ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$text')));
  }

}


