class StringUtils{
  static String totalEarning = "Total Earning";
  static String balanceValue = "\$30,050.56";
  static String hiddenText = "*** ***";
  static String quickAccess = "Quick Access";
  static String bookings = "Bookings";
  static String finance = "Finance";
  static String messages = "Messages";
  static String pastBookings = "Past Bookings";
  static String seeAll = "See all";
  static String laxadHotel = "Laxad Hotels";
  static String ekoHotel = "Eko Hotels";
  static String orientalHotel = "Oriental Hotels";
  static String address = "14, Adetola str, Lagos.";
  static String address2 = "14, Adetokumbo Ademola str, Lekki Lagos.";
  static String address3 = "14, Ozumba Mbadiwe str, VI Lagos.";
  static String date = "Sun 2nd - Wed 5th, June -";
  static String nights = "3 nights";
  static String freeB = "Free breakfast";
  static String freeC = "Free cancellation before 18:00 on 3rd...";
  static String price = "Total: NGN35,000";
  static String price2 = "Total: NGN650,000";
  static String price3 = "Total: NGN150,000";
  static String confirmed = "Confirmed";
  static String available = "Available";
  static String dot = "•";
  static String welcome = "Welcome back!";
  static String book = "Book services and stays effortlessly.";
  static String email = "E-mail";
  static String password = "Password";
  static String fpassword = "Forgot Password?";
  static String rememberme = "Remember Me";
  static String donthave = "Don’t have an account?";
  static String remember = "Remember your details?";
  static String signup = "Sign up";
  static String or = "or";
  static String logw = "Login With";
  static String fpass = "Forgot Password";
  static String fname = "First name";
  static String lname = "Last name";
  static String phoneN = "Phone number";
  static String cPass = "Confirm password";
  static String alreadyhave = "Already have an account?";
  static String login = "Login";
  static String signW = "Sign up With";
  static String rest = "Be rest assured! it happens. Please enter your email linked to your account.";
  static String checkib = "Check your inbox!!";
  static String wehave1 = "We have just sent an E-mail that contains the instructions and a reset link to ";
  static String wehave2 = ". It might a few minutes. ";
  static String entervc = "Enter Verification Code";
  static String didntreceive = "Didn’t receive OTP code?";
  static String resend = "Resend Verification Code";
  static String createANP = "Create a New Password";
  static String kindly = "Kindly ensure your password entails Kindly ensure your password entails the following.";
  static String char8 = "Minimum of 8 characters long";
  static String symbol = "Must contain symbol e.g @ \$";
  static String alpha = "Must contain alphanumeric characters e.g abc123";
  static String lorem1 = "Lorem ipsum dolor sit amet consectetur.";
  static String lorem1b = "Lorem ipsum dolor sit amet consectetur. Mollis arcu sit phasellus tristique.";
  static String lorem2 = "Lorem ipsum dolor sit .";
  static String lorem2b = "Lorem ipsum dolor sit amet consectetur. Nibh feugiat consequat ut sit in. Lacus sit neque urna vitae elit id eget.";
  static String lorem3 = "Lorem ipsum dolor sit amet consectetur.";
  static String lorem3b = "Lorem ipsum dolor sit amet consectetur. Nulla nec diam tincidunt enim mi at morbi in quis.";
  static String lorem4 = "Lorem ipsum dolor sit .";
  static String lorem4b = "Lorem ipsum dolor sit amet consectetur. Mollis arcu sit phasellus tristique.";

}

class EmailNotifier {
  String email;

  EmailNotifier(this.email);

  String get wehave => "We have just sent an E-mail that contains the instructions and a reset link to $email. It might take a few minutes.";
}