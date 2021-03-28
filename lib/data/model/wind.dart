class Wind {
  int deg;

  Wind({this.deg});

  Wind.fromJson(Map<String, dynamic> json) {
    deg = json['deg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deg'] = this.deg;
    return data;
  }
}
