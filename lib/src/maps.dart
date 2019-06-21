import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_google_places/flutter_google_places.dart';


class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {

  static const LatLng _center = LatLng(36.079792, 129.395353);
  final Set<Marker> _marks = Set();
  final key = new GlobalKey<ScaffoldState>();


  GoogleMapController mapController;
  double lat,lng;
  String searchAddr;
  Marker marker = Marker();
  LatLng _lastMapPosition = _center;

  TextEditingController _searchQuery = new TextEditingController();


  Widget _googleMap(BuildContext context) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.4,
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: GoogleMap(
        onCameraMove: _onCameraMove,
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(target: _center, zoom: 12),
        onMapCreated: onMapCreated,
        markers: _marks,
        myLocationButtonEnabled: false,
      ),
    );
  }



  Widget _serchLocation() {
    return Container(
      child: TextField(
          onChanged: (val) {
            setState(() {
              searchAddr = val;
            });
          },
          controller: _searchQuery,
          decoration: InputDecoration(
            suffixIcon: Padding(
                padding: EdgeInsets.all(0),
                child: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: searchandNavigate)),
          )),
    );
  }

  searchandNavigate() async{

    _marks.clear();

    List<Placemark> placemark = await Geolocator().placemarkFromAddress(searchAddr);
    lat = placemark[0].position.latitude;
    lng = placemark[0].position.longitude;


    mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(
                lat,
                lng),
            zoom: 18.5)));
    _marks.add(
        Marker(
          markerId: MarkerId("aaa"),
          icon: BitmapDescriptor.defaultMarker,
          position: LatLng(lat,lng),
          draggable: true,
        ));
    setState(() {

    });

  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _title(),
            _serchLocation(),
            SizedBox(height: 10,),
            _googleMap(context),

          ],
        ),
      ),
    );
  }

  void onMapCreated(controller){
    setState(() {
      mapController = controller;
    });
  }

  Widget _title(){
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1),
      child: Text(
        "시설의 위치를 읍/면/동 기준으로 등록해 주세요",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }





}
