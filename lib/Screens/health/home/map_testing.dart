import 'dart:async';
import 'package:flutter_svg/svg.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:md_health/Screens/health/home/controller/home_controller.dart';
import 'package:md_health/widget/buttons.dart';
import 'package:provider/provider.dart';

class MapScreenView extends StatefulWidget {
  final bool isLocationEnabled;
  final bool initialMapView;
  final LatLng latLng;
  const MapScreenView(
      {Key? key,
      required this.isLocationEnabled,
      required this.initialMapView,
      required this.latLng})
      : super(key: key);

  @override
  State<MapScreenView> createState() => _MapScreenViewState();
}

class _MapScreenViewState extends State<MapScreenView> {
  //get MapView controller to access MapView
  final Completer<GoogleMapController> _googleMapViewController = Completer();
  CameraPosition? _cameraPosition;
  late LatLng _defaultLatLng;
  late LatLng _draggedLatlng;
  final String _draggedAddress = "";
  TextEditingController searchController = TextEditingController();
  bool isLocationEnabledByUser = false;

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() {
    final watch = Provider.of<HomeViewController>(context, listen: false);
    //set default latlng for camera position
    _defaultLatLng = widget.latLng;
    _draggedLatlng = _defaultLatLng;
    _cameraPosition = CameraPosition(
        target: _defaultLatLng, zoom: 13.5 // number of MapView view
        );
    isLocationEnabledByUser = widget.isLocationEnabled;
    print(widget.isLocationEnabled);
    print(widget.initialMapView);
    print("00000000");
    if (widget.isLocationEnabled && widget.initialMapView) {
      _gotoUserCurrentPosition();
    }

    //MapView will redirect to my current location when loaded

    print("zzzzzzz");
    print(isLocationEnabledByUser);
  }

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<HomeViewController>();
    final read = context.read<HomeViewController>();
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(height: 400.w, child: _buildBody()),
          !isLocationEnabledByUser
              ? Container(
                  height: 0,
                )
              : Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Visibility(
                    visible: watch.locationNotFound,
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 15.w, bottom: 15.w, left: 10.w, right: 10.w),
                      margin: EdgeInsets.only(
                          bottom: 10.w, left: 10.w, right: 10.w),
                      color: Colors.red,
                      width: ScreenUtil().screenWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              watch.locationErrorMessage,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14.sp),
                            ),
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  read.onDismissTaped();
                                },
                                child: Text(
                                  "Dismiss",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14.sp),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
        ],
      ),
    );

    //   Scaffold(
    //   body:
    //   //get a float button to click and go to current location
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: () {
    //       _gotoUserCurrentPosition();
    //     },
    //     child: Icon(Icons.location_on),
    //   ),
    // );
  }

  Widget _buildBody() {
    return Stack(clipBehavior: Clip.none, children: [
      _getMapView(),
      _getCustomPin(),
      _showSearchBox(),
      !isLocationEnabledByUser
          ? Positioned(
              bottom: 0.w,
              left: 0.w,
              right: 0.w,
              child: _locationEnabled(),
            )
          : Container(),
    ]);
  }

  Widget _locationEnabled() {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          blurRadius: 15.w,
          spreadRadius: 20.w,
          color: Colors.white.withOpacity(0.9),
          offset: const Offset(0, 0),
        ),
      ]),
      child: Column(
        children: [
          SizedBox(
            height: 10.w,
          ),
          Text(
            "Enable your location",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(
            height: 15.w,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: PrimaryButton(
                color: const Color(0xff2388FF),
                onTap: () {
                  _defaultLatLng = const LatLng(18.5695447, 73.8794143);
                  _draggedLatlng = _defaultLatLng;
                  _cameraPosition = CameraPosition(
                      target: _defaultLatLng,
                      zoom: 13.5 // number of MapView view
                      );
                  _gotoUserCurrentPosition();
                },
                text: "Allow while using this app",
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
                height: 40.w),
          ),
          SizedBox(
            height: 36.w,
          ),
        ],
      ),
    );
  }

  Widget _showDraggedAddress() {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60.w,
        decoration: const BoxDecoration(
          color: Colors.blue,
        ),
        child: Center(
            child: Text(
          _draggedAddress,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        )),
      ),
    );
  }

  Widget _showSearchBox() {
    final read = Provider.of<HomeViewController>(context, listen: false);
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 5.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 16.w,
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 5.w, left: 16.w, right: 0.w),
                  width: MediaQuery.of(context).size.width,
                  height: 48.w,
                  child: Container(
                    child: GooglePlaceAutoCompleteTextField(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 14.sp),
                        textEditingController: searchController,
                        googleAPIKey: "AIzaSyCzD-nk2PWaju4A9AgRE3Nfu4hrdNf3fMs",
                        inputDecoration: InputDecoration(
                          hintText: "Search location",
                          hintStyle: TextStyle(
                            fontSize: 14.sp,
                            color: const Color(0xffB7B7B7),
                            fontWeight: FontWeight.w400,
                          ),
                          prefixIcon: SizedBox(
                            height: 13.3.w,
                            width: 13.3.w,
                            child: Center(
                                child: Container(
                              child: IconButton(
                                icon: SvgPicture.asset(
                                  'assets/icons/search.svg',
                                  // alignment: Alignment.topRight,
                                ),
                                //  SvgPicture.asset(
                                //   'assets/icons/search.svg',
                                //   width: 15.w,
                                //   height: 15.h,
                                // ),
                                onPressed: () {
                                  // Perform the search here
                                },
                              ),
                            )),
                          ),
                          // contentPadding: EdgeInsets.only(left: 10.w),
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xffE4E4E4),
                            ),
                            // borderRadius: BorderRadius.circular(3),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xffE4E4E4),
                            ),
                            // borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                        debounceTime: 0, // default 600 ms,
                        countries: const [
                          "in",
                          "fr"
                        ], // optional by default null is set
                        isLatLngRequired:
                            true, // if you required coordinates from place detail
                        getPlaceDetailWithLatLng: (prediction) {
                          _gotoSpecificPosition(LatLng(
                              double.parse(prediction.lat.toString()),
                              double.parse(prediction.lng.toString())));

                          // this method will return latlng with place detail
                          print("placeDetails${prediction.lng}");
                        }, // this callback is called when isLatLngRequired is true
                        itemClick: (Prediction prediction) {
                          searchController.text =
                              prediction.description.toString();
                          searchController.selection =
                              TextSelection.fromPosition(TextPosition(
                                  offset: prediction.description!.length));
                        }),
                  ),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  // read.onMapCloseBtnPressed(context);
                },
                // child:
                // Container(
                //   height: 30.w,
                //   width: 30.w,
                //   decoration: BoxDecoration(
                //     shape: BoxShape.circle,
                //     color: Colors.black,
                //   ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/map_c.svg',
                    height: 30.w,
                    width: 30.w,
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _getMapView() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.w), topLeft: Radius.circular(30.w)),
      child: GoogleMap(
        initialCameraPosition:
            _cameraPosition!, //initialize camera position for MapView
        mapType: MapType.normal,
        onCameraIdle: () {
          //this function will trigger when user stop dragging on MapView
          //every time user drag and stop it will display address
          _getAddress(_draggedLatlng);
        },
        onCameraMove: (cameraPosition) {
          //this function will trigger when user keep dragging on MapView
          //every time user drag this will get value of latlng
          _draggedLatlng = cameraPosition.target;
          print(_draggedLatlng);
        },
        onMapCreated: (GoogleMapController controller) {
          //this function will trigger when MapView is fully loaded
          if (!_googleMapViewController.isCompleted) {
            //set controller to google MapView when it is fully loaded
            _googleMapViewController.complete(controller);
          }
        },
      ),
    );
  }

  Widget _getCustomPin() {
    return Center(
        child: SizedBox(
            width: 61.w,
            height: 61.w,
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/map navigation.svg',
                // color: Colors.red,
                // alignment: Alignment.topRight,
              ),
            )));
  }

  Future _getAddress(LatLng position) async {
    print("hellooooooo");
    final read = Provider.of<HomeViewController>(context, listen: false);
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark address = placemarks[0]; // get only first and closest address
    String addresStr =
        "${address.street}, ${address.locality}, ${address.postalCode}, ${address.country}";
  }

  //get user's current location and set the MapView's camera to that location
  Future _gotoUserCurrentPosition() async {
    Position currentPosition = await _determineUserCurrentPosition();
    _gotoSpecificPosition(
        LatLng(currentPosition.latitude, currentPosition.longitude));
    isLocationEnabledByUser = true;
  }

  Future _gotoSpecificPosition(LatLng position) async {
    GoogleMapController MapViewController =
        await _googleMapViewController.future;
    MapViewController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: position, zoom: 13.5)));
    setState(() {
      isLocationEnabledByUser = true;
    });
    //every time that we dragged pin , it will list down the address here
    await _getAddress(position);
  }

  Future _determineUserCurrentPosition() async {
    LocationPermission locationPermission;
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    //check if user enable service for location permission
    if (!isLocationServiceEnabled) {
      print("user don't enable location permission");
    }

    locationPermission = await Geolocator.checkPermission();

    //check if user denied location and retry requesting for permission
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        print("user denied location permission");
      }
    }

    //check if user denied permission forever
    if (locationPermission == LocationPermission.deniedForever) {
      print("user denied permission forever");
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  }
}
