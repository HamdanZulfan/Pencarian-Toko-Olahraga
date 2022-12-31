import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sport/theme.dart';

class Detail extends StatefulWidget {
  int id;
  String imageUrl;
  String nama;
  String kota;
  String informasi;
  String imageUrl1;
  String imageUrl2;
  String imageUrl3;
  String lokasi;
  String kontak;
  String kontakphone;
  String mapurl;
  double rating;

  Detail(
      this.id,
      this.imageUrl,
      this.nama,
      this.kota,
      this.informasi,
      this.imageUrl1,
      this.imageUrl2,
      this.imageUrl3,
      this.kontak,
      this.kontakphone,
      this.lokasi,
      this.mapurl,
      this.rating,
      {Key? key})
      : super(key: key);

  @override
  State<Detail> createState() => _DetailState(
      id,
      imageUrl,
      nama,
      kota,
      informasi,
      imageUrl1,
      imageUrl2,
      imageUrl3,
      kontak,
      kontakphone,
      lokasi,
      mapurl,
      rating);
}

class _DetailState extends State<Detail> {
  final int _id;
  final String _imageUrl;
  final String _nama;
  final String _kota;
  final String _infomasi;
  final String _imageUrl1;
  final String _imageUrl2;
  final String _imageUrl3;
  final String _lokasi;
  final String _kontak;
  final String _kontakphone;
  final String _mapurl;
  final double _rating;

  _DetailState(
    this._id,
    this._imageUrl,
    this._nama,
    this._kota,
    this._infomasi,
    this._imageUrl1,
    this._imageUrl2,
    this._imageUrl3,
    this._kontak,
    this._kontakphone,
    this._lokasi,
    this._mapurl,
    this._rating,
  );

  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        throw (url);
      }
    }

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              _imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                const SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: kWhiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _nama,
                                  style: blackTextStyle.copyWith(
                                    fontSize: 22,
                                    fontWeight: medium,
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  _kota,
                                  style: greyTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: light,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  margin: const EdgeInsets.only(right: 3),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/star.png',
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  _rating.toString(),
                                  style: blackTextStyle.copyWith(
                                    fontSize: 20,
                                    fontWeight: medium,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Informasi',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: regular,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: edge, right: edge),
                        child: Text(
                          _infomasi,
                          style: greyTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: regular,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Photo',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: regular,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        height: 88,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            const SizedBox(
                              width: 24,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                18,
                              ),
                              child: Image.network(
                                _imageUrl1,
                                width: 110,
                                height: 88,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                18,
                              ),
                              child: Image.network(
                                _imageUrl2,
                                width: 110,
                                height: 88,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                18,
                              ),
                              child: Image.network(
                                _imageUrl3,
                                width: 110,
                                height: 88,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Lokasi',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: regular,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _lokasi,
                              style: greyTextStyle,
                            ),
                            InkWell(
                              onTap: () {
                                launchUrl(_mapurl);
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                    'assets/images/map1.png',
                                  )),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Kontak',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: regular,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _kontak,
                              style: greyTextStyle,
                            ),
                            InkWell(
                              onTap: () {
                                launchUrl(_kontakphone);
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                    'assets/images/phone-call.png',
                                  )),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
