
// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ui/screens/profileset.dart';
Future<void> deleteImageFromCache() async {
    final directory = await getTemporaryDirectory(); // Cache directory
    final String path = '${directory.path}/profile_image.png'; // Cached image path
    final File cachedImage = File(path);

    if (await cachedImage.exists()) {
      await cachedImage.delete(); 
        image = null; 
    }}

var _storage= new FlutterSecureStorage();
Future store(String token)async{
  final pre=await SharedPreferences.getInstance();
  await pre.setBool('isloged', true);
  await _storage.write(key: 'Token', value:token );
}
Future<String?> gettoken()async{
  return  await _storage.read(key: 'Token');
}
Future deletetok()async{
  final pre=await SharedPreferences.getInstance();
  await pre.setBool('isloged', false);
  await _storage.delete(key: 'Token');
}
Future<Response> signup(String username,String passowrd,String email)async{
   Response response =await http.post(
    Uri.parse('http://192.168.1.7:8000/register'),
    body: {
      'username':username,
      'email':email,
      'password':passowrd
    }
  );
  if (response.statusCode==200) {
    store(jsonDecode(response.body)['token']);
  }
  return response;
}
Future <Response> loginap(String username,String password) async{
  Response response =await http.post(
    Uri.parse('http://192.168.1.7:8000/sigin'),
    body:{
     'username':username,
     'password':password
    } 
  );
  if (response.statusCode==200) {
    store(jsonDecode(response.body)['token']);
  }
  return response;
}
Future setprofilepic(File image)async{
  String? token=  await gettoken();
  var im= await http.MultipartFile.fromPath('profilepic', image.path);
  var request=http.MultipartRequest(
    'POST',Uri.parse('http://192.168.1.7:8000/pic')
  );
  request.headers.addAll(
    {
     'Authorization': 'Token $token',
    }
  );
  request.files.add(im);
  try{
     var m=await request.send();
   
   return m;
  }catch(e){}
}
Future lougout()async{
  String? token=  await gettoken();
  try{
    Response  res=await http.post(
      Uri.parse('http://192.168.1.7:8000/logout'),
      headers: {
        'Authorization': 'Token $token',
      }
    );
    if (res.statusCode==200){
      await deletetok();
      await deleteImageFromCache();
    }
    return res;
  }catch(e){
  }
}
Future deleteacount()async{
  String? token=  await gettoken();
 try{
    Response  res=await http.delete(
      Uri.parse('http://192.168.1.7:8000/del/'),
      headers: {
        'Authorization': '$token',
      }
    );
    if (res.statusCode==200){
      await deletetok();
      await deleteImageFromCache() ;}
    return res;
  }catch(e){
  }
}
Future getimage()async{
  String? token=  await gettoken();
 var m= await http.get(Uri.parse('http://192.168.1.7:8000/image'),
   headers: {
        'Authorization': 'Token $token',
      }
  );
  if (m.statusCode==200) {
     var url= jsonDecode(m.body)['pic'];
     var s= await http.get(Uri.parse('http://192.168.1.7:8000/$url'));
     final directory = await getTemporaryDirectory();
        final path = '${directory.path}/profile_image.png';
        final file = File(path);
        await file.writeAsBytes(s.bodyBytes);
        image=file;
  }
}