# ============================================
# Proteksi Akses Shell dengan SHA-256 + Warna
# ============================================

if [[ ! -t 0 ]] || [[ ! -t 1 ]]; then
    return
fi

# ---- Warna ANSI ----
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# ---- Konfigurasi ----
PASSWORD_HASH="8b225048d3caba62faf28e9ee35f9e50ac1bb60c0b644418715cb071dfe4f88a"
MAX_ATTEMPTS=3
attempt=0

trap 'echo -e "\n${RED}❌ Interrupted. Silakan login ulang.${NC}"; exit 1' INT TSTP

echo ""
echo -e "${CYAN}========================================${NC}"
echo -e "${CYAN}  pelan pelan abang awak ${NC}"
echo -e "${CYAN}========================================${NC}"
echo ""

while true; do
    # Matikan echo agar password tidak terlihat
    stty -echo
    echo -e -n "${YELLOW}[+] Test aja dulu bang : ${NC}"
    read input_password
    stty echo
    echo ""

    input_hash=$(echo -n "$input_password" | sha256sum | awk '{print $1}')

    if [[ "$input_hash" == "$PASSWORD_HASH" ]]; then
        echo -e "${GREEN}✅ Login berhasil, gas semangat kerja!${NC}"
        echo ""
        trap - INT TSTP
        break
    else
        attempt=$((attempt + 1))
        if [[ $attempt -ge $MAX_ATTEMPTS ]]; then
            echo -e "${RED}❌ Terlalu banyak percobaan salah. Keluar.${NC}"
            echo -e "${RED}========================================${NC}"
            exit 1
        else
            echo -e "${RED}❌ Password salah! (Percobaan ${YELLOW}$attempt${NC}/${RED}$MAX_ATTEMPTS${NC})${NC}"
            echo ""
        fi
    fi
done

unset PASSWORD_HASH input_password input_hash attempt
unset RED GREEN YELLOW BLUE CYAN NC
