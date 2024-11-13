import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:md_health/Screens/food/diet_plan/controller/diet_plan_controller.dart';
import 'package:provider/provider.dart';

class LocationBottomSheet extends StatelessWidget {
  const LocationBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final read = Provider.of<DietPlanController>(context);

    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search for a location',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onSubmitted: (value) async {
                    await read.searchLocation(value);
                  },
                ),
              ),
              Expanded(
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(28.6139, 77.2088), // Adjust if needed
                    zoom: 3,
                  ),
                  zoomGesturesEnabled: true,
                  scrollGesturesEnabled: true,
                  rotateGesturesEnabled: true,
                  tiltGesturesEnabled: true,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  onMapCreated: (GoogleMapController controller) {
                    read.setMapController(controller);
                    read.initializeUserLocation();
                  },
                  onTap: (LatLng position) async {
                    await read.onMapTap(position);
                  },
                  markers: read.markers,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 250.w,
                      height: 42.h,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.location_on),
                        label:
                            Text(read.currentLocationText ?? "Select Location"),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        read.submit(context);
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Submit',
                        style: GoogleFonts.notoSans(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
