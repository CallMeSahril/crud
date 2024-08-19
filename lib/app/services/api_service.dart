import 'package:crud/app/data/item.dart';
import 'package:crud/app/data/users.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const baseUrl =
      'https://jsonplaceholder.typicode.com'; // URL API yang digunakan

  // Register pengguna baru
  static Future<User?> register(String email, String password) async {
    var url = Uri.parse('$baseUrl/register');
    var response =
        await http.post(url, body: {'email': email, 'password': password});
    if (response.statusCode == 201) {
      return User.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  // Login pengguna
  static Future<User?> login(String email, String password) async {
    var url = Uri.parse('$baseUrl/login');
    var response =
        await http.post(url, body: {'email': email, 'password': password});
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  // Fetch all items (READ)
  static Future<List<Item>?> fetchItems() async {
    var url = Uri.parse('$baseUrl/items');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((item) => Item.fromJson(item)).toList();
    } else {
      return null;
    }
  }

  // Add new item (CREATE)
  static Future<Item?> addItem(Item item) async {
    var url = Uri.parse('$baseUrl/items');
    var response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode(item.toJson()),
    );
    if (response.statusCode == 201) {
      return Item.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  // Update item (UPDATE)
  static Future<Item?> updateItem(Item item) async {
    var url = Uri.parse('$baseUrl/items/${item.id}');
    var response = await http.put(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode(item.toJson()),
    );
    if (response.statusCode == 200) {
      return Item.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  // Delete item (DELETE)
  static Future<bool> deleteItem(int id) async {
    var url = Uri.parse('$baseUrl/items/$id');
    var response = await http.delete(url);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
