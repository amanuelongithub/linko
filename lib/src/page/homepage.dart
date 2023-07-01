import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linktest_app/src/api/speechapi.dart';
import 'package:linktest_app/src/service/controller.dart';
import '../components/feedcard.dart';
import '../components/header.dart';

class HomePage extends GetView<MyController> {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
        borderSide: Divider.createBorderSide(context),
        borderRadius: BorderRadius.circular(10));
    Color secondbackgroundColor = Theme.of(context).cardColor;

    return SafeArea(
        child: Scaffold(body: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(children: [
              const Header(),
              SizedBox(height: 35),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color.fromARGB(148, 206, 206, 206),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage('assets/avatar5.png'),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Ali Jaber',
                              style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            const SizedBox(height: 5),
                            TextFormField(
                              controller: controller.searchcontroller.value,
                              cursorColor: Colors.blue,
                              decoration: InputDecoration(
                                hintText: "search",
                                counterText: '',
                                contentPadding: const EdgeInsets.all(8),
                                hintStyle:
                                TextStyle(color: Colors.grey[400], fontSize: 14),
                                fillColor: secondbackgroundColor,
                                filled: true,
                                border: inputBorder,
                                enabledBorder: inputBorder,
                                errorStyle: const TextStyle(fontSize: 0.01),
                                errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              style:
                              TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value != null && value.isEmpty) {
                                  return 'Please enter a sample code';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ],
                        )),
                    const SizedBox(width: 8),
                     CircleAvatar(
                     radius: 15,
                      backgroundColor: Colors.grey.withAlpha(180),
                      child: Icon(Icons.edit, color: Colors.black54,size: 20,),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15),
              Expanded(child: buidListItems())
            ]),
          ),
          bottomNavigationBar: Container(
            height: 50,
            child: Row(
              children: [
                SizedBox(width: 15),
                Expanded(
                  child: TextFormField(
                    controller: controller.mesgcontroller.value,
                    cursorColor: Colors.blue,
                    decoration: InputDecoration(
                      hintText: "Message",
                      counterText: '',
                      contentPadding: const EdgeInsets.all(8),
                      suffixIcon: GestureDetector(
                          onPanDown: (detail) => SpeechApi.toggleRecording(
                              onResult: (text) =>
                              controller.mesgcontroller.value.text = text,
                          onListening: (isListening){
                            controller.isListening.value = isListening;
                          }
                          ),
                          child: AvatarGlow(child:  Icon(Icons.graphic_eq, color: Colors.grey),
                              endRadius: 40,
                          animate: controller.isListening.value,
                            glowColor: Colors.pink,
                          )),
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 94, 94, 94), fontSize: 14),
                      fillColor: Color.fromARGB(255, 231, 231, 231),
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: Divider.createBorderSide(context),
                          borderRadius: BorderRadius.circular(100)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: Divider.createBorderSide(context),
                          borderRadius: BorderRadius.circular(100)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.pink,
                  child: Icon(Icons.send, color: Colors.white,),
                )
              ],
            ),
          ),
        )));
  }

  Widget buidListItems() {
    return ListView.separated(
      itemCount: controller.items.value.length,
      itemBuilder: (context, index) {
        final ite = controller.items.value[index];
        return ItemCard(item: ite, index: index,   onUpdateFaver:    controller.updateFavIcon(index, ite.isfavorite));


      },
      separatorBuilder: (context, index) => SizedBox(
        height: 20,
      ),
    );
  }
}
