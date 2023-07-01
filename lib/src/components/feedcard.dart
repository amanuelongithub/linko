import 'package:flutter/material.dart';
import 'package:linktest_app/src/model/Item.dart';
import 'package:linktest_app/src/service/controller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:get/get.dart';

class ItemCard extends GetView<MyController>{
  final Item item;
  final int index;
  final Function onUpdateFaver;
  const ItemCard(  {super.key, required this.item,required this.index,required this.onUpdateFaver,});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width * 0.03;
    final sizeText = MediaQuery.of(context).size.width * 0.045;
    return Container(
      width: double.maxFinite,
      height: 350,
      decoration: BoxDecoration(
          color: const Color.fromARGB(35, 255, 161, 236),
          borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        Stack(children: [
          InkWell(
              borderRadius: BorderRadius.circular(10),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                      decoration: const BoxDecoration(),
                      child: Image.asset(item.imgUrl)))),
          Positioned(
              top: 10,
              right: 10,
              child: InkWell(
                // print('${controller.items.value[index].isfavorite}');
                onTap:()=>onUpdateFaver,
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: item.isfavorite?Colors.green: Colors.white,
                  child: Icon(
                    Icons.favorite,
                    color: controller.items.value[index].isfavorite ? Colors.red : Colors.grey,
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
                padding: EdgeInsets.all(size),
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
                      Row(
                        children: [
                          Container(
                            width: 100,
                            height: 40,
                            child: Text(
                              item.name,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: sizeText,
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
                        Text('${item.timeTake} Min'),
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
                        Text(item.deliveryFee)
                      ]),
                      const SizedBox(
                        height: 5,
                      ),
                    ]),
              ),
            ),
            OutlinedButton(
                onPressed: () {
                  launchUrlString('tel:${item.phonenum}');
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
