class PostModel {
  int id;
  String dhInsert;
  String content;
  int userId;
  String userName;

  PostModel({this.id, this.dhInsert, this.content, this.userId, this.userName});

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dhInsert = json['dh_insert'];
    content = json['content'];
    userId = json['user_id'];
    userName = json['user_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dh_insert'] = this.dhInsert;
    data['content'] = this.content;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    return data;
  }
}
