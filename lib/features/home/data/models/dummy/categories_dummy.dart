import 'package:marketi/features/home/data/models/categories_model.dart';

CategoriesModel get CategoriesDummy => CategoriesModel(
  slug: 'slug',
  name: 'name',
  url: 'url',
  image: 'image',
);

List<CategoriesModel> get CategoriesDummyList => List.generate(
  6,
  (index) => CategoriesDummy,
);