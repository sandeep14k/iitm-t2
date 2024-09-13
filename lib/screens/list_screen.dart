import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List companies = [];

  @override
  void initState() {
    super.initState();
    fetchCompanies();
  }

  void fetchCompanies() async {
    final response = await http.get(Uri.parse('https://fakerapi.it/api/v1/companies?_seed=12456'));
    if (response.statusCode == 200) {
      setState(() {
        companies = json.decode(response.body)['data'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Company List')),
      body: ListView.builder(
        itemCount: companies.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(companies[index]['name']),
            subtitle: Text(companies[index]['email']),
          );
        },
      ),
    );
  }
}
