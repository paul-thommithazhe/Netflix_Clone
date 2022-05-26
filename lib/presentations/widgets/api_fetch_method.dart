import 'dart:convert';

import 'package:http/http.dart' as http;

apiFetchMethod(String uri)async {
    // var response;
    try {
     
         
      final Uri url = Uri.parse(uri);
      final response = await http.get(url);
      return json.decode(response.body);
    } catch (e) {
      print(e);
    }
  }