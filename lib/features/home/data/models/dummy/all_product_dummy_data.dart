import 'package:marketi/features/home/data/models/all_product_model/all_product_model.dart';
import 'package:marketi/features/home/data/models/all_product_model/product.dart';

AllProductModel get allProductDummy {
  return AllProductModel(
    list: List.generate(10, (index) {
      return Product.fromJson(allProductMap);
    }),
  );
}

Map<String, dynamic> get allProductMap => {
  "id": 3,
  "title": "Smart Watch Series 5",
  "description": "Fitness tracking smartwatch with heart rate monitor and GPS.",
  "category": "Wearables",
  "price": 249.99,
  "discountPercentage": 5.0,
  "rating": 4.8,
  "stock": 25,
  "tags": ["smartwatch", "fitness", "wearable"],
  "brand": "FitTech",
  "sku": "SW5-001",
  "weight": 50,
  "dimensions": {"width": 40.0, "height": 45.0, "depth": 10.0},
  "warrantyInformation": "1 year limited warranty",
  "shippingInformation": "Ships in 1-2 business days",
  "availabilityStatus": "Low Stock",
  "reviews": [],
  "returnPolicy": "30-day return policy",
  "minimumOrderQuantity": 1,
  "meta": {
    "createdAt": "2025-05-01T09:00:00Z",
    "updatedAt": "2025-08-15T10:00:00Z",
    "barcode": "456789123456",
    "qrCode": "https://example.com/qr/sw5",
  },
  "images": ["https://example.com/images/sw5-face.jpg"],
  "thumbnail": "https://example.com/images/sw5-thumb.jpg",
};
