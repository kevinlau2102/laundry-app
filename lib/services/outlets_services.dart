import 'package:laundry_app/entities/outlets.dart';

class OutletsServices {
  List<Outlets> getOutlets() {
    return [
      Outlets(
          id: 1,
          name: "Sorcha Laundry Batununggal",
          rating: 4.9,
          description: "Sorcha Laundry adalah layanan jasa laundry kiloan, satuan, sepatu, tas, baby stroller, karpet, dan lainnya. kami juga menerima layanan pickup delivery atau antar jemput melalui Website atau WhatsApp.",
          imageUrl: "ads2.png",
          address: "Jl. Suka Ati Raya No.14, Pasirluyu, Kec. Regol, Kota Bandung, Jawa Barat 40254",
          latitude: -6.951921466589942,
          longitude: 107.62153278718431,
          phone: "+6281111112731",
          categories:"Washing, Drying, Ironing"),
      Outlets(
          id: 2,
          name: "LaundryKlin Cihampelas",
          rating: 4.8,
          description: "LaundryKlin Cihampelas merupakan bagian dari jaringan LaundryKlin yang sudah tersebar di 35+ Kota di Indonesia dengan 140+ cabang. LaundryKlin Cihampelas melayani Laundry Kiloan, Premium Satuan, Bed Cover, Sepatu, Tas, Baby Stroller, dan lain-lain. \nKami pun menyediakan layanan Antar Jemput untuk memudahkan pelanggan dalam mendapatkan layanan laundry regular dan express.",
          imageUrl: "ads2.png",
          address: "Jl. Cihampelas No.193 A, Cipaganti, Kecamatan Coblong, Kota Bandung, Jawa Barat 40131",
          latitude: -6.887972882886675,
          longitude:  107.60381002330868,
          phone: "+6281221622021",
          categories: "Washing, Drying"),
      Outlets(
          id: 3,
          name: "Amala Express Laundry & Wet Cleaning",
          rating: 4.7,
          description: "Layanan laundry kami bukan hanya mencuci dan mengeringkan pakaian Anda, kami juga memberikan nilai lebih berupa keluangan waktu bagi Anda untuk beraktivitas tanpa harus menunggu cucian. Dengan menggunakan teknik spotting mendetail membuat pakaian Anda lebih bersih, dengan wangi yang melekat sepanjang hari.",
          imageUrl: "ads2.png",
          address: "Jl. Merdeka No.25 - 27, Babakan Ciamis, Kec. Sumur Bandung, Kota Bandung, Jawa Barat 40117",
          latitude: -6.909296174539381, 
          longitude:  107.61039602330867,
          phone: "+6281908196626",
          categories: "Washing, Drying"),
      Outlets(
          id: 4,
          name: "Laundry Express Bandung",
          rating: 4.6,
          description: "Lorem Ipsum Dolor Sit Amet",
          imageUrl: "ads2.png",
          address: "Jl. Pasundan No.58, Balonggede, Kec. Regol, Kota Bandung, Jawa Barat 40251",
          latitude: -6.9254447252785765,
          longitude:  107.60868086502501,
          phone: "+6285172488338",
          categories:"Washing, Drying, Ironing"),
    ];
  }
}
