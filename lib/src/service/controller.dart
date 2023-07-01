import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linktest_app/src/model/Item.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:vibration/vibration.dart';

class MyController extends GetxController {
  Rx<List<Item>> items = Rx<List<Item>>([]);
  stt.SpeechToText speechToText = stt.SpeechToText();

  Rx<TextEditingController> searchcontroller = TextEditingController().obs;
  Rx<TextEditingController> mesgcontroller = TextEditingController().obs;
  RxBool isListening= false.obs;
  @override
  void onInit() {
    super.onInit();
    getItems();
  }

  void getItems() {
    List<Item> listofitem = [
      Item(
        itemId: '1',
        name: 'Giant Burger',
        timeTake: '30',
        phonenum: '0900000027',
        deliveryFee: 'Free',
        price: '2.00',
        imgUrl: 'assets/burger1.jpg',
        slug: 'burger',
        isfavorite: false,
      ),
      Item(
        itemId: '2',
        name: 'Super Burger',
        timeTake: '20',
        phonenum: '0900000027',
        deliveryFee: 'Free',
        price: '3.00',
        imgUrl: 'assets/burger2.jpg',
        slug: 'burger',
        isfavorite: true,
      ),
      Item(
        itemId: '2',
        name: 'Pizza ',
        timeTake: '20',
        phonenum: '0900000027',
        deliveryFee: 'Free',
        price: '2.60',
        imgUrl: 'assets/pizza1.jpg',
        slug: 'burger',
        isfavorite: true,
      ),
      Item(
        itemId: '2',
        name: 'Super Burger',
        timeTake: '20',
        phonenum: '0900000027',
        deliveryFee: 'Free',
        price: '3.00',
        imgUrl: 'assets/fresh.jpg',
        slug: 'burger',
        isfavorite: false,
      ),
      Item(
        itemId: '2',
        name: 'Indonesian Style Baked ',
        timeTake: '20',
        phonenum: '0900000027',
        deliveryFee: 'Free',
        price: '3.00',
        imgUrl: 'assets/chiken.jpg',
        slug: 'burger',
        isfavorite: false,
      ),
      Item(
        itemId: '2',
        name: 'Chicken Tikka.',
        timeTake: '20',
        phonenum: '0900000027',
        deliveryFee: 'Free',
        price: '3.00',
        imgUrl: 'assets/chiken2.jpg',
        slug: 'burger',
        isfavorite: false,
      ),
      Item(
        itemId: '2',
        name: 'Vegetable, fruit',
        timeTake: '20',
        phonenum: '0900000027',
        deliveryFee: 'Free',
        price: '3.80',
        imgUrl: 'assets/salad.jpg',
        slug: 'burger',
        isfavorite: false,
      ),
      Item(
        itemId: '2',
        name: 'green salads',
        timeTake: '22',
        phonenum: '0900000027',
        deliveryFee: 'Free',
        price: '2.20',
        imgUrl: 'assets/salad2.jpg',
        slug: 'burger',
        isfavorite: false,
      ),
      Item(
        itemId: '2',
        name: 'Marmite Chicken.',
        timeTake: '20',
        phonenum: '0900000027',
        deliveryFee: 'Free',
        price: '3.00',
        imgUrl: 'assets/chiken3.jpg',
        slug: 'burger',
        isfavorite: false,
      ),
    ];
    for (var element in listofitem) {
      items.value.add(element);
    }
  }
  Function updateFavIcon(int index,bool val) {
    items.value[index].isfavorite=!val;
    return (){
      updateFavIcon(index, val);
    };

      print('KKKKKKKKKKKK isfvec ${items.value[index].isfavorite}');
      print('KKKKKKKKKKKK name ${items.value[index].name}');
      print('KKKKKKKKKKKK  id ${items.value[index].itemId}');
      print('KKKKKKKKKKKK va; ${val}');
  }
  void vibrateOnSplashScreen() async{
    Vibration.vibrate(duration: 100);
  }
}
