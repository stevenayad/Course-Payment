import 'item.dart';

class ItemlistModel {
  List<orderlist>? items;

  ItemlistModel({this.items});

  factory ItemlistModel.fromJson(Map<String, dynamic> json) => ItemlistModel(
    items:
        (json['items'] as List<dynamic>?)
            ?.map((e) => orderlist.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'items': items?.map((e) => e.toJson()).toList(),
  };
}
