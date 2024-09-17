
//path  =  https://newsapi.org/v2/top-headlines?country=eg&category=business&apikey=65f7f556ec76449fa7dc7c0069f040ca

//1. base url : https://newsapi.org/
//2.  method url   :  v2/top-headlines?
//3.  queries :  country=eg&category=business&apikey=65f7f556ec76449fa7dc7c0069f040ca

// APIKEY = 7185ba6b34a74fd4827c7fa967ca6364


import 'package:dio/dio.dart';

//1. cree class dio_Helper

class DioHelper {






  // 2. cree object from dio
//static init() : cette méthode permet d'initialiser l'objet dio en l'appelant
//   simplement via DioHelper.init() sans avoir à instancier la classe.


   static late  Dio  dio  ;

  static init(){

    dio =Dio(                                           // L'objet dio est initialisé avec des options de base.

      BaseOptions(

        baseUrl: 'https://newsdata.io/api/1/',
        receiveDataWhenStatusError: true,


      )

    );


  }


  // cree methode pour get data from url

  static Future<Response> getData({
    required String url,                               //  methode : URL pour la requête
    required Map<String, dynamic> queries,            // Spécifie les types corrects pour la Map
    String? token ,
    String lang = 'ar',
  })  async{


    final options = Options(
      headers: {
        'Authorization': token != null ? 'Bearer $token' : null,
        'lang': lang,
      },
    );


   return await  dio.get(
      url,
      queryParameters: queries,                        // Envoie les paramètres de requête
    );
  }




}









/*
// 1.
// DIO : Ce code utilise la bibliothèque Dio pour effectuer des requêtes HTTP dans
// une application Flutter/Dart.
//Cette ligne importe la bibliothèque dio, qui est un package tiers en Dart
// utilisé pour effectuer des requêtes HTTP (GET, POST, etc.).

//2.

On définit une classe DioHelper pour encapsuler toute la logique liée aux
requêtes HTTP à l'aide de l'objet Dio.

//  static  Dio?  dio  ;

static : signifie que cet attribut est partagé entre toutes les instances de la classe.
 Cela permet d'accéder à dio sans créer une instance de DioHelper.

 Cela signifie que dio sera utilisé pour effectuer des requêtes HTTP dans
  toute l'application, mais il est initialisé à null pour l'instant.



  static init() : cette méthode permet d'initialiser l'objet dio en l'appelant
  simplement via DioHelper.init() sans avoir à instancier la classe.

  À l'intérieur de cette méthode :

- L'objet dio est initialisé avec des options de base.

- BaseOptions() : est utilisé pour définir les paramètres par défaut pour toutes les requêtes HTTP :
يتم استخدام BaseOptions لتعيين المعلمات الافتراضية لجميع طلبات HTTP:

- baseUrl : l'URL de base pour toutes les requêtes (ici, https://newsapi.org/).
Cela signifie que toutes les requêtes ajouteront cette URL de base à la partie spécifique de chaque endpoint.

eceiveDataWhenStatusError : quand cette option est à true,
 le client recevra les données même si le statut de la réponse est une erreur (comme 400 ou 500).
 Résumé
Ce code crée un helper DioHelper pour effectuer des requêtes HTTP
 avec un client Dio configuré. La méthode init() est appelée pour initialiser l'objet Dio
 avec une URL de base et des options de gestion d'erreurs, ce qui simplifie les requêtes HTTP
  dans l'application.

 */