# ===================================

## Page Folders in Login Page & Register Page & Forgot Password Page

# ===================================

<h3>Page Intro ( FIX )</h3>

1. intro_page.dart (Page Utama)
2. login_or_register_page.dart => Melihat database (firebase) bahwa akun sudah terdaftar atau belum
3. auth_page.dart => Jika sudah memiliki account maka menampilkan page Home,
   Jika belum memiliki account maka menampilkan page login

<h3>Page Login ( FIX )</h3>

1. login_page.dart (Page Utama)
2. my_button.dart = Desain button login
3. my_textfield_email.dart = Desain input data login (email)
4. my_textfield.dart = Desain input data login (password)
5. square_tile.dart = Desain Button Login with google
6. auth_service.dart = Login / Registrasi melalui button google

<h3>Page Forgot Password ( FIX )</h3>

1. forgot_pw_page.dart (Page Utama)
2. my_button.dart = Desain button login
3. my_textfield_email.dart = Desain input data login (email)

<h3>Page Register ( FIX )</h3>

1. register_page.dart (Page Utama)
2. my_button.dart = Desain button register
3. my_textfield_email.dart = Desain input data login (email)
4. my_textfield.dart = Desain input data login (password)
5. square_tile.dart = Desain Button register with google
6. auth_service.dart = Login / Registrasi melalui button google

# ===================================

## Page Folders in Home Page & Cart Page & Transaksi Page

# ===================================

<h3>Page Home ( FIX )</h3>

1. home_page.dart (Page Utama)
2. bottom_nav_bar.dart = Membuat desain navbar yang berada di bawah
3. about_page.dart = Untuk menghubungkan home page dengan About page (button)
4. cart_page.dart = Untuk menghubungkan home page dengan Cart page (button)
5. shop_page.dart = Untuk menghubungkan home page dengan Shop page (button)
6. transaksi_page.dart = Untuk menghubungkan home page dengan transaksi page (button)
7. drawer_list = Desain Drawer yang akan dihubungkan ke home page dan about page
8. product.dart = Structure pengambilan data product dari firebase (firestore)

<h3>Page Shop ( FIX )</h3>

1. shop_page.dart (Page Utama)
2. shoe_tile.dart = Membuat desain tampilan pada shop page lalu di hubungkan dengan shop page
3. shoe.dart = membuat tipe data category berdasarkan product
4. all_product_page.dart = Menghubungkan ke menu all products page

<h3>All Product ( FIX )</h3>

1. all_product_page.dart (Page Utama)
2. all_product_tile.dart = ui card product yang akan di hubungkan ke all_product_page.dart

# ===================================

<h3>Page Cart ( MAINTANCE )</h3>

1. cart_page.dart (Page Utama)
2. cart_item.dart = Membuat desain tampilan pada cart page lalu di hubungkan dengan cart page
3. cart.dart = Database yang dihubungkan dengan shoe.dart yang berdasarkan category
4. checkout_page.dart = Button untuk menampilkan page checkout

<h3>Checkout (cart page)</h3>

1. checkout_page.dart (Page Utama)
2. success_buy.dart = Button untuk menampilkan page success buy

<h3>Success Buy (cart page)</h3>

1. success_buy.dart (Page Utama)
2. home_page.dart = Button untuk menampilkan page home

# ===================================

<h3>Page Transaction ( MAINTANCE )</h3>

1. transaksi_page.dart (Page Utama)
2. transaksi_item.dart = UI Product | Transaction Page

# ===================================

<h3>( MAINTANCE )</h3>

1. cart_page.dart = Error Price \* Quantity
2. checkout_page.dart = menghubungkan data product yang di checkout lalu menambahkan ke dalam database transaction
3. transaksi_page.dart = menghubungkan transaksi page pembeli dengan transaksi page admin
