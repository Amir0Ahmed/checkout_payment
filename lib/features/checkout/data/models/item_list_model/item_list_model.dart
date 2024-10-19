import 'item.dart';
import 'shipping_address.dart';

class ItemListModel {
  List<Item>? items;
  ShippingAddress? shippingAddress;

  ItemListModel({this.items, this.shippingAddress});

  factory ItemListModel.fromJson(Map<String, dynamic> json) => ItemListModel(
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
        shippingAddress: json['shipping_address'] == null
            ? null
            : ShippingAddress.fromJson(
                json['shipping_address'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'items': items?.map((e) => e.toJson()).toList(),
        'shipping_address': shippingAddress?.toJson(),
      };
}
