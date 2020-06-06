class MeituluData {
  String msg;
  int code;
  List<Data> data;

  MeituluData({this.msg, this.code, this.data});

  MeituluData.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    code = json['code'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  Agency agency;
  String cover;
  String detailUrl;
  List<String> images;
  Model model;
  List<Tags> tags;
  String title;
  int totalNum;

  Data(
      {this.agency,
        this.cover,
        this.detailUrl,
        this.images,
        this.model,
        this.tags,
        this.title,
        this.totalNum});

  Data.fromJson(Map<String, dynamic> json) {
    agency =
    json['agency'] != null ? new Agency.fromJson(json['agency']) : null;
    cover = json['cover'];
    detailUrl = json['detail_url'];
    images = json['images'].cast<String>();
    model = json['model'] != null ? new Model.fromJson(json['model']) : null;
    if (json['tags'] != null) {
      tags = new List<Tags>();
      json['tags'].forEach((v) {
        tags.add(new Tags.fromJson(v));
      });
    }
    title = json['title'];
    totalNum = json['total_num'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.agency != null) {
      data['agency'] = this.agency.toJson();
    }
    data['cover'] = this.cover;
    data['detail_url'] = this.detailUrl;
    data['images'] = this.images;
    if (this.model != null) {
      data['model'] = this.model.toJson();
    }
    if (this.tags != null) {
      data['tags'] = this.tags.map((v) => v.toJson()).toList();
    }
    data['title'] = this.title;
    data['total_num'] = this.totalNum;
    return data;
  }
}

class Agency {
  String agencyTitle;
  String agencyUrl;

  Agency({this.agencyTitle, this.agencyUrl});

  Agency.fromJson(Map<String, dynamic> json) {
    agencyTitle = json['agency_title'];
    agencyUrl = json['agency_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['agency_title'] = this.agencyTitle;
    data['agency_url'] = this.agencyUrl;
    return data;
  }
}

class Model {
  String modelTitle;
  String modelUrl;

  Model({this.modelTitle, this.modelUrl});

  Model.fromJson(Map<String, dynamic> json) {
    modelTitle = json['model_title'];
    modelUrl = json['model_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['model_title'] = this.modelTitle;
    data['model_url'] = this.modelUrl;
    return data;
  }
}

class Tags {
  String tagTitle;
  String tagUrl;

  Tags({this.tagTitle, this.tagUrl});

  Tags.fromJson(Map<String, dynamic> json) {
    tagTitle = json['tag_title'];
    tagUrl = json['tag_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tag_title'] = this.tagTitle;
    data['tag_url'] = this.tagUrl;
    return data;
  }
}