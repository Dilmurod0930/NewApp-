import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:prac1/models/news_model.dart';

class OfflineNews extends StatefulWidget {
  List<Box<dynamic>> futures;
  int current;
  int i;
  OfflineNews(
      {Key? key, required this.futures, required this.current, required this.i})
      : super(key: key);

  @override
  State<OfflineNews> createState() => _OfflineNews();
}

class _OfflineNews extends State<OfflineNews> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 130,
            height: 130,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/loadingGif.gif'), fit: BoxFit.cover),
            ),
          ),
          Expanded(
            child: Container(
              width: 270,
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.futures[widget.current]
                        .getAt(widget.i)!
                        .title
                        .toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  Text(
                    "By ${widget.futures[widget.current].getAt(widget.i)!.author.toString()}",
                    style: const TextStyle(color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 220,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(widget.futures[widget.current]
                                  .getAt(widget.i)!
                                  .source!
                                  .name
                                  .toString()),
                              const Icon(Icons.more_horiz),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
