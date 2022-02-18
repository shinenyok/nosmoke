/// @date: 2022/2/18 12:13 下午
/// @author: admin
/// @description: dart
///
// class History {
//   List<History> history = [];
//
//   History({required this.history});
//
//   History.fromJson(Map<String, dynamic> json) {
//     if (json['history'] != null) {
//       history = [];
//       json['history'].forEach((v) {
//         history.add(new History.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.history != null) {
//       data['history'] = this.history.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

class Model {
  String num = '';
  String time = '';
  String spend = '';
  String? spctor;

  Model(
      {required this.num,
      required this.time,
      required this.spend,
      this.spctor});

  Model.fromJson(Map<String, dynamic> json) {
    num = json['num'];
    time = json['time'];
    spend = json['spend'];
    spctor = json['spctor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['num'] = this.num;
    data['time'] = this.time;
    data['spend'] = this.spend;
    data['spctor'] = this.spctor;
    return data;
  }
}
