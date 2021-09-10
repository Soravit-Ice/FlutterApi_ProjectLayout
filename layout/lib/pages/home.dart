import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:layout/pages/detail.dart';

import 'package:http/http.dart' as http;
import 'dart:async';


class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("App Promote Course"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: FutureBuilder(builder: (context, AsyncSnapshot snapshot) {
         // var data = json.decode(snapshot.data.toString());

         if(snapshot.hasData){
           return ListView.builder(itemBuilder: (BuildContext context ,int index)
          {
            return MyBox(snapshot.data[index]['title'], snapshot.data[index]['detail_sub'] , snapshot.data[index]['url_image'] , snapshot.data[index]['detail']);
            
          },
          itemCount: snapshot.data.length,
          );
         }else{
           return Center(
             child: CircularProgressIndicator(),
           );
         }
          


        },
        
        future: getData(),
        // load json from local future: DefaultAssetBundle.of(context).loadString('data/data.json'), 
        
        )
        
      ),
      
    );
  }

  Widget MyBox(String title ,String subDetail, String linkImages , String detail){
    var pagetitle, pageImage , pageSubdetail , pageDetail ;

    pagetitle = title;
    pageImage = linkImages;
    pageSubdetail = subDetail;
    pageDetail = detail;
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(linkImages),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken)
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text(title ,style: TextStyle(fontSize: 30 , color: Colors.white.withOpacity(1) , fontWeight: FontWeight.bold),),
          Text(subDetail, style: TextStyle(fontSize: 15 , color: Colors.white.withOpacity(0.55) , fontWeight: FontWeight.bold)),
          Container(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: TextButton(
              onPressed: (){
                print("Readmore clicked");
                Navigator.push(context,  MaterialPageRoute(builder: (context) => DetailPage(pagetitle,pageSubdetail,pageImage,pageDetail)));
              },
              child: Text("Read more"),
            ),
          )
        ],
      ),
    );

  }


  Future getData() async{
    // https://raw.githubusercontent.com/Soravit-Ice/FlutterApi_ProjectLayout/main/data.json
     var url = Uri.http('raw.githubusercontent.com', '/Soravit-Ice/FlutterApi_ProjectLayout/main/data.json');
     var response = await http.get(url);

     var result = json.decode(response.body);

     print(result);
     return result;
  }
}