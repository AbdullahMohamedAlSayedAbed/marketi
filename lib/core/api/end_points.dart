abstract class EndPoints {
  static const String baseUrl = "https://supermarket-dan1.onrender.com/api/v1/";
  static const String signIn = "auth/signIn";
  static const String signUp = "auth/signUp";
  static const String resetPassword = "auth/resetPassword";
  static const String resetPassCode = "auth/resetPassCode";
  static const String activeResetPass = "auth/activeResetPass";
  static const String userData = "portfoilo/userData";
  static const String addImage = "portfoilo/addImage";
  static String getUserById(int id) => "user/get-user/$id";
  static String productsByCategory(String name) => "home/products/category/$name";
  static String productsByBrand(String name) => "home/products/brand/$name";
}

abstract class ApiKeys {
  static const String token = "token";
  static const String status = "status";
  static const String errorMessage = "ErrorMessage";
  static const String message = "message";
  static const String user = "user";
  static const String email = "email";
  static const String password = "password";
  static const String name = "name";
  static const String phone = "phone";
  static const String image = "image";
  static const String id = "_id";
  static const String address = "address";
  static const String confirmPassword = "confirmPassword";
  static const String location = "location";
  static const String allProducts = "home/products";
  static const String categories = "home/categories";
  static const String brands = "home/brands";
}
