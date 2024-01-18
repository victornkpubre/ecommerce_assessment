import 'package:dio/dio.dart';
import 'package:ecommerce/app/constants.dart';
import 'package:ecommerce/domain/entities/product.dart';
import 'package:ecommerce/domain/entities/user.dart';
import 'package:retrofit/http.dart';

part "api_client.g.dart";

@RestApi(baseUrl: AppConstants.baseUrl)

abstract class ApiClient {

  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  //Login
  @POST("/auth/login")
  Future<dynamic> login(
    @Field("username") String username,
    @Field("password") String password,
  );

  //get user
  @GET("/users/{id}")
  Future<String> getUser(
    @Path("id") String id,
  );

  //create user
  @POST("/users")
  Future<dynamic> createUser(
    @Field("username") String username,
    @Field("email") String email,
    @Field("password") String password,
  );

  //update user
  @PUT("/users/{id}")
  Future<User> updateUser(
    @Path("id") String id,
    @Field("username") String? username,
    @Field("email") String? email,
    @Field("password") String? password,
  );

  //get products
  @GET("/products")
  Future<List<Product>> getProducts();

}