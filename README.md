# 📱 Event App – Mobile Test

## 🔹 Deskripsi

Aplikasi mobile sederhana berbasis **Flutter** dengan fitur utama:

* **Login & Auth** (simpan JWT, ambil data user `/auth/me`)
* **Events**: List Event & Event Detail (API `/events`)
* **Settings**: tampilkan FCM token (copyable) + toggle “Terima Notifikasi”
* **Firebase Cloud Messaging (FCM)**: terima notifikasi di **foreground, background, terminated**
* **Deep Link**: tap notifikasi → buka **Order Detail** (pakai `order_id` dari payload)

---

## 🔹 Tech Stack

* **Flutter**
* **Firebase** (Cloud Messaging)
* **flutter\_local\_notifications** (untuk tampilkan notif di foreground)
* **shared\_preferences** (simpan toggle setting & JWT)
* **http** (panggil API backend)

---

## 🔹 Instalasi & Setup

### 1. Clone Repository

```bash
git clone https://github.com/username/event_app.git
cd event_app
```

### 2. Install Dependency

```bash
flutter pub get
```

### 3. Firebase Setup

1. Buat project di [Firebase Console](https://console.firebase.google.com/).
2. Tambahkan Android app:

   * `package name` harus sama dengan `applicationId` di `android/app/build.gradle`.
3. Download `google-services.json` → letakkan di `android/app/`.
4. Jalankan konfigurasi FlutterFire:

   ```bash
   flutterfire configure
   ```

### 4. Jalankan Aplikasi

```bash
flutter run
```

---

## 🔹 Fitur Utama

### 🔐 Auth

* Login dengan email & password.
* Simpan JWT di local storage.
* Panggil `/auth/me` → tampilkan nama & role user.

### 📅 Events

* Ambil list event dari API `/events`.
* Klik → masuk ke detail event (`/events/{id}`).

### ⚙️ Settings

* Tampilkan **FCM Token** (bisa di-copy).
* Toggle **Terima Notifikasi** (ON/OFF).

  * OFF → token tetap ada, tapi notifikasi **tidak ditampilkan**.

### 🔔 Notifikasi

* **Foreground** → tampilkan notifikasi pakai `flutter_local_notifications`.
* **Background & Terminated** → notifikasi muncul dari sistem.
* **Tap notifikasi** → buka halaman **Order Detail** berdasarkan `order_id`.

---

## 🔹 Pengujian FCM

1. Buka **Firebase Console → Cloud Messaging**.
2. Kirim **Notification Message** → harus tampil di device.
3. Kirim **Data Message** dengan payload contoh:

   ```json
   {
     "order_id": "12345"
   }
   ```
4. Uji di tiga kondisi:

   * Foreground
   * Background
   * Terminated
5. Pastikan saat klik notif → masuk ke halaman **Order Detail** dengan ID dari payload.

---

## 🔹 Acceptance Criteria

✅ Login berhasil & JWT tersimpan
✅ List Event → detail
✅ Settings → tampilkan token FCM + toggle notif
✅ Token update saat refresh
✅ Notifikasi muncul di 3 kondisi
✅ Klik notifikasi → deep link ke Order Detail
✅ Video demo (max 15 menit) menunjukkan semua flow

---

## 🔹 Demo

🎥 [Link Video Demo](https://example.com)
