import "package:custom_map_markers/custom_map_markers.dart";
import "package:flutter/foundation.dart";
import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:google_maps_flutter/google_maps_flutter.dart";
import "package:solideat/common_custom_widgets/colors.dart";
import "package:solideat/custom_widgets/text_field.dart";

// class ChangeAddressScreen extends StatefulWidget {
//   const ChangeAddressScreen({super.key});

//   @override
//   State<ChangeAddressScreen> createState() => _ChangeAddressScreenState();
// }

// class _ChangeAddressScreenState extends State<ChangeAddressScreen> {
//   GoogleMapController? _controller; // Google Map Controller
//   final locations = const LatLng(37.77483, -122.41942); // Default location
//   late List<Marker> markers = <Marker>[]; // List of markers

//   static final CameraPosition _kGooglePlex = CameraPosition(
//     target: const LatLng(37.77483, -122.41942),
//     bearing: 192.8334901395799,
//     zoom: 14.4746,
//   );
//   @override
//   void initState() {
//     super.initState();
//     markers = <Marker>[
//       //different location for restaurant in paris
//       Marker(
//         markerId: const MarkerId("1"),
//         position: const LatLng(48.8566, 2.3522),
//         infoWindow: const InfoWindow(title: "Paris"),
//         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.primaryBackgroundColor,
//         title: const Text(
//           "Change Address",
//           style: TextStyle(
//             color: AppColors.primaryTextColor,
//             fontSize: 20,
//           ),
//         ),
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back,
//             color: AppColors.primaryTextColor,
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//     );
//   }
// }

class ChangeAddressScreen extends StatefulWidget {
  const ChangeAddressScreen({Key? key}) : super(key: key);

  @override
  State<ChangeAddressScreen> createState() => _ChangeAddressScreenState();
}

class _ChangeAddressScreenState extends State<ChangeAddressScreen> {
  GoogleMapController? _controller;

  final locations = const [
    LatLng(37.42796133580664, -122.085749655962),
  ];

  late List<MarkerData> _customMarkers;

  static const CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.151926040649414,
  );

  @override
  void initState() {
    super.initState();
    _customMarkers = [
      MarkerData(
        marker:
            Marker(markerId: const MarkerId('id-1'), position: locations[0]),
        child: _customMarker('Everywhere\nis a Widgets', Colors.blue),
      ),
    ];
  }

  Widget _customMarker(String symbol, Color color) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          Image.asset(
            'assets/app_icons/location_icon.png',
            width: 35,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryBackgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryTextColor,
            size: 25,
          ),
        ),
        centerTitle: false,
        title: const Text(
          "Change Address",
          style: TextStyle(
            color: AppColors.primaryTextColor,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: CustomGoogleMapMarkerBuilder(
        customMarkers: _customMarkers,
        builder: (BuildContext context, Set<Marker>? markers) {
          if (markers == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kLake,
            compassEnabled: false,
            gestureRecognizers: Set()
              ..add(
                Factory<PanGestureRecognizer>(
                  () => PanGestureRecognizer(),
                ),
              ),
            markers: markers,
            onMapCreated: (GoogleMapController controller) {
              _controller = _controller;
            },
          );
        },
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: SafeArea(
      //     child: Column(
      //       mainAxisSize: MainAxisSize.min,
      //       children: [
      //         const Padding(
      //           padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      //           child: RoundTextfield(
      //             hintText: "Search Address",
      //             left: Icon(Icons.search, color: AppColors.primaryTextColor),
      //           ),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 25),
      //           child: Row(
      //             children: [
      //               Image.asset('assets/app_icons/heart_clicked_icon.png',
      //                   width: 35, height: 35),
      //               const SizedBox(width: 8),
      //               const Expanded(
      //                 child: Text(
      //                   "Choose a saved place",
      //                   style: TextStyle(
      //                     color: AppColors.primaryTextColor,
      //                     fontSize: 14,
      //                     fontWeight: FontWeight.w600,
      //                   ),
      //                 ),
      //               ),
      //               Image.asset(
      //                 'assets/images/next_icon.png',
      //                 width: 15,
      //                 height: 15,
      //                 color: AppColors.primaryTextColor,
      //               ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
