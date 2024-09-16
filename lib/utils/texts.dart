class AppTexts {
  static const String appName = 'Fashion App';
  static const String dontHaveAAcc = 'Don\'t have an account?';
  static const String alreadyHaveAAcc = 'Already have an account?';
  static const String singIn = 'Sing In';
  static const String singUp = 'Sing Up';
  static const String search = 'Search';
  static const String orSingIn = '------------ or sing in with ------------';
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
}

class CreateAccountScreenText {
  static const String createAccountText = 'Create Account';
  static const String welcomeText =
      'Fill your information below or register with social account';
  static const String agreeWith = 'Agree with';
  static const String termsAndCondition = 'Terms & Condition';
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
  static const String total = 'Total Cost';
}

class MyWishListScreenText {
  static const String pageTitle = 'My Wishlist';
  static const String emptyWishlist = 'No Favorite';
}

class ProfileScreenText {
  static const String pageTitle = 'Profile';
  static const String username = 'Saad ur Rehman';
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
  static const String checkout = 'Proceed To Checkout';
}

class FutureBuilderText {
  static const String loading = ' Please Wait Loading .... ';
}

class ToastMessages {
  //Wishlist
  static const String addItemWishList = 'Item added to wishlist';
  static const String removedItemWishList = 'Item removed from wishlist';
  //Cart
  static const String itemExistCart = 'Item already exist';
  static const String addItemCart = 'Item added to Cart';
  static const String removedItemCart = 'Item removed from Cart';
  //Error
  static const String error = 'Error';
}

class TextfieldText {
  //Name
  static const String nameHeading = 'Name';
  static const String nameHint = 'Enter your full name';
  static const String nameValidationOne = 'Please enter your name';

  //Email
  static const String emailHeading = 'Email';
  static const String emailHint = 'Enter your email';
  static const String emailValidationOne = 'Please enter your email';
  static const String emailValidationTwo = 'Please enter a valid email';
  //Passwords
  ///Login password
  static const String passwordHeading = 'Password';
  static const String passwordHint = 'Enter your password';
  static const String passwordValidationOne = 'Please enter your password';
}

extension StringCaps on String {
  String get capitalize => this[0].toUpperCase() + substring(1);
}
