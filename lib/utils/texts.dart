class AppTexts {
  static const String appName = 'Fashion App';
  static const String dontHaveAAcc = 'Don\'t have an account?';
  static const String alreadyHaveAAcc = 'Already have an account?';
  static const String singIn = 'Sing In';
  static const String singUp = 'Sing Up';
  static const String search = 'Search';
}

/////////////////
//Screens Texts//
/////////////////

class WelcomeScreenText {
  static const String buttonText = 'Let\'s Get Started';
  static const String title = 'The Fashion App That Makes You Look Your Best';
  static const String subtitle =
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.';
  static const List<String> hightedWords = ['Fashion', 'App'];
}

class OnBoardingScreenText {
  //titles
  static const String pageOneTitle = 'Shameless Shopping Experience';
  static const String pageTwoTitle = 'WishList: Where Fashion Dreams Begins';
  static const String pageThreeTitle = 'Swift and Reliability Delivery';
  //subtitles
  static const String pageOneSubtitle =
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.';
  static const String pageTwoSubtitle =
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.';
  static const String pageThreeSubtitle =
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.';
  //Highlited Words
  static const List<String> titlePageOneHightedWords = ['Shameless'];
  static const List<String> titlePageTwoHightedWords = ['Fashion', 'Dreams'];
  static const List<String> titlePageThreeHightedWords = [
    'Swift',
    'Reliability'
  ];
}

class SignInScreenText {
  static const String welcomeText = 'Hi! Welcome back, you\'ve been missed';
  static const String forgetPassword = 'Forget Password ? ';
  static const String orSingIn = '------------ or sing in with ------------';
}

class HomeScreenText {
  static const String location = 'Location';
  static const String dropDownMenuItemOne = 'New York , USA';
  static const String headingCategory = 'Category';
  static const String headingFlashSale = 'Flash Sale';
  static const String closingIn = 'Closing in';
}

class ProductScreenText {
  static const String pageTitle = 'Product Details';
  static const String productDetailsTitle = 'Product Details';
  static const String sizeTitle = 'Select Size';
  static const String sizeColor = 'Select Color';
  static const String totalPrice = 'Total Price';
}

class MyCartScreenText {
  static const String pageTitle = 'My Cart';
  static const String emptyCart = 'Your Cart is Empty';
  static const String hintTextTextFelid = 'Promo Code';
  static const String subTotal = 'Sub-Total';
  static const String delivery = 'Delivery';
  static const String discount = 'Discount';
  static const String total = 'Total';
}

class MyWishListScreenText {
  static const String pageTitle = 'My Wishlist';
}
///////////////////
//Widgets texts //
///////////////////

class ButtonText {
  static const String singUp = ' Sing Up ';
  static const String singIn = ' Sing In ';
  static const String skip = 'Skip ';
  static const String next = 'Next ';
  static const String cart = 'Cart ';
  static const String shopNow = 'Shop Now ';
  static const String seeAll = 'See All';
  static const String addToCart = 'Add To Cart';
  static const String apply = 'Apply';
}

class FutureBuilderText {
  static const String loading = ' Please Wait Loading .... ';
}

class ToastMessages {
  static const String addItemWishList = 'Item added to wishlist';
  static const String removedItemWishList = 'Item removed from wishlist';
  static const String itemExistCart = 'Item already exist';
  static const String addItemCart = 'Item added to Cart';
  static const String removedItemCart = 'Item removed from Cart';
  static const String error = 'Error';
}

extension StringCaps on String {
  String get capitalize => this[0].toUpperCase() + substring(1);
}
