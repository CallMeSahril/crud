import 'dart:convert';
import 'package:crud/app/core/utils/constants.dart';
import 'package:crud/app/data/entities/item_entities.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ItemRepository {
  final String tableName = "item";

  Future<List<ItemEntities>> getList() async {
    var url = Uri.parse('$baseUrl/$tableName');
    var headers = {'apikey': apiKey, 'Authorization': 'Bearer $apiKey'};

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      if (responseBody is List && responseBody.isNotEmpty) {
        return responseBody.map((e) => ItemEntities.fromJson(e)).toList();
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<ItemEntities> getItemById(int id) async {
    var url = Uri.parse('$baseUrl/$tableName?id=eq.$id');
    var headers = {'apikey': apiKey, 'Authorization': 'Bearer $apiKey'};

    final response = await http.get(url, headers: headers);
    if (kDebugMode) {
      print(response.statusCode);
    }

    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      if (responseBody is List && responseBody.isNotEmpty) {
        // Ambil item pertama dari daftar dan konversikan menjadi ItemEntities
        return ItemEntities.fromJson(responseBody.first);
      } else {
        throw Exception('Item not found');
      }
    } else {
      throw Exception('Failed to load item');
    }
  }

  Future<bool> createItem(String title, String description) async {
    var url = Uri.parse('$baseUrl/$tableName');
    var headers = {
      'apikey': apiKey,
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json'
    };

    // Membuat objek JSON dari parameter title dan description
    var body = jsonEncode({
      "title": title,
      "description": description,
    });

    final response = await http.post(
      url,
      headers: headers,
      body: body, // Mengirimkan body JSON yang telah dibuat
    );

    if (kDebugMode) {
      print(response.statusCode);
    }
    if (response.statusCode == 201) {
      return true; // Berhasil membuat item
    } else {
      throw Exception('Failed to create item');
    }
  }

  Future<bool> updateItem({
    required int id,
    required String title,
    required String description,
  }) async {
    var url = Uri.parse(
        '$baseUrl/$tableName?id=eq.$id'); // Ubah URL untuk menyertakan ID

    var headers = {
      'apikey': apiKey,
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json',
      'Prefer': 'return=minimal', // Untuk mengembalikan objek yang diperbarui
    };
    var updateFields = <String, dynamic>{};
    updateFields['id'] = id;
    updateFields['title'] = title;
    updateFields['description'] = description;

    final response = await http.patch(
      url,
      headers: headers,
      body: jsonEncode(updateFields),
    );
    if (kDebugMode) {
      print("ini update Note ${response.statusCode}");
    }

    return response.statusCode == 204;
  }

  Future<bool> deleteItem(int id) async {
    var url = Uri.parse('$baseUrl/$tableName?select=*&id=eq.$id');
    var headers = {'apikey': apiKey, 'Authorization': 'Bearer $apiKey'};

    final response = await http.delete(url, headers: headers);

    if (response.statusCode != 204) {
      return false;
    } else {
      return true;
    }
  }
}
