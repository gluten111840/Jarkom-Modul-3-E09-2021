# Jarkom-Modul-3-E09-2021

## Nama Anggota Kelompok :
## 1. Dwinanda Bagoes Ansori (05111940000010) 
## 2. Bayu Eka Prawira (05111940000042) 
## 3. Kelvin Andersen (05111940000080)

</br>

### 1. Luffy bersama Zoro berencana membuat peta tersebut dengan kriteria EniesLobby sebagai DNS Server, Jipangu sebagai DHCP Server, Water7 sebagai Proxy Server

Untuk menjadikan EnniesLobby sebagai DNS Server, install bind9 pada node EnniesLobby dengan command ```apt-get install bind9```
![no 1(1)](https://user-images.githubusercontent.com/81345045/141390860-475be4b7-583c-479f-9b76-0c02f5c4ccb5.png) \
Untuk menjadikan Jipangu sebagai DHCP Server, install DHCP server pada node Jipangu dengan command ```apt-get install isc-dhcp-server```. Kemudian edit file ```/etc/default/isc-dhcp-server``` dengan mengubah interface menjadi eth0.
![no 1(2)](https://user-images.githubusercontent.com/81345045/141390909-83ba2750-631a-4cbc-a9b6-7d63a5aa3683.png) \
![no 1(3)](https://user-images.githubusercontent.com/81345045/141390941-3b3c9d7a-3a1b-4f84-acb6-b7662243bc06.png) \
Untuk menjadikan Water7 sebagai Proxy Server, install squid pada node EnniesLobby dengan command ```apt-get install squid```
![no 1(4)](https://user-images.githubusercontent.com/81345045/141390994-ca55e08d-df87-428a-898c-d3299ba4e69c.png)

### 2. dan Foosha sebagai DHCP Relay. Luffy dan Zoro menyusun peta tersebut dengan hati-hati dan teliti.

Untuk menjadikan Foosha sebagai DHCP Relay, install DHCP relay pada router Foosha dengan command ```apt-get install isc-dhcp-relay```. Kemudian edit file ```/etc/default/isc-dhcp-relay``` dengan mengubah server yang menuju IP Jipangu sebagai DHCP Server dan interface menjadi ```eth1 eth2 eth3```. \
![no 2(1)](https://user-images.githubusercontent.com/81345045/141391066-f037a75a-ad07-43f0-983d-5caab98bf0fd.png) \
![no 2(2)](https://user-images.githubusercontent.com/81345045/141391117-06a89397-39bc-44b8-bb65-e64240c9972c.png) 

### 3. Ada beberapa kriteria yang ingin dibuat oleh Luffy dan Zoro, yaitu:
### a. Semua client yang ada HARUS menggunakan konfigurasi IP dari DHCP Server.

Ubah network configuration dari setiap client dengan mengatur interface menjadi eth0 dan menambahkan konfigurasi DHCP pada eth0 
![no 3(1)](https://user-images.githubusercontent.com/81345045/141391172-c7b47ce8-32c7-462e-93c5-ad6c9dde339f.png) \
![no 3(2)](https://user-images.githubusercontent.com/81345045/141391203-b8846c9a-5469-40b5-bb5e-6d9524f647a6.png) \
![no 3(3)](https://user-images.githubusercontent.com/81345045/141391314-ac782eba-e972-462d-ac58-7cf44c95b077.png) \
![no 3(4)](https://user-images.githubusercontent.com/81345045/141391352-da5b8765-13fb-44ca-a253-e0ad499f7101.png) 

### b. Client yang melalui Switch1 mendapatkan range IP dari [prefix IP].1.20 - [prefix IP].1.99 dan [prefix IP].1.150 - [prefix IP].1.169

Edit file /etc/dhcp/dhcpd.conf pada node Jipangu dengan menambahkan subnet yang mengarah pada switch 1 dan eth 0 (192.204.1.0), serta mengatur range nya menjadi ```192.204.1.20 192.204.1.99``` dan ```192.204.1.150 192.204.1.169```
![no 3(5)](https://user-images.githubusercontent.com/81345045/141391386-b2410a57-f7ce-4767-ba5a-e0b973eebd40.png) \
Kemudian lakukan pengecekkan pada IP client. 
![no 3(6)](https://user-images.githubusercontent.com/81345045/141391413-f4ed733f-cdb9-4191-8f82-b85689474395.png) \
Alabasta mendapatkan IP 192.204.1.21, sesuai dengan range yang telah diatur. 

### 4. Client yang melalui Switch3 mendapatkan range IP dari [prefix IP].3.30 - [prefix IP].3.50

Edit file /etc/dhcp/dhcpd.conf pada node Jipangu dengan menambahkan subnet yang mengarah pada switch 3 dan eth 0 (192.204.3.0), serta mengatur range nya menjadi ```192.204.3.30 192.204.3.50```. \
![no 4(1)](https://user-images.githubusercontent.com/81345045/141391546-5fb77e25-b51e-42f0-a932-54761bf46e3f.png) \
Kemudian lakukan pengecekkan pada IP client.
![no 4(2)](https://user-images.githubusercontent.com/81345045/141391568-a386f700-866b-42f6-9d3d-fc7b0274b390.png) \
Tottoland mendapatkan IP 192.204.3.30 sesuai dengan range yang telah diatur. 

### 5. Client mendapatkan DNS dari EniesLobby dan client dapat terhubung dengan internet melalui DNS tersebut.

Jalankan perintah ```iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.204.0.0/16``` pada router Foosha. Lalu jalankan command``` echo nameserver 192.168.122.1 > /etc/resolv.conf``` pada node EnniesLobby.
![no 5(1)](https://user-images.githubusercontent.com/81345045/141391615-2c42322f-fc26-445e-8e44-c5f1cfa6c036.png) \
![no 5(2)](https://user-images.githubusercontent.com/81345045/141391641-f72ca260-44f4-47d7-b065-855786b7e093.png) \
Edit file /etc/dhcp/dhcpd.conf pada node Jipangu dengan mengatur option domain-name-server pada masing-masing subnet menuju ke IP DNS Server (EnniesLobby). \
![no 5(3)](https://user-images.githubusercontent.com/81345045/141391680-28219b3b-be3b-4bee-bd86-ba78262d66fa.png) \
![no 5(4)](https://user-images.githubusercontent.com/81345045/141391828-d32cd38e-26e5-4405-b71a-6c082073ea92.png) \
Kemudian lakukan pengetesan pada masing-masing client. 
![no 5(5)](https://user-images.githubusercontent.com/81345045/141391862-2394cff4-c691-4f90-832e-50403c82d119.png) \
Client Alabasta (melalui switch 1) berhasil menjalankan command ```apt-get update```.
![no 5(6)](https://user-images.githubusercontent.com/81345045/141391899-db56545f-de98-427f-bb64-a148b5bd1bb7.png) \
Client Tottoland (melalui switch 3) berhasil menjalankan command ```apt-get update```.

### 6. Lama waktu DHCP server meminjamkan alamat IP kepada Client yang melalui Switch1 selama 6 menit sedangkan pada client yang melalui Switch3 selama 12 menit. Dengan waktu maksimal yang dialokasikan untuk peminjaman alamat IP selama 120 menit.

Edit file /etc/dhcp/dhcpd.conf pada node Jipangu dengan mengatur default-lease-time menjadi 360 dan max-lease-time menjadi 7200 pada subnet 192.204.1.0 \
![no 6(1)](https://user-images.githubusercontent.com/81345045/141392004-7d387fe0-adbb-49be-aae8-84f4fb809474.png) \
Kemudian edit juga file /etc/dhcp/dhcpd.conf pada node Jipangu dengan mengatur default-lease-time menjadi 720 dan max-lease-time menjadi 7200 pada subnet 192.204.3.0 \
![no 6(2)](https://user-images.githubusercontent.com/81345045/141392054-01818d3d-16fb-4e92-b6f1-f1d0fc913449.png) \
Kemudian lakukan pengetesan pada client Alabasta (subnet 192.204.1.0)
![no 6(3)](https://user-images.githubusercontent.com/81345045/141392111-9fa36492-bf3c-49fc-9b30-ce06dba6e46a.png) \
Dan juga lakukan pengetesan pada client Tottoland (subnet 192.204.3.0)
![no 6(4)](https://user-images.githubusercontent.com/81345045/141392143-7912cb96-c8ad-4664-ada4-05c89a8f68dd.png) 
