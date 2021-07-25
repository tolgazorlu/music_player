/*class MusicModel {
  String? sId;
  String? musicName;
  String? musicAuthor;
  String? musicFotoURL;
  String? musicFileURL;
  String? musicAlbume;

  MusicModel(
      {this.sId,
      this.musicName,
      this.musicAuthor,
      this.musicFileURL,
      this.musicFotoURL});

  MusicModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    musicName = json['music_name'];
    musicAuthor = json['music_author'];
    musicFileURL = json['music_fileURL'];
    musicFotoURL = json['music_fotoURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['_id'] = this.sId;
    data['music_name'] = this.musicName;
    data['music_author'] = this.musicAuthor;
    data['music_fileURL'] = this.musicFileURL;
    data['music_fotoURL'] = this.musicFotoURL;

    return data;
  }
}
*/

class MusicModel {
  String? sId;
  String? musicName;
  String? musicAuthors;
  String? musicImageUrl;
  String? musicFileUrl;
  String? musicAlbum;

  MusicModel(
      {this.sId,
      this.musicName,
      this.musicAuthors,
      this.musicImageUrl,
      this.musicFileUrl,
      this.musicAlbum});

  MusicModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    musicName = json['music_name'];
    musicAuthors = json['music_authors'];
    musicImageUrl = json['music_image_url'];
    musicFileUrl = json['music_file_url'];
    musicAlbum = json['music_album'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['_id'] = this.sId;
    data['music_name'] = this.musicName;
    data['music_authors'] = this.musicAuthors;
    data['music_image_url'] = this.musicImageUrl;
    data['music_file_url'] = this.musicFileUrl;
    data['music_album'] = this.musicAlbum;
    return data;
  }
}
