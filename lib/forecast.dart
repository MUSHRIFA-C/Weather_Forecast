
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'constraints.dart' as k;

class Forecast extends StatefulWidget {
  const Forecast({Key? key}) : super(key: key);

  @override
  State<Forecast> createState() => _ForecastState();
}

class _ForecastState extends State<Forecast> {

  DateTime date=DateTime.now();
  String dayOfWeek = DateFormat('EEEE').format(DateTime.now());
  String monthAndDate = DateFormat('MMMM yyyy').format(DateTime.now());

  bool isLoaded=false;
  num? main_temp;
  num? min_temp;
  num? max_temp;
  num? pressure;
  num? humidity;
  num? cover;
  late int sunset;
  late int sunrise;
  num? speed;
  num? first_temp;
  num? sec_temp;
  num? thi_temp;
  num? four_temp;
  num? fif_temp;

  String cityname='';
  String description='';
  String date_time1='';
  String date_time2='';
  String date_time3='';
  String date_time4='';
  String date_time5='';

  late DateTime date1;
  late DateTime date2;
  late DateTime date3;
  late DateTime date4;
  late DateTime date5;

  var dt_sunrise;
  var dt_sunset;

  void initState() {
    // TODO : implement initState
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('${dayOfWeek}, ${monthAndDate}',style: TextStyle(
            fontSize: 15,color: Colors.grey.shade600
        ),),
        actions: [
          Icon(Icons.more_vert,color: Colors.white,size: 25,)
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 6,right: 6,top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${cityname.toUpperCase()}',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                    color: Colors.white,
                    letterSpacing: 1.5
                ),),
                SizedBox(height: 5,),
                Text('${description.toUpperCase()}',style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 17,
                    color: Colors.grey.shade400,
                    letterSpacing: 1.8
                ),),
                SizedBox(height: 15,),
                Icon(Icons.cloudy_snowing,size: 69,color: Colors.white,),
                Text('${main_temp?.toInt()}°',style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 88,
                    color: Colors.white,
                    letterSpacing: 1.8
                ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text('max',style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                          color: Colors.grey.shade600,
                        ),),
                        SizedBox(height: 8,),
                        Text('${max_temp?.toInt()}°',style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 17,
                          color: Colors.white,
                        ),),
                      ],
                    ),
                    SizedBox(
                      height: 33,
                      child: VerticalDivider(
                        color: Colors.grey.shade600,
                        thickness: 1,
                        width: 40,
                      ),
                    ),
                    Column(
                      children: [
                        Text('min',style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                          color: Colors.grey.shade600,
                        ),),
                        SizedBox(height: 8,),
                        Text('${min_temp?.toInt()}°',style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 17,
                          color: Colors.white,
                        ),),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 13,),
                Divider(
                  color: Colors.grey.shade900,
                  thickness: 1,
                ),
                SizedBox(height: 13,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text('${DateFormat('EE').format(date1)}, ${DateFormat('hh a').format(date1)}',style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),),
                        SizedBox(height: 5,),
                        Icon(Icons.cloudy_snowing,size: 27,color: Colors.white,),
                        SizedBox(height: 5,),
                        Text('${first_temp?.toInt()}°',style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          color: Colors.white,
                        ),),
                      ],
                    ),
                    Column(
                      children: [
                        Text('${DateFormat('EE').format(date2)}, ${DateFormat('hh a').format(date2)}',style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),),
                        SizedBox(height: 5,),
                        Icon(Icons.cloudy_snowing,size: 27,color: Colors.white,),
                        SizedBox(height: 5,),
                        Text('${sec_temp?.toInt()}°',style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          color: Colors.white,
                        ),),
                      ],
                    ),
                    Column(
                      children: [
                        Text('${DateFormat('EE').format(date3)}, ${DateFormat('hh a').format(date3)}',style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),),
                        SizedBox(height: 5,),
                        Icon(Icons.cloudy_snowing,size: 27,color: Colors.white,),
                        SizedBox(height: 5,),
                        Text('${thi_temp?.toInt()}°',style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          color: Colors.white,
                        ),),
                      ],
                    ),
                    Column(
                      children: [
                        Text('${DateFormat('EE').format(date4)}, ${DateFormat('hh a').format(date4)}',style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),),
                        SizedBox(height: 5,),
                        Icon(Icons.cloudy_snowing,size: 27,color: Colors.white,),
                        SizedBox(height: 5,),
                        Text('${four_temp?.toInt()}°',style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          color: Colors.white,
                        ),),
                      ],
                    ),
                    Column(
                      children: [
                        Text('${DateFormat('EE').format(date5)}, ${DateFormat('hh a').format(date5)}',style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),),
                        SizedBox(height: 5,),
                        Icon(Icons.cloudy_snowing,size: 27,color: Colors.white,),
                        SizedBox(height: 5,),
                        Text('${fif_temp?.toInt()}°',style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          color: Colors.white,
                        ),),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 13,),
                Divider(
                  color: Colors.grey.shade900,
                  thickness: 1,
                ),
                SizedBox(height: 13,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text('wind speed',style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),),
                        SizedBox(height: 13,),
                        Text('${speed?.toInt()} m/s',style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          color: Colors.white,
                        ),),
                      ],
                    ),
                    SizedBox(
                      height: 33,
                      child: VerticalDivider(
                        color: Colors.grey.shade600,
                        thickness: 1,
                      ),
                    ),
                    Column(
                      children: [
                        Text('sunrise',style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),),
                        SizedBox(height: 13,),
                        Text('${DateFormat('hh:mm a').format(dt_sunrise)}',style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          color: Colors.white,
                        ),),
                      ],
                    ),
                    SizedBox(
                      height: 33,
                      child: VerticalDivider(
                        color: Colors.grey.shade600,
                        thickness: 1,
                      ),
                    ),
                    Column(
                      children: [
                        Text('sunset',style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),),
                        SizedBox(height: 13,),
                        Text('${DateFormat('hh:mm a').format(dt_sunset)}',style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          color: Colors.white,
                        ),),
                      ],
                    ),
                    SizedBox(
                      height: 33,
                      child: VerticalDivider(
                        color: Colors.grey.shade600,
                        thickness: 1,
                      ),
                    ),
                    Column(
                      children: [
                        Text('humidity',style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),),
                        SizedBox(height: 13,),
                        Text('${humidity}%',style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          color: Colors.white,
                        ),),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 40,)
              ],
            ),
          ),
        ),
      ),
    );
  }

  getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,
      forceAndroidLocationManager: true, //last known position
    );
    if (position != null) {
      print('lat: ${position.latitude},long: ${position.longitude}');
      getCurrentCityWeather(position);
    }
    else {
      print('Data Unavailable');
    }
  }

  getCurrentCityWeather(Position pos)async{
    var client=http.Client();
    var url='${k.domain}lat=${pos.latitude}&lon=${pos.longitude}&appid=${k.apiKey}';
    print(url);
    var uri=Uri.parse(url);
    var response=await client.get(uri);
    if(response.statusCode == 200){
      var data=response.body;
      var decodedData=jsonDecode(data);
      print(data);
      updateUI(decodedData);
      setState(() {
        isLoaded=true;
      });
    }
    else{
      print('Error : ${response.statusCode}');
    }
  }

  updateUI(var decodedData){
    setState(() {

      if(decodedData==null){
        max_temp=0;
        humidity=0;
        cityname='Not Available';
        sunrise=0;
        sunset=0;
        description='Not Available';
      }
      else{
        main_temp=decodedData['list'][0]['main']['temp']-273;
        min_temp=decodedData['list'][0]['main']['temp_min']-273;
        max_temp=decodedData['list'][0]['main']['temp_max']-273;
        humidity=decodedData['list'][0]['main']['humidity'];
        cityname=decodedData["city"]['name'];
        sunrise=decodedData["city"]['sunrise'];
        sunset=decodedData["city"]['sunset'];
        description=(decodedData['list'][0]['weather'][0]['description']);
        speed=decodedData['list'][0]['wind']['speed'];
        first_temp=decodedData['list'][1]['main']['temp']-273;
        sec_temp=decodedData['list'][0]['main']['temp']-273;
        thi_temp=decodedData['list'][0]['main']['temp']-273;
        four_temp=decodedData['list'][0]['main']['temp']-273;
        fif_temp=decodedData['list'][0]['main']['temp']-273;

        date_time1=decodedData['list'][1]['dt_txt'];
        date_time2=decodedData['list'][2]['dt_txt'];
        date_time3=decodedData['list'][3]['dt_txt'];
        date_time4=decodedData['list'][4]['dt_txt'];
        date_time5=decodedData['list'][5]['dt_txt'];

        date1 = DateFormat("yyyy-MM-dd hh:mm:ss").parse(date_time1);
        date2 = DateFormat("yyyy-MM-dd hh:mm:ss").parse(date_time2);
        date3 = DateFormat("yyyy-MM-dd hh:mm:ss").parse(date_time3);
        date4 = DateFormat("yyyy-MM-dd hh:mm:ss").parse(date_time4);
        date5 = DateFormat("yyyy-MM-dd hh:mm:ss").parse(date_time5);

        dt_sunrise = DateTime.fromMillisecondsSinceEpoch(sunrise);
        dt_sunset = DateTime.fromMillisecondsSinceEpoch(sunset);
      }
    });
  }

}