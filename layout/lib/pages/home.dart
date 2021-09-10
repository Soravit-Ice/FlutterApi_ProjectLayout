import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:layout/pages/detail.dart';

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
        child: FutureBuilder(builder: (context,snapshot) {
          var data = json.decode(snapshot.data.toString());
          return ListView.builder(itemBuilder: (BuildContext context ,int index)
          {
            return MyBox(data[index]['title'], data[index]['detail_sub'] , data[index]['url_image'] , data[index]['detail']);
            
          },
          itemCount: data.length,
          );


        },
        
        future: DefaultAssetBundle.of(context).loadString('data/data.json'),
        
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
}