import 'package:equatable/equatable.dart';
import 'product.dart';

class AllProductModel extends Equatable {
  final List<Product>? list;

  const AllProductModel({this.list});

  factory AllProductModel.fromJson(Map<String, dynamic> json) {
    return AllProductModel(
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'list': list?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [list];
}
