import 'package:flutter/material.dart';
import 'package:sport/models/daftartoko_model.dart';
import 'package:sport/theme.dart';
import 'package:sport/widget/detail.dart';

class DaftarToko extends StatelessWidget {
  final DaftarTokoModel daftartoko;
  const DaftarToko(this.daftartoko, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detail(
                daftartoko.id,
                daftartoko.imageUrl,
                daftartoko.nama,
                daftartoko.kota,
                daftartoko.informasi,
                daftartoko.imageUrl1,
                daftartoko.imageUrl2,
                daftartoko.imageUrl3,
                daftartoko.kontak,
                daftartoko.kontakphone,
                daftartoko.lokasi,
                daftartoko.mapurl,
                daftartoko.rating),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: edge, right: edge, bottom: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              width: 90,
              height: 90,
              margin: const EdgeInsets.only(
                right: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    daftartoko.imageUrl,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    daftartoko.nama,
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    daftartoko.kota,
                    style: greyTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ),
            Row(
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
                  daftartoko.rating.toString(),
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
