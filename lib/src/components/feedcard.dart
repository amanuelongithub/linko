import 'package:flutter/material.dart';
import 'package:linktest_app/src/model/Item.dart';
import 'package:linktest_app/src/service/controller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';

class ItemCard extends StatefulWidget {
  final Item item;
  final int index;
  const ItemCard({Key? key, required this.item, required this.index}) : super(key: key);

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
     return Container(
      width: double.maxFinite,
      height: 320,
      decoration: BoxDecoration(
          
          borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        Stack(children: [
          InkWell(
              borderRadius: BorderRadius.circular(10),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                      decoration: const BoxDecoration(),
                      child: Image.asset(widget.item.imgUrl)))),
          Positioned(
              top: 10,
              right: 10,
              child: InkWell(
                // print('${controller.items.value[index].isfavorite}');
                onTap:(){
                  setState(() {
                    widget.item.isfavorite =!widget.item.isfavorite;

                  });
                },
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.favorite,
                    color: widget.item.isfavorite ?mainColor: Colors.grey,
                  ),
                ),
              ))
        ]),
        const Spacer(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.all(8),
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 100,
                            height: 40,
                            child: Text(
                              widget.item.name,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            width: 70,
                            height: 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color.fromARGB(61, 255, 19, 2)),
                            child: const Center(
                                child: Text(
                                  'Offer %',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 0, 0),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(children: [
                        const Icon(
                          Icons.watch_later_rounded,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text('${widget.item.timeTake} Min'),
                        const SizedBox(
                          width: 10,
                        ),
                        const CircleAvatar(
                          radius: 3,
                          backgroundColor: Colors.grey,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(Icons.local_shipping_rounded,
                            color: Colors.grey),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(widget.item.deliveryFee)
                      ]),
                      const SizedBox(
                        height: 5,
                      ),
                    ]),
              ),
            ),
            OutlinedButton(
                onPressed: () {
                  launchUrlString('tel:${widget.item.phonenum}');
                },
                style: OutlinedButton.styleFrom(
                    minimumSize: const Size(90, 38),
                    foregroundColor: Colors.red,
                    side: const BorderSide(width: 1, color: Colors.red)),
                child: const Text("CALL"))
          ],
        ),
        const Spacer()
      ]),
    );
  }
}

