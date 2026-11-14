from pptx import Presentation
from pptx.util import Inches, Pt
from pptx.dml.color import RGBColor
from pptx.enum.text import PP_ALIGN
from pptx.enum.shapes import MSO_SHAPE

prs = Presentation()
prs.slide_width = Inches(13.333)
prs.slide_height = Inches(7.5)

GREEN_DARK = RGBColor(0x06, 0x4E, 0x3B)
GREEN_MID = RGBColor(0x05, 0x9C, 0x69)
GREEN_LIGHT = RGBColor(0xD1, 0xFA, 0xE5)
CREAM = RGBColor(0xFF, 0xF7, 0xED)
WHITE = RGBColor(0xFF, 0xFF, 0xFF)
DARK = RGBColor(0x1C, 0x19, 0x17)
GRAY = RGBColor(0x52, 0x52, 0x5B)
YELLOW = RGBColor(0xFC, 0xD3, 0x4D)

def add_bg(slide, color):
    bg = slide.background
    fill = bg.fill
    fill.solid()
    fill.fore_color.rgb = color

def add_shape_bg(slide, color, left, top, width, height):
    shape = slide.shapes.add_shape(MSO_SHAPE.RECTANGLE, left, top, width, height)
    shape.fill.solid()
    shape.fill.fore_color.rgb = color
    shape.line.fill.background()
    return shape

def add_text_box(slide, left, top, width, height, text, font_size=18, color=DARK, bold=False, alignment=PP_ALIGN.LEFT):
    txBox = slide.shapes.add_textbox(left, top, width, height)
    tf = txBox.text_frame
    tf.word_wrap = True
    p = tf.paragraphs[0]
    p.text = text
    p.font.size = Pt(font_size)
    p.font.color.rgb = color
    p.font.bold = bold
    p.font.name = "Calibri"
    p.alignment = alignment
    return txBox

def add_accent_line(slide, left, top, width=Inches(1.5)):
    shape = slide.shapes.add_shape(MSO_SHAPE.RECTANGLE, left, top, width, Pt(4))
    shape.fill.solid()
    shape.fill.fore_color.rgb = GREEN_MID
    shape.line.fill.background()
    return shape

def add_bullets(slide, left, top, width, height, items, font_size=16, color=DARK):
    txBox = slide.shapes.add_textbox(left, top, width, height)
    tf = txBox.text_frame
    tf.word_wrap = True
    for i, item in enumerate(items):
        p = tf.paragraphs[0] if i == 0 else tf.add_paragraph()
        p.text = item
        p.font.size = Pt(font_size)
        p.font.color.rgb = color
        p.font.name = "Calibri"
        p.space_after = Pt(6)
    return txBox

# ═══════════════════════ SLIDE 1 — TITLE ═══════════════════════
slide = prs.slides.add_slide(prs.slide_layouts[6])
add_bg(slide, GREEN_DARK)
add_shape_bg(slide, GREEN_MID, Inches(0), Inches(0), Inches(0.3), prs.slide_height)
add_text_box(slide, Inches(1.5), Inches(1.5), Inches(10), Inches(1.2), "SAWITREPORT", 48, WHITE, True)
add_accent_line(slide, Inches(1.5), Inches(2.8))
add_text_box(slide, Inches(1.5), Inches(3.2), Inches(10), Inches(1), "Sistem Manajemen Perkebunan Kelapa Sawit", 28, GREEN_LIGHT)
add_text_box(slide, Inches(1.5), Inches(4.5), Inches(10), Inches(0.8), "Rapi  ·  Cepat  ·  Siap Audit  ·  24/7", 20, WHITE)
add_text_box(slide, Inches(1.5), Inches(6.0), Inches(10), Inches(0.5), "https://sawitreport.vercel.app", 16, GREEN_LIGHT)

# ═══════════════════════ SLIDE 2 — APA ITU ═══════════════════════
slide = prs.slides.add_slide(prs.slide_layouts[6])
add_bg(slide, WHITE)
add_shape_bg(slide, GREEN_DARK, Inches(0), Inches(0), Inches(0.3), prs.slide_height)
add_text_box(slide, Inches(1.5), Inches(0.8), Inches(10), Inches(0.8), "Apa Itu SawitReport?", 36, GREEN_DARK, True)
add_accent_line(slide, Inches(1.5), Inches(1.6))
add_text_box(slide, Inches(1.5), Inches(2.2), Inches(10), Inches(1), "Aplikasi berbasis web untuk operasional harian perkebunan kelapa sawit.", 22, DARK)
add_bullets(slide, Inches(1.5), Inches(3.4), Inches(10), Inches(3.5), [
    "🌴  Panen — Catat janjang, brondolan, tonase per blok",
    "👥  Absensi & Penugasan — Rekap hadir & tugas pekerja harian",
    "📦  Gudang — Stok barang, transaksi, peringatan stok minimum",
    "💰  Payroll — Hitung gaji otomatis, slip PDF siap cetak",
    "📊  Dashboard KPI — Ranking afdeling, grafik budget vs real",
    "📄  Laporan — Export PDF / CSV siap audit",
], 18, DARK)

