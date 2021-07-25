import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:musicapps/core/models/music_model.dart';

import 'base_service.dart';

class MusicService extends BaseService {
  Future getAllMusic() async {
    try {
      http.Response response = await http.get(Uri.parse('${BASE_URL}musics'));
      print(response.toString());
      if (response.statusCode == 200) {
        var jsonOBJ = jsonDecode(response.body);
        var musicList = jsonOBJ
            .map<MusicModel>((json) => MusicModel.fromJson(json))
            .toList();

        return musicList;
      }
    } catch (err) {
      return null;
    }
  }

  /* Future getAllMusic() async {
    try {
      http.Response response = await http.post(Uri.parse('${BASE_URL}musics'));
      var result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var postList = result
            .map<MusicModel>((json) => MusicModel.fromJson(json))
            .toList();
        print(result.toString());
        return postList;
      } else {
        return null;
      }
    } catch (err) {
      print(err);
      return null;
    }
  }*/
}
