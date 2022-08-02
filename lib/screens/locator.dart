import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:vishal_mega_mart_app/screens/categoryss.dart';
import 'package:vishal_mega_mart_app/screens/home.dart';
import 'dart:async';

import 'package:vishal_mega_mart_app/screens/homePage.dart';

class CurrentLocation extends StatefulWidget {
  const CurrentLocation({Key? key}) : super(key: key);

  @override
  State<CurrentLocation> createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  late Position position;
  String long = "", lat = "";
  late StreamSubscription<Position> positionStream;

  @override
  void initState() {
    checkGps();
    super.initState();
  }

  checkGps() async {
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if (servicestatus) {
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
        } else if (permission == LocationPermission.deniedForever) {
          print("'Location permissions are permanently denied");
        } else {
          haspermission = true;
        }
      } else {
        haspermission = true;
      }

      if (haspermission) {
        setState(() {
          //refresh the UI
        });

        getLocation();
      }
    } else {
      print("GPS Service is not enabled, turn on GPS location");
    }

    setState(() {
      //refresh the UI
    });
  }

  getLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.longitude); //Output: 80.24599079
    print(position.latitude); //Output: 29.6593457

    long = position.longitude.toString();
    lat = position.latitude.toString();

    setState(() {
      //refresh UI
    });

    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high, //accuracy of the location data
      distanceFilter: 100, //minimum distance (measured in meters) a
      //device must move horizontally before an update event is generated;
    );

    StreamSubscription<Position> positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position position) {
      print(position.longitude); //Output: 80.24599079
      print(position.latitude); //Output: 29.6593457

      long = position.longitude.toString();
      lat = position.latitude.toString();

      setState(() {
        //refresh UI on update
      });
    });
  }

  // Future<dynamic> location = checkPermission();

  // Future<dynamic> getpermission = getPermission();
  // Future<dynamic> getlocation = getLocation();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text("Get GPS Location"), backgroundColor: Colors.blue),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            Text(servicestatus ? "GPS is Enabled" : "GPS is disabled."),
            Text(haspermission ? "GPS is Enabled" : "GPS is disabled."),
            Text(
              "Longitude: $long",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Latitude: $lat",
              style: TextStyle(fontSize: 20),
            ),
            // FloatingActionButton(
            //   onPressed: (() {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => const HomePage()),
            //     );
            //   }),
            // )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
          );
        }),
        child: const Icon(Icons.add),
      ),
    );
  }
}

// checkPermission() async {
//   bool servicestatus = await Geolocator.isLocationServiceEnabled();

//   if (servicestatus) {
//     print("+++++++++GPS service is enabled++++++++++++++++");
//   } else {
//     print("==================GPS service is disabled.=====================");
//   }
//   return;
// }

// getLocation() async {
//   Position position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high);
//   print("========= LATTITUDE =========");
//   print(position.longitude); //Output: 80.24599079
//   print("========= LONGITUDE =========");
//   print(position.latitude); //Output: 29.6593457

//   String long = position.longitude.toString();
//   String lat = position.latitude.toString();
//   List<String> intArr = [long, lat];
//   print(intArr);
//   return intArr;
// }

// getPermission() async {
//   LocationPermission permission = await Geolocator.checkPermission();

//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       print('Location permissions are denied');
//     } else if (permission == LocationPermission.deniedForever) {
//       print("'Location permissions are permanently denied");
//     } else {
//       print("GPS Location service is granted");
//     }
//   } else {
//     print("+++++++++GPS Location permission granted.+++++++++++");
//   }

//   return;
// }

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//      return MaterialApp(
//          home: Home()
//       );
//   }
// }

// class Home extends  StatefulWidget {
//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {

//   bool servicestatus = false;
//   bool haspermission = false;
//   late LocationPermission permission;
//   late Position position;
//        String long = "", lat = "";
//   late StreamSubscription<Position> positionStream;

//    @override
//   void initState() {
//     checkGps();
//     super.initState();
//   }

//   checkGps() async {
//       servicestatus = await Geolocator.isLocationServiceEnabled();
//       if(servicestatus){
//             permission = await Geolocator.checkPermission();

//             if (permission == LocationPermission.denied) {
//                 permission = await Geolocator.requestPermission();
//                 if (permission == LocationPermission.denied) {
//                     print('Location permissions are denied');
//                 }else if(permission == LocationPermission.deniedForever){
//                     print("'Location permissions are permanently denied");
//                 }else{
//                    haspermission = true;
//                 }
//             }else{
//                haspermission = true;
//             }

//             if(haspermission){
//                 setState(() {
//                   //refresh the UI
//                 });

//                 getLocation();
//             }
//       }else{
//         print("GPS Service is not enabled, turn on GPS location");
//       }

//       setState(() {
//          //refresh the UI
//       });
//   }

//   getLocation() async {
//       position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//       print(position.longitude); //Output: 80.24599079
//       print(position.latitude); //Output: 29.6593457

//       long = position.longitude.toString();
//       lat = position.latitude.toString();

//       setState(() {
//          //refresh UI
//       });

//       LocationSettings locationSettings = LocationSettings(
//             accuracy: LocationAccuracy.high, //accuracy of the location data
//             distanceFilter: 100, //minimum distance (measured in meters) a
//                                  //device must move horizontally before an update event is generated;
//       );

//       StreamSubscription<Position> positionStream = Geolocator.getPositionStream(
//             locationSettings: locationSettings).listen((Position position) {
//             print(position.longitude); //Output: 80.24599079
//             print(position.latitude); //Output: 29.6593457

//             long = position.longitude.toString();
//             lat = position.latitude.toString();

//             setState(() {
//               //refresh UI on update
//             });
//       });
//   }

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//          appBar: AppBar(
//             title: Text("Get GPS Location"),
//             backgroundColor: Colors.redAccent
//          ),
//           body: Container(
//             alignment: Alignment.center,
//             padding: EdgeInsets.all(50),
//              child: Column(
//                 children: [

//                      Text(servicestatus? "GPS is Enabled": "GPS is disabled."),
//                      Text(haspermission? "GPS is Enabled": "GPS is disabled."),

//                      Text("Longitude: $long", style:TextStyle(fontSize: 20)),
//                      Text("Latitude: $lat", style: TextStyle(fontSize: 20),)

//                 ]
//               )
//           )
//     );
//   }
// }
