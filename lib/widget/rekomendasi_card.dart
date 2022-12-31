import 'package:flutter/material.dart';
import 'package:sport/models/rekomendasi_model.dart';
import 'package:sport/widget/detail.dart';

import '../theme.dart';

class RekomendasiCard extends StatelessWidget {
  final RekomendasiModel rekomendasi;
  const RekomendasiCard(this.rekomendasi, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detail(
                rekomendasi.id,
                rekomendasi.imageUrl,
                rekomendasi.nama,
                rekomendasi.kota,
                rekomendasi.informasi,
                rekomendasi.imageUrl1,
                rekomendasi.imageUrl2,
                rekomendasi.imageUrl3,
                rekomendasi.kontak,
                rekomendasi.kontakphone,
                rekomendasi.lokasi,
                rekomendasi.mapurl,
                rekomendasi.rating),
          ),
        );
      },
      child: Container(
        width: 150,
        height: 220,
        margin: EdgeInsets.only(
          left: edge,
        ),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: kWhiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 135,
              height: 135,
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  image: NetworkImage(
                    rekomendasi.imageUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 52,
                  height: 28,
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(18),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        margin: const EdgeInsets.only(right: 3),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/icon_star.png',
                            ),
                          ),
                        ),
                      ),
                      Text(
                        rekomendasi.rating.toString(),
                        style: blackTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    rekomendasi.nama,
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    rekomendasi.kota,
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
