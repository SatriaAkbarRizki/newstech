import 'package:newstech/model/news.dart';

class DataOldApi {
  List<NewsModel> valueOld() {
    List<NewsModel> old = List.generate(4, (index) {
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

    old[2] = NewsModel(
        title:
            "Layar iPhone Ternyata Punya Barcode Buat Cegah Kecurangan dari Manufaktur",
        description:
            "Apple ternyata menyematkan barcode berukuran kecil untuk mencegah terjadinya kecurangan oleh manufaktur saat memproduksi layar iPhone.",
        image_url:
            "https://cdn0-production-images-kly.akamaized.net/aPwDTHjiZSiJ6g1YKI4RklFt-Fg=/673x379/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/4037398/original/090314400_1653891333-shutterstock_1552043147.jpg",
        link:
            "https://www.liputan6.com/tekno/read/5412506/layar-iphone-ternyata-punya-barcode-buat-cegah-kecurangan-dari-manufaktur");
    old[3] = NewsModel(
        title:
            "Oppo Find N3 Flip Bakal Rilis di Indonesia, Sudah Mejeng di Situs Resmi",
        description:
            "Situs resmi Oppo Indonesia sudah menunjukkan tanda-tanda yang kuat tentang kehadiran Oppo Find N3 Flip di Tanah Air.",
        image_url:
            "https://cdn0-production-images-kly.akamaized.net/KK6do8lkoA34XBqzj7naNpJg-dU=/87x0:1179x615/673x379/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/4596187/original/095202300_1696298007-page_find_n3_flip.jpg",
        link:
            "https://www.liputan6.com/tekno/read/5412987/oppo-find-n3-flip-bakal-rilis-di-indonesia-sudah-mejeng-di-situs-resmi");

    return old;
  }
}
