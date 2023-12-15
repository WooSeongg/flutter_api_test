import 'package:http/http.dart' as http;
import 'dart:convert';

///http 메서드 정의
enum HttpMethod { get, post, put, delete, update, patch}


///http 요청을 보내고 응답을 json으로 변환해 반환하는 전역 메서드
Future requestAPI(
    Uri url,                    //서버URI, queryParameters로 하면 좋음
    {required HttpMethod httpMethod,
     Map<String, String>? header, //http header
     Map<String, dynamic>? body}  //http body
  ) async{

  //응답을 저장할 객체
  http.Response response;

  switch(httpMethod){
    case HttpMethod.get:
      response =  await http.get(url, headers: header);
      break;
    case HttpMethod.post:
      response = await http.post(url, headers: header, body: body);
      break;
    case HttpMethod.put:
      response = await http.put(url, headers: header, body: body);
      break;
    case HttpMethod.delete:
      response = await http.delete(url, headers: header, body: body);
      break;
    default:
      return null;
  }

  final int statusCode = response.statusCode;

  //통신 실패
  if (statusCode != 200) {
    print("@@@@@@@@@@@@@@@@@@@@@@@");
    print("@@@@@@@@통신실패@@@@@@@@@");
    print("@@@@@@@@@@@@@@@@@@@@@@@");
    return null;
  }


  return json.decode(response.body);
}