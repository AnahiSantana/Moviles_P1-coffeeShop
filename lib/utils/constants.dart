import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';

// home
const String APP_TITLE = "Snacks shop";
// profile
const String PROFILE_TITLE = "Perfil";
const String PROFILE_LOGOUT = "Cerrar sesion";
const String PROFILE_CART = "Lista de compras";
const String PROFILE_WISHES = "Lista de deseos";
const String PROFILE_HISTORY = "Historial de compras";
const String PROFILE_SETTINGS = "Ajustes";
const String PROFILE_NAME = "Anna Doe";
const String PROFILE_EMAIL = "anna@doe.com";
const String PROFILE_PICTURE =
    "https://dkpp.go.id/wp-content/uploads/2018/10/photo.jpg";

// app
const Color PRIMARY_COLOR = Color(0xff214254);
const Color ACCENT_COLOR = Color(0xffBCB0A1);
const Color PCOLOR = Color(0xffFABF7C);

//lists
List<ProductHotDrinks> hotdrinks =
    ProductRepository.loadProducts(ProductType.BEBIDAS);
List<ProductGrains> grains = ProductRepository.loadProducts(ProductType.GRANO);
List<ProductDessert> desserts =
    ProductRepository.loadProducts(ProductType.POSTRES);
List<ProductItemCart> cartlist = <ProductItemCart>[];
