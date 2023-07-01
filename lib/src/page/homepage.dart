import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linktest_app/src/api/speechapi.dart';
import 'package:linktest_app/src/service/controller.dart';
import 'package:linktest_app/src/utils/colors.dart';
import '../components/feedcard.dart';
import '../components/header.dart';

class HomePage extends GetView<MyController> {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        width: 0,
      ),
    );
    Color secondbackgroundColor = Theme.of(context).cardColor;

    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Scaffold(
              body: Obx(
                ()=> Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(children: [
                    const Header(),
                    SizedBox(height: 35),
                    Visibility(
                      visible: controller.isTaped.value,
                      child: Expanded(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 5),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(232, 243, 243, 243),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const CircleAvatar(
                                        radius: 15,
                                        backgroundImage:
                                            AssetImage('assets/avatar5.png'),
                                      ),
                                      const CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.transparent,
                                        child: Text(
                                          '.',
                                          style:
                                              TextStyle(color: Colors.transparent),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'AliJaber',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.grey),
                                      ),
                                      const SizedBox(height: 5),
                                      TextFormField(
                                        controller:
                                            controller.searchcontroller.value,
                                        cursorColor: Colors.blue,
                                        decoration: InputDecoration(
                                          hintText: "search",
                                          counterText: '',
                                          contentPadding:
                                              EdgeInsetsDirectional.only(
                                                  start: 10.0),
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400],
                                              fontSize: 14),
                                          focusedBorder: InputBorder.none,
                                          border: null,
                                          enabledBorder: InputBorder.none,
                                        ),
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400),
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
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor: const Color.fromARGB(255, 206, 206, 206).withAlpha(180),
                                    child: Icon(
                                      Icons.edit,
                                      color: Color.fromARGB(249, 141, 141, 141),
                                      size: 17,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 15),
                            Expanded(child: buidListItems())
                          ],
                        ),
                      ),
                      replacement: Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: 100,
                                height: 60,
                                child: Image.asset(
                                  'assets/linkologo.png',
                                ))
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
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
                                  onResult: (text) => controller
                                      .mesgcontroller.value.text = text,
                                  onListening: (isListening) {
                                    controller.isListening.value = isListening;
                                  }),
                              child: AvatarGlow(
                                  child: Icon(Icons.graphic_eq,
                                      color: Colors.grey),
                                  endRadius: 40,
                                  animate: controller.isListening.value,
                                  glowColor: mainColor)),
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 94, 94, 94),
                              fontSize: 14),
                          fillColor: Color.fromARGB(255, 231, 231, 231),
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: Divider.createBorderSide(context),
                              borderRadius: BorderRadius.circular(100)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: Divider.createBorderSide(context),
                              borderRadius: BorderRadius.circular(100)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: mainColor),
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        ),
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.isTaped.value =  !controller.isTaped.value;
                      },
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: mainColor,
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
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
        return ItemCard(item: ite, index: index);
      },
      separatorBuilder: (context, index) => SizedBox(
        height: 20,
      ),
    );
  }
}
