## Page Folders in Login Page & Register Page & Forgot Password Page

<h3>Page Intro</h3>

1. intro_page.dart (Page Utama)
2. login_or_register_page.dart => Melihat database (firebase) bahwa akun sudah terdaftar atau belum
3. auth_page.dart => Jika sudah memiliki account maka menampilkan page Home,
   Jika belum memiliki account maka menampilkan page login

<h3>Page Login</h3>

1. login_page.dart (Page Utama)
2. my_button.dart = Desain button login
3. my_textfield_email.dart = Desain input data login (email)
4. my_textfield.dart = Desain input data login (password)
5. square_tile.dart = Desain Button Login with google
6. auth_service.dart = Login / Registrasi melalui button google

<h3>Page Forgot Password</h3>

1. forgot_pw_page.dart (Page Utama)
2. my_button.dart = Desain button login
3. my_textfield_email.dart = Desain input data login (email)

<h3>Page Register</h3>

1. register_page.dart (Page Utama)
2. my_button.dart = Desain button register
3. my_textfield_email.dart = Desain input data login (email)
4. my_textfield.dart = Desain input data login (password)
5. square_tile.dart = Desain Button register with google
6. auth_service.dart = Login / Registrasi melalui button google

## Page Folders in Home Page & Cart Page & Transaksi Page

<h3>Page Home</h3>

1. home_page.dart (Page Utama)
2. bottom_nav_bar.dart = Membuat desain navbar yang berada di bawah
3. about_page.dart = Untuk menghubungkan home page dengan About page (button)
4. cart_page.dart = Untuk menghubungkan home page dengan cart page (button)
5. shop_page.dart = Untuk menghubungkan home page dengan Shop page (button)
6. drawer_list = Desain Drawer yang akan dihubungkan ke home page dan about page

<h3>Page Shop</h3>

1. shop_page.dart (Page Utama)
2. shoe_tile.dart = Membuat desain tampilan pada shop page lalu di hubungkan dengan shop page
3. shoe.dart = membuat tipe data category berdasarkan product

<h3>Page Cart</h3>

1. cart_page.dart (Page Utama)
2. cart_item.dart = Membuat desain tampilan pada cart page lalu di hubungkan dengan cart page
3. cart.dart = Database yang dihubungkan dengan shoe.dart yang berdasarkan category

## Maintance Update

1. checkout_page.dart = fix ui
2. transaksi_page.dart = fix ui
3. fix to system = add to cart, checkout, all
