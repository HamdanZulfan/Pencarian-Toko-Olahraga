class RekomendasiModel {
  final int id;
  final String imageUrl;
  final String nama;
  final String kota;
  final String informasi;
  final String imageUrl1;
  final String imageUrl2;
  final String imageUrl3;
  final String lokasi;
  final String kontak;
  final String kontakphone;
  final String mapurl;
  final double rating;

  RekomendasiModel({
    required this.id,
    required this.nama,
    required this.informasi, 
    required this.imageUrl,
    required this.imageUrl1, 
    required this.imageUrl2,
    required this.imageUrl3,  
    required this.kontak,
    required this.kontakphone,
    required this.lokasi,
    required this.mapurl, 
    required this.kota,
    this.rating = 0.0,
  });
}