import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future<void> upComingMatchApi(RxList<dynamic> upcomingMatch) async {
  // Create a client with the specified headers
  http.Client client = http.Client();

  try {
    http.Response response = await client.get(
      Uri.parse("https://cricbuzz-cricket.p.rapidapi.com/matches/v1/upcoming"),
      headers: {
        'X-RapidAPI-Key': '3d38305e35msh8ed237c4cd1536ap1380a3jsnac044048e674',
        'X-RapidAPI-Host': 'cricbuzz-cricket.p.rapidapi.com'
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = jsonDecode(response.body);
      List<dynamic> typeMatches =
          responseData['typeMatches'][0]["seriesMatches"] ?? [];

      // Check if there is at least one element in the list before removing
      if (typeMatches.length > 1) {
        // Remove the element at index 1
        typeMatches.removeAt(1);
      }

      debugPrint("========>>>>>>>>>=======$typeMatches");
      upcomingMatch.assignAll(typeMatches);
      debugPrint("==================$upcomingMatch");
    } else {
      // Throw an exception if the request was not successful
      throw Exception(
          'Failed to load stations. Status code: ${response.statusCode}');
    }
  } catch (error) {
    // Handle any other exceptions that may occur
    debugPrint('Error: $error');
  }
}

//
// Future<void> live() async {
//   // Create a client with the specified headers
//   http.Client client = http.Client();
//
//   try {
//     http.Response response = await client.get(
//       Uri.parse("https://cricbuzz-cricket.p.rapidapi.com/matches/v1/live"),
//       headers: {'X-RapidAPI-Key': '3d38305e35msh8ed237c4cd1536ap1380a3jsnac044048e674', 'X-RapidAPI-Host': 'cricbuzz-cricket.p.rapidapi.com'},
//     );
//
//     if (response.statusCode == 200) {
//       // Parse and print the response body
//       print(jsonDecode(response.body));
//     } else {
//       // Throw an exception if the request was not successful
//       throw Exception('Failed to load stations. Status code: ${response.statusCode}');
//     }
//   } catch (error) {
//     // Handle any other exceptions that may occur
//     print('Error: $error');
//   }
// }
//
// Future<void> complacted() async {
//   // Create a client with the specified headers
//   http.Client client = http.Client();
//
//   try {
//     http.Response response = await client.get(
//       Uri.parse("https://cricbuzz-cricket.p.rapidapi.com/matches/v1/recent"),
//       headers: {'X-RapidAPI-Key': '3d38305e35msh8ed237c4cd1536ap1380a3jsnac044048e674', 'X-RapidAPI-Host': 'cricbuzz-cricket.p.rapidapi.com'},
//     );
//
//     if (response.statusCode == 200) {
//       // Parse and print the response body
//       print(jsonDecode(response.body));
//     } else {
//       // Throw an exception if the request was not successful
//       throw Exception('Failed to load stations. Status code: ${response.statusCode}');
//     }
//   } catch (error) {
//     // Handle any other exceptions that may occur
//     print('Error: $error');
//   }
// }
