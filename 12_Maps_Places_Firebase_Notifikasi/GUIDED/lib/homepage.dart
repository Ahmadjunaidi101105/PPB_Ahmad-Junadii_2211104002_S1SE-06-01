import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

class MapsScreen extends StatefulWidget {
  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  static final LatLng _kMapCenter = LatLng(-7.4347652, 109.2500561);
  static final CameraPosition _kInitialPosition = CameraPosition(
    target: _kMapCenter,
    zoom: 11.0,
  );

  late GoogleMapController _mapController;
  LatLng? _pickedLocation;
  final _places =
      GoogleMapsPlaces(apiKey: "AIzaSyACZqm7h0T1hGj2ZW0e54UwjsW9cQwZ09M");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps Place Picker'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _kInitialPosition,
            onMapCreated: (GoogleMapController controller) {
              _mapController = controller;
            },
            myLocationEnabled: true,
            onTap: _onMapTapped,
          ),
          if (_pickedLocation != null)
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selected Location:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      FutureBuilder<PlacesSearchResponse>(
                        future: _getPlaceDetails(_pickedLocation!),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text('Loading...');
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (!snapshot.hasData ||
                              snapshot.data!.results.isEmpty) {
                            return Text('No information available.');
                          } else {
                            final place = snapshot.data!.results.first;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Name: ${place.name}'),
                                Text('Address: ${place.formattedAddress}'),
                              ],
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _onMapTapped(LatLng position) {
    setState(() {
      _pickedLocation = position;
    });
  }

  Future<PlacesSearchResponse> _getPlaceDetails(LatLng position) async {
    final response = await _places.searchNearbyWithRadius(
      Location(lat: position.latitude, lng: position.longitude),
      50, // Search within a 50-meter radius
    );
    return response;
  }
}
