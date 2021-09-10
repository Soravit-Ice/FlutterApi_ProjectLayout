import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {

  final title , subDetail , linkImage , detailFormJson;
  DetailPage(this.title , this.subDetail , this.linkImage , this.detailFormJson);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  var _title , _subDetail , _linkImage , _detailFormJson ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _title = widget.title;
    _subDetail = widget.subDetail;
    _linkImage = widget.linkImage;
    _detailFormJson = widget.detailFormJson;


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail"),),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(_title , style: TextStyle(fontSize: 20),),
            Text(_subDetail,style: TextStyle(fontSize: 15 , color: Colors.grey),),
            Image.network(_linkImage),
            Text(_detailFormJson , style: TextStyle(fontSize: 15),)
          ],
        ),
      ),
    );
  }
}