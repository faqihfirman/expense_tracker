import 'package:intl/intl.dart';

String formatRupiah(double jumlah) {
  final formatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );
  return formatter.format(jumlah);
}
