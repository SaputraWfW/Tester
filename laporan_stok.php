<?php
require_once __DIR__ . '/vendor/autoload.php';
require_once 'koneksi.php';

// Fungsi helper query
function query($query) {
    global $conn;
    $result = mysqli_query($conn, $query);
    $rows = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $rows[] = $row;
    }
    return $rows;
}

// Ambil data produk
$data = query("SELECT p.*, c.category_name 
               FROM products p 
               JOIN categories c ON p.category_id = c.id 
               ORDER BY p.product_name ASC");

$mpdf = new \Mpdf\Mpdf(['format' => 'A4-L']);

$html = '
<!DOCTYPE html>
<html>
<head>
    <style>
        body { font-family: sans-serif; }
        h1, h3 { text-align: center; margin-bottom: 5px; }
        table { width: 100%; border-collapse: collapse; margin-top: 10px; }
        th { background-color: #4e73df; color: white; padding: 10px; font-size: 12px; }
        td { padding: 8px; font-size: 11px; border: 1px solid #ccc; }
        tr:nth-child(even) { background-color: #f2f2f2; }
        .text-center { text-align: center; }
        .text-right { text-align: right; }
        .stok-aman { color: green; font-weight: bold; }
        .stok-minim { color: red; font-weight: bold; }
        img { width: 50px; height: 50px; object-fit: cover; }
    </style>
</head>
<body>
    <h1>Nama Sistem</h1>
    <hr>
    <h3>LAPORAN STOK BARANG</h3>
    <table>
        <thead>
            <tr>
                <th>No</th>
                <th>Gambar</th>
                <th>Kode</th>
                <th>Nama Produk</th>
                <th>Kategori</th>
                <th>Harga</th>
                <th>Stok</th>
                <th>Min. Stok</th>
                <th>Status</th>
                <th>Tanggal Dibuat</th>
            </tr>
        </thead>
        <tbody>';

$no = 1;
foreach ($data as $row) {
    $harga = "Rp " . number_format($row['price'], 0, ',', '.');
    
    // Logika Status
    if ($row['stock'] <= $row['min_stock']) {
        $status = '<span class="stok-minim">Stok Minim</span>';
    } else {
        $status = '<span class="stok-aman">Aman</span>';
    }

    // Cek Gambar
    $gambarPath = 'produk_img/' . $row['gambar'];
    if (!empty($row['gambar']) && file_exists($gambarPath)) {
        $gambarHtml = '<img src="' . $gambarPath . '">';
    } else {
        $gambarHtml = '-';
    }

    $html .= '
        <tr>
            <td class="text-center">' . $no++ . '</td>
            <td class="text-center">' . $gambarHtml . '</td>
            <td>' . $row['product_code'] . '</td>
            <td>' . $row['product_name'] . '</td>
            <td>' . $row['category_name'] . '</td>
            <td class="text-right">' . $harga . '</td>
            <td class="text-center">' . $row['stock'] . '</td>
            <td class="text-center">' . $row['min_stock'] . '</td>
            <td class="text-center">' . $status . '</td>
            <td class="text-center">' . date('d-m-Y', strtotime($row['created_at'])) . '</td>
        </tr>';
}

$html .= '</tbody></table></body></html>';

$mpdf->WriteHTML($html);
$mpdf->Output('laporan_stok_barang.pdf', 'I');
?>