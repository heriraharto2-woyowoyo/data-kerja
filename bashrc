# ============================================
# Proteksi Akses Shell dengan SHA-256
# ============================================


if [[ ! -t 0 ]] || [[ ! -t 1 ]]; then
    return
fi

PASSWORD_HASH="8b225048d3caba62faf28e9ee35f9e50ac1bb60c0b644418715cb071dfe4f88a"

MAX_ATTEMPTS=3
attempt=0

trap 'echo ""; echo "❌ Interrupted. Silakan login ulang."; exit 1' INT TSTP

echo ""
echo "========================================"
echo "  pelan pelan abang awak "
echo "========================================"
echo ""

while true; do

    stty -echo
    read -p "[+] Masukkan Passwordnya Dulu: " input_password
    stty echo
    echo ""


    input_hash=$(echo -n "$input_password" | sha256sum | awk '{print $1}')

    if [[ "$input_hash" == "$PASSWORD_HASH" ]]; then
        echo ""
        echo "✅ Login berhasil, gas semangat kerja!"
        echo ""

        trap - INT TSTP
        break
    else
        attempt=$((attempt + 1))
        if [[ $attempt -ge $MAX_ATTEMPTS ]]; then
            echo ""
            echo "❌ Terlalu banyak percobaan salah. Keluar."
            echo "========================================"
            exit 1
        else
            echo ""
            echo "❌ Password salah! (Percobaan $attempt/$MAX_ATTEMPTS)"
            echo ""
        fi
    fi
done

unset PASSWORD_HASH input_password input_hash attempt
