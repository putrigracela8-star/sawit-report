# 📘 Manual Book SawitReport

**Versi:** 1.0 — Juli 2026

---

## Daftar Isi

1. [Pendahuluan](#1-pendahuluan)
2. [Registrasi & Login](#2-registrasi--login)
3. [Dashboard](#3-dashboard)
4. [Master Data](#4-master-data)
5. [Operasional Harian](#5-operasional-harian)
6. [Manajemen User & PIN](#6-manajemen-user--pin)
7. [Payroll](#7-payroll)
8. [Budget & Biaya](#8-budget--biaya)
9. [Laporan & Export](#9-laporan--export)
10. [Laporan Otomatis (Email)](#10-laporan-otomatis-email)
11. [Backup & Restore](#11-backup--restore)
12. [Fitur Tambahan](#12-fitur-tambahan)
13. [Panel Admin (Super Admin)](#13-panel-admin-super-admin)
14. [Pemecahan Masalah](#14-pemecahan-masalah)

---

## 1. Pendahuluan

### 1.1 Tentang SawitReport

SawitReport adalah sistem informasi manajemen perkebunan kelapa sawit berbasis web yang membantu operasional harian kebun, manajemen pekerja, gudang & logistik, serta dashboard KPI per afdeling. Dirancang untuk alur kerja mandor, kerani, asisten, dan manajemen.

### 1.2 Persyaratan Sistem

| Perangkat | Keterangan |
|---|---|
| **Browser** | Chrome 90+, Firefox 90+, Edge 90+, Safari 14+ |
| **HP/Tablet** | Chrome untuk Android, Safari untuk iOS |
| **Internet** | Koneksi stabil (min 1 Mbps) |
| **Resolusi** | Minimal 360px lebar (mobile-friendly) |

### 1.3 Paket & Harga

| Fitur | GRATIS | BASIC | PREMIUM |
|---|---|---|---|
| Harga | Rp 0 | Rp 200.000/bln | Rp 400.000/bln |
| Kebun | 1 | 3 | ∞ |
| User | 3 | 5 | ∞ |
| Pekerja | 20 | 100 | ∞ |
| Histori Data | 3 bulan | 12 bulan | ∞ |
| Export Laporan | ✅ | ✅ | ✅ |
| Laporan Otomatis | ❌ | ✅ | ✅ |
| Payroll | ❌ | ❌ | ✅ |
| Backup Data | ❌ | ✅ | ✅ |
| Deteksi Anomali | ❌ | ❌ | ✅ |
| Budget vs Real Cost | ❌ | ❌ | ✅ |
| Import Data | ❌ | ✅ | ✅ |

### 1.4 Daftar Istilah

| Istilah | Arti |
|---|---|
| **Kebun** | Unit perkebunan (Estate) |
| **Afdeling** | Divisi dalam kebun (Division) |
| **Blok** | Petak lahan dalam afdeling (Block) |
| **JJG** | Janjang (fruit bunch) |
| **Brondolan** | Buah lepas (loose fruit) |
| **MA-7** | Moving Average 7 hari |
| **PinGate** | Gerbang PIN untuk akses menu |
| **Upah Harian** | Gaji berdasarkan jam kerja |
| **Upah Borongan** | Gaji berdasarkan hasil panen (JJG/brondolan) |

---

## 2. Registrasi & Login

### 2.1 Membuat Akun Baru

1. Buka **https://sawitreport.online**
2. Klik tombol **"Daftar Gratis"** pada paket GRATIS
3. Isi form pendaftaran:
   - **Nama Perusahaan** — nama kebun/perusahaan Anda
   - **Nama Lengkap** — nama admin
   - **Email** — alamat email aktif
   - **No. Telepon** — nomor WhatsApp
   - **Password** — minimal 8 karakter
4. Klik **"Daftar"**
5. Sistem akan otomatis login dan mengarahkan ke Dashboard

### 2.2 Login

1. Buka **https://sawitreport.online**
2. Klik **"Masuk"** di pojok kanan atas
3. Masukkan **Email** dan **Password**
4. Klik **"Login"**
5. Jika lupa password, hubungi admin perusahaan

### 2.3 Lupa / Reset PIN

Jika lupa PIN (MASTER/INPUT/REPORT):

1. Pada halaman **Masukkan PIN**, klik link **"Lupa PIN?"**
2. Masukkan **email terdaftar**
3. Cek inbox email untuk link reset (berlaku 30 menit)
4. Klik link, masukkan **PIN baru** (4-12 digit)
5. Klik **"Reset PIN"**
6. Kembali ke halaman login dan masuk dengan PIN baru

---

## 3. Dashboard

Dashboard adalah halaman utama setelah login yang menampilkan ringkasan KPI.

### 3.1 Kartu Ringkasan

| Kartu | Menampilkan |
|---|---|
| **Panen Hari Ini** | Total JJG, tonase (kg), brondolan (kg) |
| **Kehadiran** | Jumlah hadir / tidak hadir hari ini |
| **Stok Kritis** | Jumlah barang dengan stok di bawah minimum |
| **MTD** | Produksi bulan ini vs target |
| **YTD** | Produksi tahun ini vs target |
| **MoM** | Perbandingan bulan ini vs bulan lalu (dengan bar chart) |

### 3.2 Filter Lokasi

Gunakan dropdown **Kebun** dan **Afdeling** untuk menyaring data berdasarkan lokasi. Klik **"Terapkan"** untuk memperbarui.

### 3.3 Ranking

| Ranking | Keterangan |
|---|---|
| **Top/Bottom 5 Kebun** | Berdasarkan achievement % produksi |
| **Top/Bottom 5 Afdeling** | Berdasarkan achievement % produksi |

### 3.4 Alert

| Alert | Keterangan |
|---|---|
| **Achievement Rendah** | Kebun/afdeling dengan capaian < 90% |
| **Gap Terbesar** | Selisih real vs target terbesar (negatif) |
| **Anomali Produksi (MA-7)** | Blok dengan penurunan > 50% dari rata-rata 7 hari (hanya PREMIUM) |
| **Stok Kritis** | Barang dengan stok di bawah minimum |

### 3.5 Grafik Produksi Bulanan

Grafik batang yang membandingkan **realisasi produksi vs target** per bulan sepanjang tahun.

---

## 4. Master Data

Master Data adalah pusat konfigurasi data referensi. **Akses:** ADMIN — membutuhkan **PIN MASTER**.

### 4.1 Kebun

**Tambah Kebun:**
1. Masukkan **Kode** (unik, contoh: KBN-01)
2. Masukkan **Nama** (contoh: Kebun Sejahtera)
3. Masukkan **Lokasi** (opsional)
4. Klik **"Tambah"**

**Hapus Kebun:** Klik **"Hapus"** pada baris kebun yang ingin dihapus.

### 4.2 Afdeling

**Tambah Afdeling:**
1. Pilih **Kebun** dari dropdown
2. Masukkan **Kode** (unik per kebun, contoh: AFD-A)
3. Masukkan **Nama** (contoh: Afdeling Satu)
4. Klik **"Tambah"**

### 4.3 Blok

**Tambah Blok:**
1. Pilih **Afdeling** dari dropdown
2. Masukkan **Kode** (unik per afdeling)
3. Masukkan **Nama**
4. Masukkan **Luas (ha)** — luas lahan dalam hektar
5. Masukkan **Tahun Tanam**
6. Klik **"Tambah"**

Blok ditampilkan dalam struktur: **Kebun → Afdeling → Blok**

### 4.4 Jabatan / Regu

Digunakan untuk mengelompokkan posisi pekerja.
- **Kode:** unik (contoh: MANDOR)
- **Nama:** nama jabatan

### 4.5 Kegiatan / Pekerjaan

Digunakan untuk penugasan absensi.
- **Kode:** unik
- **Nama:** nama kegiatan
- **Kategori:** opsional

### 4.6 Kegiatan Perawatan

Digunakan untuk modul operasional perawatan.
- **Kode:** unik
- **Nama:** nama kegiatan perawatan
- **Kategori:** opsional

### 4.7 Jenis Pupuk

Digunakan untuk modul operasional pemupukan.
- **Kode:** unik
- **Nama:** nama jenis pupuk

### 4.8 Pekerja / Karyawan

**Tambah Pekerja:**
1. Masukkan **NIK** (opsional, unik)
2. Masukkan **Nama** pekerja
3. Pilih **Jenis:** TETAP / HARIAN / BORONGAN
4. Pilih **Jabatan** (opsional)
5. Pilih **Afdeling** (opsional)
6. Klik **"Tambah"**

Tabel pekerja menggunakan pagination (50 per halaman).

### 4.9 Budget Produksi Bulanan

**Tambah Budget:**
1. Pilih **Afdeling**
2. Masukkan **Tahun** (contoh: 2026)
3. Masukkan **Bulan** (angka 1-12, contoh: 7 untuk Juli)
4. Masukkan **Target (ton)** — target produksi dalam ton
5. Masukkan **Budget Biaya** (opsional):
   - Budget Panen (Rp)
   - Budget Perawatan (Rp)
   - Budget Pemupukan (Rp)
   - Budget Lain (Rp)
6. Klik **"Simpan"**

Jika data sudah ada untuk afdeling+tahun+bulan yang sama, data akan diperbarui (upsert).

### 4.10 Kalender Kerja

Digunakan untuk override hari kerja/libur (misal: libur nasional, cuti bersama).
- Default: Senin-Sabtu kerja, Minggu libur
- **Tanggal:** pilih tanggal
- **Status:** Kerja / Libur
- **Keterangan:** opsional

### 4.11 Import Data Excel

**Akses:** Menu **Import Data** di sidebar.

**Format File Excel (.xlsx):**

**Master Pekerja:**
| nik | nama | jenis | afdeling | jabatan |
|---|---|---|---|---|
| NIK001 | Budi | HARIAN | AFD-A | PEMANEN |

**Master Barang:**
| kode | nama | satuan | stok_min |
|---|---|---|---|
| BRG-01 | Pupuk NPK | kg | 100 |

**Budget Produksi:**
| tahun | bulan | afdeling | target_ton | budget_biaya_panen | budget_biaya_perawatan | budget_biaya_pemupukan | budget_biaya_lain |
|---|---|---|---|---|---|---|---|
| 2026 | 7 | AFD-A | 100 | 5000000 | 2000000 | 3000000 | 1000000 |

---

## 5. Operasional Harian

### 5.1 Panen

**Akses:** Menu **Operasional Panen** — membutuhkan **PIN INPUT**.

**Langkah-langkah:**
1. Pilih **Tanggal** (default: hari ini)
2. Pilih **Afdeling**
3. Klik **"Tampilkan"**
4. Untuk setiap blok, isi:
   - **JJG** — jumlah janjang dipanen
   - **Tonase (kg)** — berat total janjang
   - **Brondolan (kg)** — berat buah lepas
   - **Biaya** — biaya panen (opsional)
   - **Catatan** (opsional)
5. Klik **"Simpan"** per baris
6. Untuk menghapus, klik **"Hapus"**

### 5.2 Perawatan

**Akses:** Menu **Operasional Perawatan** — membutuhkan **PIN INPUT**.

**Langkah-langkah:**
1. Pilih **Tanggal**
2. Pilih **Afdeling**
3. Klik **"Tampilkan"**
4. Untuk setiap blok, isi:
   - **Kegiatan** — pilih dari dropdown kegiatan perawatan
   - **Volume** — jumlah pekerjaan
   - **Satuan** (contoh: ha, kg, unit)
   - **Biaya** — biaya perawatan (opsional)
   - **Catatan** (opsional)
5. Klik **"Simpan"**

### 5.3 Pemupukan

**Akses:** Menu **Operasional Pemupukan** — membutuhkan **PIN INPUT**.

**Langkah-langkah:**
1. Pilih **Tanggal**
2. Pilih **Afdeling**
3. Klik **"Tampilkan"**
4. Untuk setiap blok, isi:
   - **Jenis Pupuk** — pilih dari dropdown
   - **Dosis (kg/ha)** — dosis per hektar
   - **Total (kg)** — total pupuk yang digunakan
   - **Biaya** — biaya pemupukan (opsional)
   - **Catatan** (opsional)
5. Klik **"Simpan"**

### 5.4 Absensi & Penugasan

**Akses:** Menu **Absensi & Penugasan** — membutuhkan **PIN INPUT**.

**Absensi Harian:**
1. Pilih **Tanggal** dan **Afdeling**
2. Klik **"Tampilkan"**
3. Klik **"Buat absensi"** untuk membuat header absensi
4. Klik **"Tarik pekerja (auto)"** untuk menarik semua pekerja aktif afdeling
5. Untuk setiap pekerja, atur:
   - **Hadir / Tidak** — klik tombol toggle
   - **Jam Kerja** — isi jumlah jam (default 7)

**Penugasan:**
1. Pilih **Pekerja** dari dropdown
2. Pilih **Kegiatan** dari dropdown
3. Pilih **Blok** (opsional)
4. Masukkan **Catatan** (opsional)
5. Klik **"Tambah penugasan"**
6. Untuk mencatat realisasi:
   - Masukkan **JJG** — hasil panen dalam janjang
   - Masukkan **Brondolan (kg)** — hasil brondolan
   - Klik **"Simpan"**

### 5.5 Gudang & Logistik

**Akses:** Menu **Gudang & Logistik** — membutuhkan **PIN INPUT**.

**Master Barang:**
1. Masukkan **Kode** (unik)
2. Masukkan **Nama Barang**
3. **Kategori** (opsional)
4. **Satuan** (default: kg)
5. **Stok Min** — batas stok minimum (opsional)
6. **Harga Satuan** — harga per unit (opsional)
7. Klik **"Tambah barang"**

**Transaksi Masuk/Keluar:**
1. Pilih **Tanggal**
2. Pilih **Tipe:** MASUK atau KELUAR
3. Pilih **Barang** dari dropdown
4. Masukkan **Qty** — jumlah
5. Masukkan **Biaya** — total biaya transaksi (opsional)
6. Masukkan **Referensi** (opsional, contoh: PO-001)
7. Masukkan **Catatan** (opsional)
8. Klik **"Simpan"**

Stok dihitung otomatis: **Stok = Total MASUK - Total KELUAR**.
Jika stok < stokMin, tampilan akan **merah**.

---

## 6. Manajemen User & PIN

### 6.1 Role & Hak Akses

| Role | Akses |
|---|---|
| **ADMIN** | Semua akses (master data, user, backup, pengaturan) |
| **ASISTEN** | Laporan & export, payroll, budget vs cost |
| **MANAGEMENT** | Laporan & export, dashboard |
| **MANDOR** | Input operasional (panen, perawatan, pemupukan, absensi, gudang) |
| **KERANI** | Input operasional (panen, perawatan, pemupukan, absensi, gudang) |

### 6.2 Tambah User Baru

**Akses:** Menu **Manajemen User** — membutuhkan **PIN MASTER**.

1. Masukkan **Email** (unik)
2. Masukkan **Nama** (opsional)
3. Masukkan **Password** (min 8 karakter)
4. Pilih **Role** (default: KERANI)
5. Klik **"Buat User"**

### 6.3 Ubah Role User

1. Pada tabel daftar user, pilih **Role** baru dari dropdown
2. Klik **"Simpan"**

### 6.4 Hapus User

1. Klik **"Hapus"** pada baris user yang ingin dihapus
2. Konfirmasi dengan klik **"OK"**

> Anda tidak bisa menghapus atau mengubah role diri sendiri.

### 6.5 Pengaturan PIN

**Akses:** Menu **Pengaturan PIN** — membutuhkan **PIN MASTER**.

Ada 3 jenis PIN:
| PIN | Digunakan Untuk |
|---|---|
| **MASTER** | Master Data, Manajemen User, Backup, Pengaturan |
| **INPUT** | Input operasional (panen, perawatan, pemupukan, absensi, gudang) |
| **REPORT** | Laporan, Export, Payroll |

**Mengubah PIN:**
1. Masukkan **Password Login** (password akun Anda)
2. Masukkan **Master Key** (diperoleh dari super admin) — *tidak diperlukan untuk Super Admin*
3. Masukkan **PIN Baru** (4-12 digit)
4. Masukkan **Ulangi PIN**
5. Klik **"Simpan"**

### 6.6 Reset PIN via Email

Jika lupa PIN, lihat bagian [2.3 Lupa / Reset PIN](#23-lupa--reset-pin).

---

## 7. Payroll

**Akses:** Menu **Payroll** — hanya PREMIUM — membutuhkan **PIN REPORT**.

### 7.1 Set Tarif Global

1. Masukkan **Upah / Jam** (Rp) — tarif per jam kerja
2. Masukkan **Tarif JJG** (Rp) — tarif per janjang
3. Masukkan **Tarif Brondolan** (Rp/kg) — tarif per kg brondolan
4. Klik **"Simpan Tarif"**

Tarif ini digunakan untuk semua perhitungan payroll.

### 7.2 Buat Periode Payroll

1. Pilih **Tanggal Mulai (from)**
2. Pilih **Tanggal Selesai (to)**
3. Pilih **Afdeling** (opsional — kosongkan untuk semua afdeling)
4. Klik **"Buat Periode"**

Periode akan muncul dengan status **DRAFT**.

### 7.3 Generate Slip Gaji

1. Pada periode yang diinginkan, klik **"Generate Payroll"**
2. Sistem akan menghitung:
   - **Upah Harian** = total jam kerja × upah per jam
   - **Upah Borongan** = (total JJG × tarif JJG) + (total brondolan × tarif brondolan)
   - **Bonus** = dari adjustment
   - **Potongan** = dari adjustment
   - **Grand Total** = upah harian + upah borongan + bonus - potongan
3. Slip gaji akan dibuat per pekerja

### 7.4 Tambah Bonus / Potongan

1. Pada periode yang diinginkan, klik **"Tambah Adjustment"**
2. Pilih **Pekerja**
3. Pilih **Tipe:** BONUS atau POTONGAN
4. Masukkan **Jumlah (Rp)**
5. Masukkan **Catatan** (opsional)
6. Klik **"Simpan"**

Adjustment akan langsung tercermin di slip gaji.

### 7.5 Lock Periode

1. Klik **"Lock"** pada periode yang sudah selesai
2. Status berubah menjadi **LOCKED**
3. Periode LOCKED tidak bisa di-generate ulang

### 7.6 Export Slip

| Format | Cara |
|---|---|
| **Rekap CSV** | Klik **"Export Rekap (CSV)"** |
| **Slip ZIP** | Klik **"Download All Slip (ZIP)"** — berisi PDF per pekerja |
| **Slip PDF** | Klik **"Download Slip (PDF)"** per pekerja |

---

## 8. Budget & Biaya

### 8.1 Set Target Produksi

Lihat bagian [4.9 Budget Produksi Bulanan](#49-budget-produksi-bulanan).

### 8.2 Set Budget Biaya

Saat menambah/mengedit Budget Produksi Bulanan, isi kolom:
- **Budget Panen (Rp)** — anggaran biaya panen
- **Budget Perawatan (Rp)** — anggaran biaya perawatan
- **Budget Pemupukan (Rp)** — anggaran biaya pemupukan
- **Budget Lain (Rp)** — anggaran biaya lain-lain

### 8.3 Halaman Budget vs Real Cost

**Akses:** Menu **Budget vs Real Cost** — membutuhkan **PIN REPORT**.

1. Pilih **Tahun**, **Bulan** (opsional), dan **Afdeling** (opsional)
2. Halaman menampilkan:
   - **5 Kartu Ringkasan:** Total Budget, Total Real, Selisih, Realisasi %, Biaya Gudang
   - **Grafik Horizontal:** Budget vs Real per afdeling
   - **Tabel Detail:** perbandingan per afdeling (warna hijau jika ≤ budget, merah jika > budget)

Data real cost diambil dari:
- **Biaya Panen** → dari input biaya di Operasional Panen
- **Biaya Perawatan** → dari input biaya di Operasional Perawatan
- **Biaya Pemupukan** → dari input biaya di Operasional Pemupukan
- **Biaya Material** → dari transaksi gudang (tipe KELUAR)

---

## 9. Laporan & Export

**Akses:** Menu **Rekap & Export** — membutuhkan **PIN REPORT**.

### 9.1 Filter Data

1. Pilih **Tanggal Mulai (from)**
2. Pilih **Tanggal Selesai (to)**
3. Pilih **Kebun** (opsional)
4. Pilih **Afdeling** (opsional)
5. Pilih **Blok** (opsional)
6. Klik **"Terapkan"**

### 9.2 Summary Cards & Grafik

| Card | Isi |
|---|---|
| Panen | Total tonase, JJG, brondolan |
| Perawatan | Total baris perawatan |
| Pemupukan | Total baris pemupukan |
| Absensi | Hadir / Tidak hadir |
| Gudang | Total transaksi, stok kritis |

Grafik batang tersedia untuk **Produksi** dan **Pemupukan**.

### 9.3 Download PDF

Klik **"Download PDF"** untuk mendapatkan laporan PDF lengkap (7 halaman):

| Halaman | Konten |
|---|---|
| 1 | Cover + Ringkasan Eksekutif + Payroll + Produksi vs Target |
| 2 | Produksi Harian (chart + tabel) |
| 3 | Panen per Afdeling + Top 5 Blok |
| 4 | Perawatan & Pemupukan (tabel + grafik) |
| 5 | Absensi & Gudang |
| 6 | Ranking (Top/Bottom Kebun + Afdeling) |
| 7 | Tanda Tangan (Manager + Asisten) |

### 9.4 Download CSV

Klik **"Download CSV"** pada masing-masing modul:
- Panen
- Perawatan
- Pemupukan
- Absensi
- Gudang

---

## 10. Laporan Otomatis (Email)

**Akses:** Menu **Laporan Otomatis** — BASIC/PREMIUM — membutuhkan **PIN MASTER**.

### 10.1 Atur Jadwal Kirim

1. Aktifkan toggle **Aktif**
2. **Tanggal Kirim** — tanggal setiap bulan (default: 5)
3. **Jam Kirim** — jam WIB (default: 8)
4. **Email Penerima** — satu atau lebih email, pisahkan dengan koma
5. Klik **"Simpan"**

Sistem akan mengirim laporan bulanan PDF ke penerima pada tanggal & jam yang ditentukan.

### 10.2 Kirim Manual

Klik **"Kirim Sekarang"** untuk mengirim laporan langsung.

### 10.3 Riwayat Pengiriman

**Akses:** Menu **Riwayat Email**.

Tabel 20 log pengiriman terakhir:
- Waktu, Tujuan, Subjek, Status (Berhasil/Gagal), Keterangan error

**Kirim Ulang:** Klik **"Kirim Ulang"** untuk mengirim laporan bulan berjalan.

---

## 11. Backup & Restore

**Akses:** Menu **Backup Data** — BASIC/PREMIUM — membutuhkan **PIN MASTER**.

### 11.1 Download Backup ZIP

Klik **"Download ZIP Backup"** untuk mengunduh seluruh database dalam format JSON.
Berisi:
- Master data (kebun, afdeling, blok, pekerja, barang, dll)
- Data operasional (panen, perawatan, pemupukan, absensi, gudang)

### 11.2 Download Backup Excel

Klik **"Download Excel"** untuk mengunduh dalam format spreadsheet (.xlsx).

### 11.3 Restore dari File ZIP

1. Klik **"Pilih File"** dan pilih file ZIP backup
2. Klik **"Restore dari ZIP"**
3. Sistem akan melakukan upsert data (tidak menghapus data yang sudah ada)
4. Setelah selesai, ringkasan jumlah record akan ditampilkan

---

## 12. Fitur Tambahan

### 12.1 Peta Blok Interaktif

**Akses:** Menu **Peta Blok**.

Menampilkan semua blok dalam grid kartu dengan warna:
- 🟢 **Hijau** — aktivitas tinggi (≥5 transaksi 14 hari terakhir)
- 🟡 **Kuning** — aktivitas rendah (1-4 transaksi)
- ⚪ **Abu-abu** — tidak ada aktivitas

Setiap kartu menampilkan: kode, nama, luas (ha), tahun tanam, jumlah panen/perawatan/pemupukan, dan progress bar aktivitas.

Gunakan dropdown **Afdeling** untuk filter.

### 12.2 Dark Mode

Klik ikon 🌙/☀️ di pojok kanan atas untuk toggle antara mode terang dan gelap. Preferensi tersimpan otomatis.

### 12.3 Pengaturan Perusahaan

**Akses:** Menu **Pengaturan Perusahaan**.

Update profil perusahaan: Nama, Email, No. Telepon.

### 12.4 Audit Trail

**Akses:** Tersedia di halaman Master Data (bagian Audit Trail).

Mencatat semua aktivitas penting:
- Perubahan PIN
- Buat/Hapus data master
- Export laporan
- Login pengguna

Bisa difilter berdasarkan tanggal, entitas, dan aksi. Tersedia export CSV dan PDF.

### 12.5 Demo Data

**Akses:** Panel Admin → halaman Tenants → klik **"Demo Data"** pada tenant.

Menghasilkan data demo lengkap untuk testing:
- 2 Kebun, 4 Afdeling, 40 Blok
- 50 Pekerja, 20 Barang
- Data operasional 365 hari (panen, perawatan, pemupukan, absensi, gudang, penugasan)
- Budget bulanan + Payroll tarif global

---

## 13. Panel Admin (Super Admin)

**Akses:** Khusus **Super Admin** — link **"Panel Admin"** di sidebar.

### 13.1 Dashboard Admin

Statistik dan grafik:
- Total Tenant, Tenant Aktif, Total User
- Tenant Baru per Hari (grafik)
- Tenant Baru per Bulan (grafik)
- Transaksi Harian (grafik)
- Distribusi Paket (pie chart)

### 13.2 Manajemen Tenant

**Akses:** Menu **Tenants** di Panel Admin.

**Fitur:**
- Daftar semua perusahaan (tenant)
- Filter: Aktif/Nonaktif
- Generate **Demo Data** untuk tenant
- Hapus tenant

### 13.3 Generate Demo Data

1. Klik **"Demo Data"** pada tenant yang diinginkan
2. Konfirmasi (data lama akan dihapus dan diganti)
3. Tenant akan di-upgrade ke **PREMIUM** dan diisi data demo

### 13.4 Buat Tenant Baru

1. Menu **Buat Tenant**
2. Isi: Nama Perusahaan, Email, Paket
3. Klik **"Buat"**

---

## 14. Pemecahan Masalah

### 14.1 Error & Solusi Umum

| Error | Penyebab | Solusi |
|---|---|---|
| **Gagal menyimpan: Duplikat** | Kode/NIK sudah terdaftar | Gunakan kode/NIK yang berbeda |
| **Data masih dipakai relasi lain** | Data memiliki relasi ke data lain | Hapus data terkait terlebih dahulu |
| **Batas limit tercapai** | Melebihi batas paket | Upgrade paket atau hapus data lain |
| **PIN tidak valid** | PIN yang dimasukkan salah | Coba lagi atau hubungi admin |
| **Token reset PIN kedaluwarsa** | Link reset sudah 30 menit | Minta link reset baru |

### 14.2 Data Tidak Muncul

| Masalah | Solusi |
|---|---|
| **Data panen/perawatan tidak tampil** | Pastikan tanggal dan afdeling sudah benar |
| **Grafik kosong** | Pastikan ada data di periode yang dipilih |
| **Stok salah** | Periksa transaksi MASUK dan KELUAR |
| **Ranking tidak muncul** | Pastikan budget produksi sudah diisi |

### 14.3 Email Tidak Terkirim

| Masalah | Solusi |
|---|---|
| **Cek folder spam** | Email mungkin masuk folder spam |
| **Email penerima salah** | Periksa daftar penerima di Laporan Otomatis |
| **Gagal kirim** | Cek Riwayat Email untuk detail error |
| **Kirim ulang** | Gunakan tombol "Kirim Ulang" di Riwayat Email |

### 14.4 Limit Paket Tercapai

Jika melihat pesan limit, berarti Anda telah mencapai batas paket:
- **Kebun:** maksimal sesuai paket
- **User:** maksimal sesuai paket
- **Pekerja:** maksimal sesuai paket
- **Histori Data:** data lebih dari batas tidak akan ditampilkan (tapi tidak dihapus)

**Solusi:** Hubungi admin untuk upgrade paket.

---

© 2026 **SawitReport** — Semua Hak Dilindungi.
