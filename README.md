# Jarkom-Modul-3-E09-2021

## Nama Anggota Kelompok :
## 1. Dwinanda Bagoes Ansori (05111940000010) 
## 2. Bayu Eka Prawira (05111940000042) 
## 3. Kelvin Andersen (05111940000080)

</br>

### 1. Luffy bersama Zoro berencana membuat peta tersebut dengan kriteria EniesLobby sebagai DNS Server, Jipangu sebagai DHCP Server, Water7 sebagai Proxy Server

Untuk menjadikan EnniesLobby sebagai DNS Server, install bind9 pada node EnniesLobby dengan command ```apt-get install bind9``` \
![no 1(1)](https://user-images.githubusercontent.com/81345045/141390860-475be4b7-583c-479f-9b76-0c02f5c4ccb5.png) \
Untuk menjadikan Jipangu sebagai DHCP Server, install DHCP server pada node Jipangu dengan command ```apt-get install isc-dhcp-server```. Kemudian edit file ```/etc/default/isc-dhcp-server``` dengan mengubah interface menjadi eth0. \
![no 1(2)](https://user-images.githubusercontent.com/81345045/141390909-83ba2750-631a-4cbc-a9b6-7d63a5aa3683.png) \
![no 1(3)](https://user-images.githubusercontent.com/81345045/141390941-3b3c9d7a-3a1b-4f84-acb6-b7662243bc06.png) \
Untuk menjadikan Water7 sebagai Proxy Server, install squid pada node EnniesLobby dengan command ```apt-get install squid``` \
![no 1(4)](https://user-images.githubusercontent.com/81345045/141390994-ca55e08d-df87-428a-898c-d3299ba4e69c.png)

### 2. dan Foosha sebagai DHCP Relay. Luffy dan Zoro menyusun peta tersebut dengan hati-hati dan teliti.

Untuk menjadikan Foosha sebagai DHCP Relay, install DHCP relay pada router Foosha dengan command ```apt-get install isc-dhcp-relay```. Kemudian edit file ```/etc/default/isc-dhcp-relay``` dengan mengubah server yang menuju IP Jipangu sebagai DHCP Server dan interface menjadi ```eth1 eth2 eth3```. \
![no 2(1)](https://user-images.githubusercontent.com/81345045/141391066-f037a75a-ad07-43f0-983d-5caab98bf0fd.png) \
![no 2(2)](https://user-images.githubusercontent.com/81345045/141391117-06a89397-39bc-44b8-bb65-e64240c9972c.png) 

### 3. Ada beberapa kriteria yang ingin dibuat oleh Luffy dan Zoro, yaitu:
### a. Semua client yang ada HARUS menggunakan konfigurasi IP dari DHCP Server.

Ubah network configuration dari setiap client dengan mengatur interface menjadi eth0 dan menambahkan konfigurasi DHCP pada eth0 \
![no 3(1)](https://user-images.githubusercontent.com/81345045/141391172-c7b47ce8-32c7-462e-93c5-ad6c9dde339f.png) \
![no 3(2)](https://user-images.githubusercontent.com/81345045/141391203-b8846c9a-5469-40b5-bb5e-6d9524f647a6.png) \
![no 3(3)](https://user-images.githubusercontent.com/81345045/141391314-ac782eba-e972-462d-ac58-7cf44c95b077.png) \
![no 3(4)](https://user-images.githubusercontent.com/81345045/141391352-da5b8765-13fb-44ca-a253-e0ad499f7101.png) 

### b. Client yang melalui Switch1 mendapatkan range IP dari [prefix IP].1.20 - [prefix IP].1.99 dan [prefix IP].1.150 - [prefix IP].1.169

Edit file /etc/dhcp/dhcpd.conf pada node Jipangu dengan menambahkan subnet yang mengarah pada switch 1 dan eth 0 (192.204.1.0), serta mengatur range nya menjadi ```192.204.1.20 192.204.1.99``` dan ```192.204.1.150 192.204.1.169``` \
![no 3(5)](https://user-images.githubusercontent.com/81345045/141391386-b2410a57-f7ce-4767-ba5a-e0b973eebd40.png) \
Kemudian lakukan pengecekkan pada IP client. \
![no 3(6)](https://user-images.githubusercontent.com/81345045/141391413-f4ed733f-cdb9-4191-8f82-b85689474395.png) \
Alabasta mendapatkan IP 192.204.1.21, sesuai dengan range yang telah diatur. 

### 4. Client yang melalui Switch3 mendapatkan range IP dari [prefix IP].3.30 - [prefix IP].3.50

Edit file /etc/dhcp/dhcpd.conf pada node Jipangu dengan menambahkan subnet yang mengarah pada switch 3 dan eth 0 (192.204.3.0), serta mengatur range nya menjadi ```192.204.3.30 192.204.3.50```. \
![no 4(1)](https://user-images.githubusercontent.com/81345045/141391546-5fb77e25-b51e-42f0-a932-54761bf46e3f.png) \
Kemudian lakukan pengecekkan pada IP client. \
![no 4(2)](https://user-images.githubusercontent.com/81345045/141391568-a386f700-866b-42f6-9d3d-fc7b0274b390.png) \
Tottoland mendapatkan IP 192.204.3.30 sesuai dengan range yang telah diatur. 

### 5. Client mendapatkan DNS dari EniesLobby dan client dapat terhubung dengan internet melalui DNS tersebut.

Jalankan perintah ```iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.204.0.0/16``` pada router Foosha. Lalu jalankan command``` echo nameserver 192.168.122.1 > /etc/resolv.conf``` pada node EnniesLobby. \
![no 5(1)](https://user-images.githubusercontent.com/81345045/141391615-2c42322f-fc26-445e-8e44-c5f1cfa6c036.png) \
![no 5(2)](https://user-images.githubusercontent.com/81345045/141391641-f72ca260-44f4-47d7-b065-855786b7e093.png) \
Edit file /etc/dhcp/dhcpd.conf pada node Jipangu dengan mengatur option domain-name-server pada masing-masing subnet menuju ke IP DNS Server (EnniesLobby). \
![no 5(3)](https://user-images.githubusercontent.com/81345045/141391680-28219b3b-be3b-4bee-bd86-ba78262d66fa.png) \
![no 5(4)](https://user-images.githubusercontent.com/81345045/141391828-d32cd38e-26e5-4405-b71a-6c082073ea92.png) \
Kemudian lakukan pengetesan pada masing-masing client. \
![no 5(5)](https://user-images.githubusercontent.com/81345045/141391862-2394cff4-c691-4f90-832e-50403c82d119.png) \
Client Alabasta (melalui switch 1) berhasil menjalankan command ```apt-get update```. \
![no 5(6)](https://user-images.githubusercontent.com/81345045/141391899-db56545f-de98-427f-bb64-a148b5bd1bb7.png) \
Client Tottoland (melalui switch 3) berhasil menjalankan command ```apt-get update```.

### 6. Lama waktu DHCP server meminjamkan alamat IP kepada Client yang melalui Switch1 selama 6 menit sedangkan pada client yang melalui Switch3 selama 12 menit. Dengan waktu maksimal yang dialokasikan untuk peminjaman alamat IP selama 120 menit.

Edit file /etc/dhcp/dhcpd.conf pada node Jipangu dengan mengatur default-lease-time menjadi 360 dan max-lease-time menjadi 7200 pada subnet 192.204.1.0 \
![no 6(1)](https://user-images.githubusercontent.com/81345045/141392004-7d387fe0-adbb-49be-aae8-84f4fb809474.png) \
Kemudian edit juga file /etc/dhcp/dhcpd.conf pada node Jipangu dengan mengatur default-lease-time menjadi 720 dan max-lease-time menjadi 7200 pada subnet 192.204.3.0 \
![no 6(2)](https://user-images.githubusercontent.com/81345045/141392054-01818d3d-16fb-4e92-b6f1-f1d0fc913449.png) \
Kemudian lakukan pengetesan pada client Alabasta (subnet 192.204.1.0) \
![no 6(3)](https://user-images.githubusercontent.com/81345045/141392111-9fa36492-bf3c-49fc-9b30-ce06dba6e46a.png) \
Dan juga lakukan pengetesan pada client Tottoland (subnet 192.204.3.0) \
![no 6(4)](https://user-images.githubusercontent.com/81345045/141392143-7912cb96-c8ad-4664-ada4-05c89a8f68dd.png) 

### 7. Luffy dan Zoro berencana menjadikan Skypie sebagai server untuk jual beli kapal yang dimilikinya dengan alamat IP yang tetap dengan IP [prefix IP].3.69

### 8. Loguetown digunakan sebagai client Proxy agar transaksi jual beli dapat terjamin keamanannya, juga untuk mencegah kebocoran data transaksi. Pada Loguetown, proxy harus bisa diakses dengan nama jualbelikapal.yyy.com dengan port yang digunakan adalah 5000

### 9. Agar transaksi jual beli lebih aman dan pengguna website ada dua orang, proxy dipasang autentikasi user proxy dengan enkripsi MD5 dengan dua username, yaitu luffybelikapalyyy dengan password luffy_yyy dan zorobelikapalyyy dengan password zoro_yyy

### 10. Transaksi jual beli tidak dilakukan setiap hari, oleh karena itu akses internet dibatasi hanya dapat diakses setiap hari Senin-Kamis pukul 07.00-11.00 dan setiap hari Selasa-Jum’at pukul 17.00-03.00 keesokan harinya (sampai Sabtu pukul 03.00)

Pada Node ```Water7``` yang berlaku sebagai proxy server, kita membuat file baru yang digunakan untuk mengeset waktu-waktu yang di mana proxy memperbolehkan mengakses internet. Pada permasalah ini, saya menggunakan lawan dari waktu yang diperbolehkan, yang nantinya pada konfigurasi ```squid.conf``` menggunakan **deny**, hal ini dikarenakan jika kita menggunakan waktu yang di-**allow** akan mengakibatkan *authentication* menjadi tidak berjalan. \
Pada gambar di bawah ini, yang digunakan adalah 
```conf
acl GABISA1 time S 00:00-24:00
acl GABISA2 time MT 00:00-07:00
acl GABISA3 time M 11:00-24:00
acl GABISA4 time TWH 11:00-17:00
acl GABISA5 time WH 03:00-17:00
acl GABISA6 time F 03:00-17:00
acl GABISA7 time A 03:00-24:00
```

![no 10(1)](https://user-images.githubusercontent.com/58933506/141426850-3ae53ee9-28e3-4113-968c-b4781b7cd7c9.png)

Lalu meng-**include**-kannya pada file ```squid.conf``` dan menggunakan konfigurasi **deny** agar tidak bisa diakses pada hari dan jam tersebut
```conf
http_access deny GABISA1
http_access deny GABISA2
http_access deny GABISA3
http_access deny GABISA4
http_access deny GABISA5
http_access deny GABISA6
http_access deny GABISA7
```

![no 10(2)](https://user-images.githubusercontent.com/58933506/141426943-bfd91ec3-d413-44a6-8df0-91bcc5132977.png)
![no 10(3)](https://user-images.githubusercontent.com/58933506/141426998-126192d5-1fa8-429c-8ec3-2abc684cdf47.png)

Lalu merestart ```proxy server```

![no 10(4)](https://user-images.githubusercontent.com/58933506/141427050-cbcb543c-787e-40f4-aebc-88ae6a4cd25e.png)

Kemudian mengetes pada client ```Loguetown``` yang telah terpasang proxy atau telah menjadi ```proxy client``` dengan mengeset hari dan jam yang di-**deny** oleh ```proxy server``` dan menghasilkan ```error 403 Forbidden```

![no 10(5)](https://user-images.githubusercontent.com/58933506/141427100-724adadb-77d6-4c97-b771-6cbf99c133ea.png)
![no 10(6)](https://user-images.githubusercontent.com/58933506/141427178-222052e7-45b4-441c-9946-24b151436860.png)
![no 10(7)](https://user-images.githubusercontent.com/58933506/141427226-7235fc2b-d638-4db1-b5a9-0cdff12f3af2.png)

Lalu dengan mengeset pada hari dan jam yang **tidak** di-**deny** oleh ```proxy server```, didapatkan berhasil diakses dan proses *authentication* juga bisa dilakukan dengan baik.

![no 10(8)](https://user-images.githubusercontent.com/58933506/141427273-a256d74d-ab0d-4cc0-81e5-e339c36022f4.png)
![no 10(9)](https://user-images.githubusercontent.com/58933506/141427314-af49b78c-a5ea-4a18-9566-5f8237d6c758.png)
![no 10(10)](https://user-images.githubusercontent.com/58933506/141427439-60585e1e-a7e0-49d7-a2ff-ca6bd6237909.png)


### 11. Agar transaksi bisa lebih fokus berjalan, maka dilakukan redirect website agar mudah mengingat website transaksi jual beli kapal. Setiap mengakses google.com, akan diredirect menuju super.franky.yyy.com dengan website yang sama pada soal shift modul 2. Web server super.franky.yyy.com berada pada node Skypie

Pada node ```EniesLobby```, kita menambahkan konfigurasi super.franky.e99.com seperti pada modul 2 sebelumnya. Di mana pada modul 3 ini, IP dari Skypie adalah ```192.204.3.69```

![no 11(1)](https://user-images.githubusercontent.com/58933506/141431399-fd32a8c5-5e41-415e-be40-7c3d8a6ab6f3.png)
![no 11(2)](https://user-images.githubusercontent.com/58933506/141431445-57e0315b-b8a5-4a04-aaa7-6dd41ee9fe36.png)

Pada node ```Skypie```, di file ```apache.conf``` saya menambahkan 
```
ServerName 192.204.3.69
```
agar saat melakukan restart ```apache``` tidak memunculkan tulisan warning

![no 11(3)](https://user-images.githubusercontent.com/58933506/141431542-65b0ce6f-5a36-4ff3-9ed2-6e6fe351a8d0.png)

Lalu mengubah ```nameserver``` pada ```/etc/resolv.conf``` pada node ```Water7``` menjadi IP dari node ```EniesLobby``` (192.204.2.2)

![no 11(4)](https://user-images.githubusercontent.com/58933506/141431617-e2e31ce5-02fe-4f5d-ad9a-41ca16b9c481.png)

Lalu pada file ```/etc/squid/squid.conf``` pada node ```Water7```, saya menambahkan 

```conf
acl BLACKLIST dstdomain google.com
deny_info http://super.franky.e09.com/ BLACKLIST
http_reply_access deny BLACKLIST
```
Di mana dimaksudkan untuk men-**deny** akses **menuju** google.com dan dialihkan ke super.franky.e09.com

![no 11(5)](https://user-images.githubusercontent.com/58933506/141431672-22390521-b9ea-4c8a-a84a-f6adde37cb26.png)

Lalu pada saat mengetes pada client ```Loguetown``` dengan mengakses google.com, kita akan langsung diarahkan ke http://super.franky.e09.com

![no 11(6)](https://user-images.githubusercontent.com/58933506/141431743-776a3aac-dbc5-4fbb-bda8-ad25451ad756.png)
![no 11(7)](https://user-images.githubusercontent.com/58933506/141431818-89ec0792-06a2-4e21-8364-6e461029afe2.png)
![no 11(8)](https://user-images.githubusercontent.com/58933506/141431878-e86b65ea-abeb-475b-8d22-63e8b2a8d786.png)

### 12. Saatnya berlayar! Luffy dan Zoro akhirnya memutuskan untuk berlayar untuk mencari harta karun di super.franky.yyy.com. Tugas pencarian dibagi menjadi dua misi, Luffy bertugas untuk mendapatkan gambar (.png, .jpg), sedangkan Zoro mendapatkan sisanya. Karena Luffy orangnya sangat teliti untuk mencari harta karun, ketika ia berhasil mendapatkan gambar, ia mendapatkan gambar dan melihatnya dengan kecepatan 10 kbps

Untuk bisa membatasi speed yang dimiliki oleh masing-masing user, di mana pada permasalahan kali ini adalah Luffy, maka kita mengambil data *authentication* dari file ```/etc/squid/passwd``` yang dimasukkan ke dalam file ```/etc/squid/acl-bandwith.conf``` yang di-**include** di dalam file ```/etc/squid/squid.conf```

![no 12(1)](https://user-images.githubusercontent.com/58933506/141436175-07de2587-6f47-4668-8fd7-e8e039f0630a.png)

Lalu kita menginisialisasi dengan menggunakan ```url_regex``` jenis file yang akan dilimit speed downloadnya
```conf
acl download url_regex -i \.jpg$ \.png$
```
Kemudian untuk setiap user juga dideclare variabel untuk menampung username user
```conf
acl luffy proxy_auth luffybelikapale09
acl zoro proxy_auth zorobelikapale09
```

![no 12(2)](https://user-images.githubusercontent.com/58933506/141436231-6437aaca-d861-4cd9-9e4d-949d80a5a269.png)

Lalu kita membuat 2 ```delay_pools``` untuk masing-masing user, di mana pada pool 1 dilimit speed menjadi 1250 Bytes/second yang setara dengan 10 kilobit/second. Pada konfigurasi di bawah, user ```zoro``` di-**deny** sehingga user ```zoro``` ini tidak mengalami speed limit dan hanya user ```luffy``` yang mengalami speed limit

![no 12(3)](https://user-images.githubusercontent.com/58933506/141436255-cb774d51-f3bf-4efa-b4d0-2a739a5c5ae6.png)

Pada saat melakukan testing pada client dan login menggunakan akun ```luffy```, maka dapat dilihat bahwa speed downloadnya dilimit menjadi ```1.3KB/s``` di mana setara dengan ```10kb/s```

![no 12(4)](https://user-images.githubusercontent.com/58933506/141436274-3cde663e-9944-424f-83bb-83d88b3fe53e.png)
![no 12(5)](https://user-images.githubusercontent.com/58933506/141436299-ca2f5ada-1fbf-4dcb-a554-26b5efec81e7.png)

### 13. Sedangkan, Zoro yang sangat bersemangat untuk mencari harta karun, sehingga kecepatan kapal Zoro tidak dibatasi ketika sudah mendapatkan harta yang diinginkannya

Pada file yang sama pada nomor 12, kita menambahkan konfigurasi untuk pool yang kedua untuk user ```zoro``` di mana tidak mendapat speed limit sehingga bisa mendownload file apapun dengan speed yang dia miliki. Parameter ```-1/-1``` menandakan bahwa tidak ada limit pada download speed

![no 13(1)](https://user-images.githubusercontent.com/58933506/141436552-8c825c3f-89d3-468b-b58d-edc9cf8eb5f3.png)
![no 13(2)](https://user-images.githubusercontent.com/58933506/141436401-fb1ff453-2757-4c4b-9c24-c0628c125413.png)

Ketika ditest dengan menggunakan user ```zoro``` dapat dilihat pada saat mendownload file yang sama, speed yang didapatkan adalah 3986KB/s yang menandakan tidak ada limit pada saat mendownload file

![no 13(3)](https://user-images.githubusercontent.com/58933506/141436435-fe169a0c-bd06-488a-932a-5a4193d8d9e4.png)
![no 13(4)](https://user-images.githubusercontent.com/58933506/141436463-0b5247d7-73c2-4ced-8608-6bec263534d7.png)


## Kendala

Kendala yang dialami pada pengerjaan soal shift modul 3 ini adalah, pada saat mengerjakan nomor 12 dan 13, kami mengalami kesulitan dalam mencari sumber referensi untuk konfigurasi speed limit untuk ```masing-masing``` user, dikarenakan sebelumnya belum tahu bagaimana cara mengambil informasi user yang akan dilimit speed downloadnya.