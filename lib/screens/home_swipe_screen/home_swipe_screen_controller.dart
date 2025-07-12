import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';

class HomeSwipeScreenController extends GetxController {
  int currentIndex = 0;
  final CardSwiperController swiperController = CardSwiperController();
  List<String> cards2 = ['One', 'Two', 'Three', 'Four'];
  updateIndexOnSwipe(int index) {
    if (index < cards2.length) {
      currentIndex = index;
    }
  }
}
