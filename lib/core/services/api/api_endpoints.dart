class ApiEndpoints {
  static final String baseURL = 'https://codingarabic.online/api';

  //auth
  static final String login = '/login';
  static final String register = '/register';
  static final String forget_password = '/forget-password';
  static final String check_forget_password = '/check-forget-password';
  static final String reset_password = '/reset-password';

  //Home
  static final String slider = '/sliders';
  static final String new_arrivals = '/products-new-arrivals';
  static final String best_seller = '/products-bestseller';
  static final String all_products = '/products';

  //Wishlist
  static final String add_to_wishlist = '/add-to-wishlist';
  static final String remove_to_wishlist = '/remove-from-wishlist';
  static final String show_wishlist = '/wishlist';
}
