# Autókereskedés SQL Adatbázis
A feladatot készítette: **Csontos Roland – FJU9QR**

## 🎯 Megvalósítás célja

Az adatbázis célja egy **átlátható és normalizált** rendszer kialakítása, amely egyszerre támogatja:

- az értékesítések és szervizelési műveletek nyomon követését,
- az ügyfelek és értékesítők kezelését,
- üzleti elemzéseket (pl. ki volt a legeredményesebb eladó, melyik típus fogy a legjobban).

A rendszer **3NF normalizációs szintig** lett megtervezve, hogy elkerüljük a redundanciát és az anomáliákat.

---

## 🧱 Adatmodell és döntéshozatali logika

---

### 1. `cars` – Autók táblája

Az autók adatainak rögzítése, beleértve a márkát, típust, évjáratot, árat és egyedi azonosítót.

| Oszlop | Típus | Leírás |
|-------|-------|--------|
| `car_id` | INT, PK | Egyedi azonosító |
| `brand` | VARCHAR | Autó márkája |
| `model` | VARCHAR | Autó típusa |
| `year` | INT | Gyártási év |
| `price` | DECIMAL | Listaár |
| `is_sold` | BOOLEAN | Az autó el lett-e adva |

Az autók tábla az alapkészlet struktúráját tárolja. Az `is_sold` mező opcionális, mivel az eladások követését a `sales` tábla biztosítja. Ez a mező csak gyors szűrésre szolgálhat. 

---

### 2. `customers` – Ügyfelek táblája

Ügyfelek adatainak tárolása a későbbi marketing vagy ügyfélszolgálati célokra.

| Oszlop | Típus | Leírás |
|-------|-------|--------|
| `customer_id` | INT, PK | Egyedi azonosító |
| `name` | VARCHAR | Vevő neve |
| `email` | VARCHAR | Email-cím |
| `phone` | VARCHAR | Telefonszám |

Minden vevőhöz több vásárlás vagy szervizelési rekord is kapcsolódhat, ezért azonosítót rendeltünk hozzájuk. Így az ügyféltörténet teljesen követhető.

---

### 3. `salespersons` – Értékesítők táblája

Az értékesítők adatainak és teljesítményszintjük nyilvántartása.

| Oszlop | Típus | Leírás |
|--------|--------|--------|
| `salesperson_id` | INT, PK | Egyedi azonosító |
| `name` | VARCHAR | Értékesítő neve |
| `phone` | VARCHAR | Telefonszám |
| `level` | INT (1-5) | Értékesítő szintje (tapasztalat/alapján) |

A `level` mező alapján statisztikát tudunk készíteni arról, hogy milyen szintű értékesítők teljesítenek jobban.

---

### 4. `sales` – Eladási tranzakciók

Az autóeladások rögzítése, ideértve az eladott autót, a vevőt, az értékesítőt, az eladás idejét és árát.

| Oszlop | Típus | Leírás |
|--------|--------|--------|
| `sale_id` | INT, PK, AI | Egyedi azonosító |
| `car_id` | INT, FK | Eladott autó |
| `customer_id` | INT, FK | Vevő |
| `salesperson_id` | INT, FK | Értékesítő |
| `sale_date` | DATE | Eladás dátuma |
| `sale_price` | DECIMAL | Eladási ár |

Minden eladás konkrét eseményként kerül rögzítésre. Ez a tábla a legfontosabb kapcsolati csomópont, amely más táblák kulcsait összevonja.

---

### 5. `service` – Szervizelési események táblája

Ez a tábla a szervizelések eseményeit tartalmazza – függetlenül attól, hogy az autó el lett-e már adva. Segítségével nyomon követhetők a hibák, javítások és időpontok.

| Oszlop | Típus | Leírás |
|--------|--------|--------|
| `service_id` | INT, PK | Egyedi szervizazonosító |
| `car_id` | INT, FK | A szervizelt autó |
| `service_date` | DATE | A szervizelés időpontja |
| `description` | TEXT | Szerviz részletezése |
| `cost` | DECIMAL | A szerviz költsége |

Fontos volt, hogy az autó értékesítése után is lehessen rögzíteni problémákat (garanciális ügyek, hibák, karbantartás). Ez a tábla biztosítja a későbbi statisztikai vagy minőségellenőrzési lehetőségeket. Egy autóhoz több szervizrekord is tartozhat, ezért 1:N kapcsolat van a `cars` tábla felé.
