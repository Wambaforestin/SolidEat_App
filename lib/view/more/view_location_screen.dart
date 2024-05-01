import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

// Define custom colors
const Color primaryColor = Color(0xFFF9A11B); // Orange color
const Color secondaryColor = Color(0xFFFFFFFF); // White color

class ViewlocationScreen extends StatefulWidget {
  const ViewlocationScreen({super.key});

  @override
  State<ViewlocationScreen> createState() => _ViewlocationScreenState();
}

class _ViewlocationScreenState extends State<ViewlocationScreen> {
  MapController controller = MapController(
    initPosition: GeoPoint(
        latitude: 48.982403,
        longitude: 2.231202), // Coordinates of 55 Rue de Paris, Franconville
    areaLimit: BoundingBox(
      east: 2.4699,
      north: 48.9021,
      south: 48.8156,
      west: 2.2241,
    ),
  );

  @override
  void initState() {
    super.initState();
    addMarker();
  }

  void addMarker() async {
    await controller.addMarker(
      GeoPoint(
        latitude: 48.982403,
        longitude: 2.231202,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Voir les restaurants à proximité',
          style: TextStyle(color: secondaryColor, fontSize: 22),
        ),
        backgroundColor: primaryColor,
      ),
      body: OSMFlutter(
        controller: controller,
        osmOption: OSMOption(
          userTrackingOption: const UserTrackingOption(
            enableTracking: true,
            unFollowUser: false,
          ),
          zoomOption: const ZoomOption(
            initZoom: 20, // Increased zoom level
            minZoomLevel: 12, // Adjusted minimum zoom level
            maxZoomLevel: 18, // Adjusted maximum zoom level
            stepZoom: 1.0,
          ),
          userLocationMarker: UserLocationMaker(
            personMarker: const MarkerIcon(
              icon: Icon(
                Icons.location_history_rounded,
                color: primaryColor,
                size: 48,
              ),
            ),
            directionArrowMarker: const MarkerIcon(
              icon: Icon(
                Icons.double_arrow,
                size: 48,
              ),
            ),
          ),
          roadConfiguration: const RoadOption(
            roadColor: primaryColor,
          ),
          markerOption: MarkerOption(
            defaultMarker: const MarkerIcon(
              icon: Icon(
                Icons.person_pin_circle,
                color: primaryColor,
                size: 56,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