# ═══════════════════════ SLIDE 3 — FITUR ═══════════════════════
slide = prs.slides.add_slide(prs.slide_layouts[6])
add_bg(slide, WHITE)
add_shape_bg(slide, GREEN_DARK, Inches(0), Inches(0), Inches(0.3), prs.slide_height)
add_text_box(slide, Inches(1.5), Inches(0.5), Inches(10), Inches(0.8), "Fitur Unggulan", 36, GREEN_DARK, True)
add_accent_line(slide, Inches(1.5), Inches(1.3))

features = [
    ("Dashboard KPI", "Produksi, kehadiran, stok kritis,\nranking MTD/YTD dalam 1 halaman."),
    ("Manajemen Panen", "JJG, brondolan, tonase per blok.\nTarget bulanan & deteksi tren."),
    ("Absensi & Pekerja", "Hadir/tidak, penugasan per afdeling.\nTetap, harian, borongan."),
    ("Gudang", "Barang masuk/keluar, stok minimum,\nperingatan otomatis."),
    ("Payroll", "Periode gaji, slip PDF/ZIP,\nbonus & potongan."),
    ("Laporan", "Export CSV & PDF.\nData siap audit kapan saja."),
]

card_w = Inches(3.8)
card_h = Inches(2.6)
start_x = Inches(1.5)
start_y = Inches(2.0)
gap_x = Inches(0.4)
gap_y = Inches(0.3)

for i, (title, desc) in enumerate(features):
    col = i % 3
    row = i // 3
    x = start_x + col * (card_w + gap_x)
    y = start_y + row * (card_h + gap_y)
    card = slide.shapes.add_shape(MSO_SHAPE.ROUNDED_RECTANGLE, x, y, card_w, card_h)
    card.fill.solid()
    card.fill.fore_color.rgb = CREAM if row == 0 else RGBColor(0xF0, 0xFD, 0xF4)
    card.line.color.rgb = GREEN_LIGHT
    card.line.width = Pt(1)
    add_text_box(slide, x + Inches(0.3), y + Inches(0.25), card_w - Inches(0.6), Inches(0.6), title, 18, GREEN_DARK, True)
    add_text_box(slide, x + Inches(0.3), y + Inches(0.95), card_w - Inches(0.6), Inches(1.4), desc, 14, GRAY)

# ═══════════════════════ SLIDE 4 — KENAPA ═══════════════════════
slide = prs.slides.add_slide(prs.slide_layouts[6])
add_bg(slide, GREEN_DARK)
add_shape_bg(slide, GREEN_MID, Inches(0), Inches(0), Inches(0.3), prs.slide_height)
add_text_box(slide, Inches(1.5), Inches(0.6), Inches(10), Inches(0.8), "Kenapa SawitReport?", 36, WHITE, True)

problems = [
    "Data berserakan di Excel & kertas",
    "Laporan telat & manual",
    "Sulit pantau KPI real-time",
    "Stok gudang tidak terkontrol",
    "Data tidak siap audit",
]
solutions = [
    "Satu sistem terpusat, data real-time",
    "Rekap otomatis dalam hitungan detik",
    "Dashboard visual dengan grafik & ranking",
    "Peringatan stok minimum otomatis",
    "Catatan audit log lengkap",
]

for i, (prob, sol) in enumerate(zip(problems, solutions)):
    y = Inches(2.0) + i * Inches(0.9)
    add_text_box(slide, Inches(1.5), y, Inches(5.2), Inches(0.7), f"❌  {prob}", 18, YELLOW)
    add_text_box(slide, Inches(7), y, Inches(5.5), Inches(0.7), f"✅  {sol}", 18, GREEN_LIGHT)

add_text_box(slide, Inches(1.5), Inches(6.8), Inches(10), Inches(0.5), "Dari kebun, untuk kebun — dibangun untuk operasional yang nyata.", 16, WHITE)

# ═══════════════════════ SLIDE 5 — KEAMANAN ═══════════════════════
slide = prs.slides.add_slide(prs.slide_layouts[6])
add_bg(slide, WHITE)
add_shape_bg(slide, GREEN_DARK, Inches(0), Inches(0), Inches(0.3), prs.slide_height)
add_text_box(slide, Inches(1.5), Inches(0.8), Inches(10), Inches(0.8), "Keamanan & Privasi", 36, GREEN_DARK, True)
add_accent_line(slide, Inches(1.5), Inches(1.6))
add_bullets(slide, Inches(1.5), Inches(2.3), Inches(10), Inches(4), [
    "🔐  Login dengan email & password terenkripsi (bcrypt)",
    "🔑  PIN multi-level: Master, Input, Report",
    "👤  Role-based access: ADMIN, ASISTEN, MANDOR, KERANI, MANAGEMENT",
    "📋  Catatan audit log untuk setiap perubahan data",
    "🖥️  Berjalan di VPS sendiri — data 100% milik Anda",
    "🔒  Opsi HTTPS dengan SSL Let's Encrypt",
], 20, DARK)

