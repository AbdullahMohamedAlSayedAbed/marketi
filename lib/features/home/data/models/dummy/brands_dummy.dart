import 'package:marketi/features/home/data/models/brands_model.dart';

BrandsModel get BrandsDummy => BrandsModel(name: 'name', emoji: 'emoji');

List<BrandsModel> get BrandsDummyList => List.generate(
  6,
  (index) => BrandsDummy,
);