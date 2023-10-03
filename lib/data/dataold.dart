import 'package:newstech/model/news.dart';

class DataOldApi {
  List<NewsModel> valueOld() {
    List<NewsModel> old = List.generate(2, (index) {
      return NewsModel(
        title: "",
        description: "",
        image_url: "",
        link: "",
      );
    });

    old[0] = NewsModel(
      title: "Bos Capcom Bilang Harga Game Sekarang Terlalu Murah, Padahal...",
      description:
          "Haruhiro Tsujimoto, Presiden Capcom, mengklaim harga video game saat ini terlalu murah. Padahal menurutnya, untuk biaya pembuatannya terbilang sangat mahal.",
      image_url:
          "https://images.unsplash.com/photo-1585829365295-ab7cd400c167?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80",
      link:
          "https://inet.detik.com/games-news/d-6961108/bos-capcom-bilang-harga-game-sekarang-terlalu-murah-padahal",
    );

    old[1] = NewsModel(
      title:
          "Hari Batik Nasional 2023, Pencarian di Google Soal Sejarah Hari Batik Naik 250 Persen",
      description:
          "Seiring dengan peringatan Hari Batik Nasional, Google mengungkap pencarian di Google mengenai Sejarah Hari Batik meningkat lebih dari 250 persen dibandingkan tahun 2021.",
      image_url:
          "https://cdn0-production-images-kly.akamaized.net/oTbEpwU-_q3MWvgHSK6CjFO5hsk=/673x379/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/4595864/original/097319300_1696252475-Temukan_informasi_seputar_Hari_Batik_Nasional_lewat_Google_Search.jpg",
      link:
          "https://www.liputan6.com/tekno/read/5412752/hari-batik-nasional-2023-pencarian-di-google-soal-sejarah-hari-batik-naik-250-persen",
    );

    return old;
  }
}
