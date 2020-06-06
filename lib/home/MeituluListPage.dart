import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_demo/home/ImageGalleryPage.dart';
import 'dart:convert';
import 'package:flutter_demo/model/MeituluData.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class MeituluPage extends StatefulWidget {
  @override
  _MeituluPageState createState() => _MeituluPageState();
}

enum LoadStatus { LOAD_START, LOAD_ERROR, LOAD_SUCCESS }

class _MeituluPageState extends State<MeituluPage> {
  final Dio dio = Dio();
  List<Data> datas;
  LoadStatus status;

  @override
  void initState() {
    super.initState();
    _getNetData();
  }

  @override
  void reassemble() {
    super.reassemble();
    _getNetData();
  }

  void _getNetData() async {
    setState(() {
      status = LoadStatus.LOAD_START;
    });
    try {
      Response response = await dio.get(
          "http://39.101.178.174/meitulu/api/findMeituByName?name=%E6%A2%A6%E5%BF%83%E7%8E%A5&pageIndex=0&pageSize=30");
      var jsonData = json.decode(response.toString());
      setState(() {
        status = LoadStatus.LOAD_SUCCESS;
        datas = MeituluData.fromJson(jsonData).data;
      });
    } catch (e) {
      setState(() {
        status = LoadStatus.LOAD_ERROR;
      });
      print(e);
    }
  }

  Widget _getItemChildView(Data data) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ImageGalleryPage(data.images);
        }))
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 2.2 / 3,
              child: Image.network(
                  data.cover,
                  fit: BoxFit.cover
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                data.title,
                maxLines: 2,
                style: TextStyle(fontSize: 12.0),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getItemContainer(Data data, int index) {
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(milliseconds: 375),
      child: SlideAnimation(
        verticalOffset: 50.0,
        child: FadeInAnimation(
          child: _getItemChildView(data),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case LoadStatus.LOAD_START:
        return Text('正在加载。。。');
        break;
      case LoadStatus.LOAD_ERROR:
        return Text('加载失败');
        break;
      case LoadStatus.LOAD_SUCCESS:
        return AnimationLimiter(
          child: GridView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: datas == null ? 0 : datas.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //横轴元素个数
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 0.6,
              ),
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return _getItemContainer(datas[index], index);
              }),
        );
        break;
      default:
        return Text('加载失败');
    }
  }
}
