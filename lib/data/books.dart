// ignore_for_file: unused_local_variable

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:libraryapp/data/user.dart';
final dio=Dio();
class Bookc {
  String title;
  int price;
  int stock;
  int buyer;
  String author;
  String cover;
  int id;
  Bookc(this.author,this.buyer,this.price,this.stock,this.title,this.cover,this.id);
}
Future getbokall() async{
  String? token=  await gettoken();
  Options options = Options(
    headers: {
      'Authorization': 'Token $token',
         // Add the token in the header
    });
  try{
     Response m= await dio.get('http://192.168.1.7:8000/books',options: options);
     if(m.statusCode==200){
      List <Bookc> s=[];
       for (var item in m.data['books']) {
         s.add(Bookc(item['author'], item['buyer'], item['book']['price'], item['book']['stock'], item['book']['title'],item['book']['cover'],item['book']['id']));
       }
       return s;
     } 
     }
     catch(e){
     }
}
Future getbokk() async{
  String? token=  await gettoken();
  Options options = Options(
    headers: {
      'Authorization': 'Token $token',
         // Add the token in the header
    });
  try{
     Response m= await dio.get('http://192.168.1.7:8000/booksu',options: options);
     if(m.statusCode==200){
      List <Bookc> s=[];
       for (var item in m.data['books']) {
         s.add(Bookc(item['author'], item['buyer'], item['book']['price'], item['book']['stock'], item['book']['title'],item['book']['cover'],item['book']['id']));
       }
       return s;
     } 
     }
     catch(e){
     }
}
Future addbookfut(String title,int price ,int stock,File image) async{
  String? token=  await gettoken();
  var im= await MultipartFile.fromFile(image.path);
   FormData data=FormData.fromMap(
    {
    'title':title,
    'price':price,
    'stock':stock,
    'cover': im
    },
   );
    Options options = Options(
    headers: {
      'Authorization': 'Token $token',
         // Add the token in the header
    },
  );
     try{
     Response m= await dio.post('http://192.168.1.7:8000/',data: data,options: options);
     return m;
     }
     catch(e){
     }
}
Future buybook(int id,String wilaya,int number)async{
  String? token=  await gettoken();
  Map data={
  'wilaya':wilaya,
  'number':number
  };
  Options header=Options(
  headers: {
    'Authorization': 'Token $token',
    'book':id
  }
  );
  try{
     Response m= await dio.post('http://192.168.1.7:8000/buy',data: data,options: header);
     return m;
     }
     catch(e){
     }
}
Future deletebook(int id)async{
  String? token=  await gettoken();
  Options header=Options(
  headers: {
    'Authorization': 'Token $token',
    'book':id
  }
  );
  try{
     Response m= await dio.delete('http://192.168.1.7:8000/delet',options: header);
     return m;
     }
     catch(e){
     }

}