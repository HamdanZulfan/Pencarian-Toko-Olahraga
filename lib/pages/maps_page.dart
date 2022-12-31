import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:sport/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({Key? key}) : super(key: key);

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
  }

  double zoomVal = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          _googlemap(context),
          _zoomminusfunction(),
          _zoomplusfunction(),
          _buildContainer(),
        ],
      ),
    ));
  }

  Widget _zoomminusfunction() {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        icon: const Icon(FontAwesomeIcons.magnifyingGlassMinus,
            color: Color(0xff6200ee)),
        onPressed: () {
          zoomVal--;
          _minus(zoomVal);
        },
      ),
    );
  }

  Widget _zoomplusfunction() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
          icon: const Icon(FontAwesomeIcons.magnifyingGlassPlus,
              color: Color(0xff6200ee)),
          onPressed: () {
            zoomVal++;
            _plus(zoomVal);
          }),
    );
  }

  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: const LatLng(-6.381702328216485, 106.78826803934038),
        zoom: zoomVal)));
  }

  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: const LatLng(-6.381702328216485, 106.78826803934038),
        zoom: zoomVal)));
  }

  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        height: 150,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: _boxes(
                'assets/images/topscore.jpg',
                -6.3539303109634595,
                106.83861678111738,
                "Top Score",
                4.9,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: _boxes(
                'assets/images/sportaways.jpeg',
                -6.354278621033257,
                106.84579831638123,
                "Sportaways",
                4.6,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: _boxes('assets/images/DdanD.jpeg', -6.395193951346889,
                  106.79224636090376, "D & D Sport", 4.5),
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: _boxes('assets/images/planetsport.jpeg',
                  -6.372599469025605, 106.83536114991843, "Planet Sports", 4.4),
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: _boxes('assets/images/SportStation.jpg',
                  -6.386836794881331, 106.82679356852567, "Sport Station", 4.4),
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: _boxes(
                'assets/images/necis.jpeg',
                -6.367270877326066,
                106.83412367319077,
                "Necis Sport",
                4.3,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: _boxes(
                'assets/images/hendra.jpeg',
                -6.392573012944876,
                106.8410918163834,
                "Hendra Sport",
                4.3,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: _boxes('assets/images/fisik.jpg', -6.3726529445744005,
                  106.83490712529955, "Fisik Sport", 4.1),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxes(
      String _image, double lat, double long, String tokoName, double rating) {
    return GestureDetector(
      onTap: () {
        _gotoLocation(lat, long);
      },
      child: FittedBox(
        child: Material(
          color: Colors.white,
          elevation: 14,
          borderRadius: BorderRadius.circular(24),
          shadowColor: const Color(0x802196F3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 180,
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage(_image),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: myDetailsContainer(tokoName, rating),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget myDetailsContainer(String tokoName, double rating) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(tokoName,
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: bold,
              )),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              rating.toString(),
              style: blackTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
            const Icon(
              FontAwesomeIcons.solidStar,
              color: Colors.amber,
              size: 15.0,
            ),
            const Icon(
              FontAwesomeIcons.solidStar,
              color: Colors.amber,
              size: 15.0,
            ),
            const Icon(
              FontAwesomeIcons.solidStar,
              color: Colors.amber,
              size: 15.0,
            ),
            const Icon(
              FontAwesomeIcons.solidStar,
              color: Colors.amber,
              size: 15.0,
            ),
            const Icon(
              FontAwesomeIcons.solidStarHalf,
              color: Colors.amber,
              size: 15.0,
            ),
          ],
        )
      ],
    );
  }

  Widget _googlemap(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: const CameraPosition(
            target: LatLng(-6.381702328216485, 106.78826803934038), zoom: 12),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          sportawaysMarker,
          topscoreMarker,
          planetsportsMarker,
          sportsstationMarker,
          necissportMarker,
          fisiksportMarker,
          danddMarker,
          hendrasportMarker,
        },
      ),
    );
  }

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long),
      zoom: 15,
      tilt: 50.0,
      bearing: 45.0,
    )));
  }
}

Marker sportawaysMarker = Marker(
  markerId: const MarkerId('Sportaways'),
  position: const LatLng(-6.354278621033257, 106.84579831638123),
  infoWindow: const InfoWindow(title: 'SportAways'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

Marker topscoreMarker = Marker(
  markerId: const MarkerId('TopScore'),
  position: const LatLng(-6.3539303109634595, 106.83861678111738),
  infoWindow: const InfoWindow(title: 'TopScore'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

Marker planetsportsMarker = Marker(
  markerId: const MarkerId('PlanetSports'),
  position: const LatLng(
    -6.372599469025605,
    106.83536114991843,
  ),
  infoWindow: const InfoWindow(title: 'Planet Sports'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

Marker sportsstationMarker = Marker(
  markerId: const MarkerId('SportsStation'),
  position: const LatLng(
    -6.386836794881331,
    106.82679356852567,
  ),
  infoWindow: const InfoWindow(title: 'Sports Station'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

Marker necissportMarker = Marker(
  markerId: const MarkerId('NecisSports'),
  position: const LatLng(
    -6.367270877326066,
    106.83412367319077,
  ),
  infoWindow: const InfoWindow(title: 'Necis Sports'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

Marker fisiksportMarker = Marker(
  markerId: const MarkerId('FisikSport'),
  position: const LatLng(
    -6.3726529445744005,
    106.83490712529955,
  ),
  infoWindow: const InfoWindow(title: 'Fisik Sport'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

Marker danddMarker = Marker(
  markerId: const MarkerId('D&DSport'),
  position: const LatLng(
    -6.395193951346889,
    106.79224636090376,
  ),
  infoWindow: const InfoWindow(title: 'D & D Sport'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

Marker hendrasportMarker = Marker(
  markerId: const MarkerId('HendraSport'),
  position: const LatLng(
    -6.392573012944876,
    106.8410918163834,
  ),
  infoWindow: const InfoWindow(title: 'Hendra Sport'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
