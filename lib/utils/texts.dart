class AppTexts {
  static const String appName = 'Fashion App';
  static const String dontHaveAAcc = 'Don\'t have an account?';
  static const String alreadyHaveAAcc = 'Already have an account?';
  static const String singIn = 'Sing In';
  static const String singUp = 'Sing Up';
  static const String search = 'Search';
  static const String orSingIn = '------------ or sing in with ------------';
  static const String orSingUp = '------------ or sing up with ------------';
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
  static const String pageOneTitle = 'Seamless  Shopping Experience';
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
  static const List<String> titlePageOneHightedWords = ['Seamless'];
  static const List<String> titlePageTwoHightedWords = ['Fashion', 'Dreams'];
  static const List<String> titlePageThreeHightedWords = [
    'Swift',
    'Reliability'
  ];
}

class SignInScreenText {
  static const String welcomeText = 'Hi! Welcome back, you\'ve been missed';
  static const String forgetPassword = 'Forget Password ? ';
  static const String waitSingingIn = 'Please Wait ...';

}

class CreateAccountScreenText {
  // main
  static const String createAccountTextTitle = 'Create Account';
  static const String createAccountWelcomeText =
      'Fill your information below or register with social account';
  static const String agreeWith = 'Agree with ';
  static const String termsAndCondition = 'Terms & Condition';
  //verification
  static const String verifyCodeTitle = 'Verify Code';
  static const String verifyCodeWelcomeText =
      'Please enter the code we just sent to email';
  static const String dontReceiveOtp = 'Didn\'t receive OTP?';
  static const String resendCode = '\nResend Code';
  //New Password
  static const String newPasswordTitle = 'New Password';
  static const String newPasswordWelcomeText =
      'Your new password must be differed from previously used';

  //Complete Your Profile
  static const String completeYourProfileTitle = 'Complete Your Profile';
  static const String completeYourProfileWelcomeText =
      'Don\'t worry, only you can see your personal data. No one else will be able to see it.';
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

class SearchScreenText {
  static const String pageTitle = 'Search';
  static const String noFound = 'Nothing Found';
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
  static const String verify = 'Verify';
  static const String newPassword = 'Create New Password';
  static const String completeProfile = 'Complete Profile';
  static const String remove = 'Yes, Remove';
  static const String cancel = 'Cancel';
}

class FutureBuilderText {
  static const String loading = ' Please Wait Loading .... ';
}

class PopMessages {
  //Wishlist
  static const String addItemWishList = 'Item added to wishlist';
  static const String removedItemWishList = 'Item removed from wishlist';
  //Cart
  static const String itemExistCart = 'Item already exist';
  static const String addItemCart = 'Item added to Cart';
  static const String removedItemCart = 'Item removed from Cart';
  static const String deleteFromCart = 'Remove from Cart?';
  //login & singup
  static const String loginSuccessful = 'Login Successful';
  static const String loginFailed =
      'Your Email/Username and Password don\'t match';
  //Error
  static const String error = 'Error';
  static const String agreeWith =
      'You need to agree with our terms and conditions';
}

class TextfieldText {
  //Name
  static const String nameHeading = 'Name';
  static const String nameHint = 'Enter your full name';
  static const String nameValidationOne = 'Please enter your name';

  //Email
  static const String emailHeading = 'Email or Username';
  static const String emailHint = 'Enter your email or username';
  static const String emailValidationOne =
      'Please enter your email or username';
  static const String emailValidationTwo = 'Please enter a valid email';

  //Phone
  static const String phoneHeading = 'Phone';
  static const String phoneHint = '123456789';
  static const String phoneValidationOne = 'Please enter phone number';

  //Passwords
  ///Login password
  static const String passwordHeading = 'Password';
  static const String passwordHint = 'Enter your password';
  static const String passwordValidationOne = 'Please enter your password';

  //Passwords
  ///New & confirm passwords
  static const String newPasswordHeading = 'New Password';
  static const String newPasswordHint = 'Enter your new password';
  static const String newPasswordValidationOne =
      'Please enter your new password';
  static const String newPasswordValidationTwo =
      'Password must be at least 8 characters long';
  static const String newPasswordValidationThree =
      'Password must contain at least one uppercase letter';
  static const String newPasswordValidationFour =
      'Password must contain at least one number';
  static const String newPasswordValidationFive =
      'Password must contain at least one special character';

  static const String confirmPasswordHeading = 'Confirm Password';
  static const String confirmPasswordHint = 'Enter your new password again';
  static const String confirmPasswordValidationOne =
      'Please enter your new password again';
  static const String confirmPasswordValidationTwo = 'Password Don\'t match';
}

extension StringCaps on String {
  String get capitalize => this[0].toUpperCase() + substring(1);
}