# ═══════════════════════ SLIDE 6 — SIAPA ═══════════════════════
slide = prs.slides.add_slide(prs.slide_layouts[6])
add_bg(slide, WHITE)
add_shape_bg(slide, GREEN_DARK, Inches(0), Inches(0), Inches(0.3), prs.slide_height)
add_text_box(slide, Inches(1.5), Inches(0.8), Inches(10), Inches(0.8), "Untuk Siapa?", 36, GREEN_DARK, True)
add_accent_line(slide, Inches(1.5), Inches(1.6))

audiences = [
    ("Manajemen / Owner", "Pantau KPI real-time dari HP — tanpa harus ke lapangan"),
    ("Asisten / Mandor", "Input data harian cepat, rekap otomatis"),
    ("Kerani / Admin", "Kelola gudang, absensi, dan penggajian dalam satu sistem"),
    ("Auditor", "Data rapi, berjejak, siap diperiksa kapan saja"),
]

for i, (role, desc) in enumerate(audiences):
    y = Inches(2.5) + i * Inches(1.1)
    add_text_box(slide, Inches(1.5), y, Inches(5), Inches(0.5), role, 22, GREEN_DARK, True)
    add_text_box(slide, Inches(1.8), y + Inches(0.5), Inches(9), Inches(0.5), desc, 16, GRAY)

# ═══════════════════════ SLIDE 7 — MULAI ═══════════════════════
slide = prs.slides.add_slide(prs.slide_layouts[6])
add_bg(slide, GREEN_DARK)
add_shape_bg(slide, GREEN_MID, Inches(0), Inches(0), Inches(0.3), prs.slide_height)
add_text_box(slide, Inches(1.5), Inches(1.2), Inches(10), Inches(0.8), "Mulai Sekarang", 36, WHITE, True)
add_accent_line(slide, Inches(1.5), Inches(2.0))
add_text_box(slide, Inches(1.5), Inches(2.5), Inches(10), Inches(0.6), "1.  Sewa VPS Windows Server 2022", 22, WHITE)
add_text_box(slide, Inches(1.5), Inches(3.3), Inches(10), Inches(0.6), "2.  Setup SawitReport — 20 menit siap pakai", 22, WHITE)
add_text_box(slide, Inches(1.5), Inches(4.1), Inches(10), Inches(0.6), "3.  Mulai input data & pantau dari mana saja", 22, WHITE)
add_text_box(slide, Inches(1.5), Inches(5.3), Inches(10), Inches(0.5), "👉  https://manage.digirdp.com/aff.php?aff=827", 20, YELLOW)
add_text_box(slide, Inches(1.5), Inches(5.8), Inches(10), Inches(0.5), "📧  Info & bantuan: sawitreport@gmail.com", 18, GREEN_LIGHT)

# ═══════════════════════ SLIDE 8 — CLOSING ═══════════════════════
slide = prs.slides.add_slide(prs.slide_layouts[6])
add_bg(slide, WHITE)
add_shape_bg(slide, GREEN_DARK, Inches(0), Inches(0), prs.slide_width, Inches(3.5))
add_text_box(slide, Inches(1), Inches(1.0), Inches(11), Inches(1), "SawitReport", 44, WHITE, True, PP_ALIGN.CENTER)
add_text_box(slide, Inches(1), Inches(2.0), Inches(11), Inches(0.8), "Sistem Manajemen Perkebunan Kelapa Sawit", 24, GREEN_LIGHT, alignment=PP_ALIGN.CENTER)
add_text_box(slide, Inches(1), Inches(2.8), Inches(11), Inches(0.5), "Rapi  ·  Cepat  ·  Siap Audit  ·  24/7", 18, WHITE, alignment=PP_ALIGN.CENTER)
add_text_box(slide, Inches(1), Inches(4.5), Inches(11), Inches(0.6), "https://sawitreport.vercel.app", 22, GREEN_DARK, True, PP_ALIGN.CENTER)
add_text_box(slide, Inches(1), Inches(5.2), Inches(11), Inches(0.5), "https://manage.digirdp.com/aff.php?aff=827", 18, GREEN_MID, alignment=PP_ALIGN.CENTER)
add_text_box(slide, Inches(1), Inches(6.0), Inches(11), Inches(0.5), "sawitreport@gmail.com", 16, GRAY, alignment=PP_ALIGN.CENTER)

output_path = "D:\\SAWITREPORT\\SawitReport-Presentasi.pptx"
prs.save(output_path)
print(f"OK: {output_path}")
