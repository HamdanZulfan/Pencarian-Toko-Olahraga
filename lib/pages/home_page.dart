import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sport/models/daftartoko_model.dart';
import 'package:sport/models/rekomendasi_model.dart';
import 'package:sport/pages/maps_page.dart';
import 'package:sport/pages/tentang_page.dart';
import 'package:sport/pages/tips_page.dart';
import 'package:sport/theme.dart';
import 'package:sport/widget/about.dart';
import 'package:sport/widget/daftar_toko.dart';
import 'package:sport/widget/lokasi.dart';
import 'package:sport/widget/rekomendasi_card.dart';
import 'package:sport/widget/tips.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference rekomendasitoko =
        firestore.collection('rekomendasitoko');
    CollectionReference daftartoko = firestore.collection('daftartoko');

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: edge,
          ),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: edge,
                ),
                child: Text(
                  'Hallo Sobat Olahraga',
                  style: blackTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: semiBold,
                  ),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Ayo Cari Toko Olahraga Favoritemu',
                  style: greyTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: light,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Rekomendasi',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: regular,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    Column(
                      children: [
                        StreamBuilder<QuerySnapshot>(
                            stream: rekomendasitoko
                                .orderBy('id', descending: false)
                                .snapshots(),
                            builder: (_, snapshot) {
                              if (snapshot.hasData) {
                                return Row(
                                  children: (snapshot.data!)
                                      .docs
                                      .map(
                                        (e) => RekomendasiCard(
                                          RekomendasiModel(
                                            id: e['id'],
                                            nama: e['nama'],
                                            imageUrl: e['imageUrl'],
                                            kota: e['kota'],
                                            rating: e['rating'],
                                            imageUrl1: e['imageUrl1'],
                                            imageUrl2: e['imageUrl2'],
                                            imageUrl3: e['imageUrl3'],
                                            informasi: e['informasi'],
                                            kontak: e['kontak'],
                                            kontakphone: e['kontakphone'],
                                            mapurl: e['mapurl'],
                                            lokasi: e['lokasi'],
                                          ),
                                        ),
                                      )
                                      .toList(),
                                );
                              } else {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Daftar Toko',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: regular,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream:
                      daftartoko.orderBy('id', descending: false).snapshots(),
                  builder: (_, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: (snapshot.data!)
                            .docs
                            .map(
                              (e) => DaftarToko(
                                DaftarTokoModel(
                                  id: e['id'],
                                  nama: e['nama'],
                                  imageUrl: e['imageUrl'],
                                  kota: e['kota'],
                                  rating: e['rating'],
                                  imageUrl1: e['imageUrl1'],
                                  imageUrl2: e['imageUrl2'],
                                  imageUrl3: e['imageUrl3'],
                                  informasi: e['informasi'],
                                  kontak: e['kontak'],
                                  kontakphone: e['kontakphone'],
                                  mapurl: e['mapurl'],
                                  lokasi: e['lokasi'],
                                ),
                              ),
                            )
                            .toList(),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Lokasi Toko Olahraga',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: regular,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MapsPage(),
                    ),
                  );
                },
                child: Column(
                  children: const [
                    Lokasi(),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Tips & Tentang',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: regular,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TipsPage(),
                    ),
                  );
                },
                child: Column(
                  children: const [
                    Tips(),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TentangPage(),
                    ),
                  );
                },
                child: Column(
                  children: const [
                    About(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
