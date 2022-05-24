import 'dart:developer';

import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@singleton
class BarcodeRepository {
  final http.Client client;
  static const String _baseUrl = 'https://barcode-list.ru/barcode/RU/%D0%9F%D0%BE%D0%B8%D1%81%D0%BA.htm?barcode=';

  const BarcodeRepository(this.client);

  Future<String?> resolveBarcode(String? barcode) async {
    if (barcode == null) {
      return null;
    }

    log('aslahsja: ${_baseUrl + barcode}');
    log('aslahsja: ${Uri.parse(_baseUrl + barcode)}');
    final response = await client.get(
      Uri.parse(_baseUrl + barcode),
      headers: {
        'Accept':
            'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
      },
    );

    return parse(response.body).querySelector('.randomBarcodes')?.querySelectorAll('td')[2].text.trim();
  }
}
