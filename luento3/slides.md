---
theme: slidev-theme-jyu
addons:
  - slidev-addon-polls
title: "Ohjelmointi 1 – Luento 3: Muuttujat"
download: false
favicon: https://jyu-polls.dezhidki-hermes.party/jyu-logo-cover.svg
pollQr: "https://jyu-polls.dezhidki-hermes.party/vote.html"
layout: cover
---

# Ohjelmointi 1 – Luento 3

ti 8.9.2025

**Muuttujat**

---
layout: cover
---

# Luennon ohjelma

- **Muuttujat** — mikä on muuttuja, miten määritellä, sijoittaminen
- **Tietotyypit** — sisäänrakennetut tyypit, merkkijonot

---

# Poimintoja Q/A-palstalta

**Tekoälystä useampi kysymys:**

- Saa käyttää oppimisen tukena
- Ei saa käyttää suorien vastausten tekemiseen
- Tärkeintä ajatella ja opetella nekin asiat itse, mitkä tekoäly jo osaa
- Varmistat, että osaat itse arvioida milloin tekoälyn (tai jonkun toisen ihmisen) tuotokset ovat kelvollisia tarkoitukseen

---

# Poimintoja Q/A-palstalta

**Useita kysymyksiä harjoitustehtävistä — kiitos!**

Kommentit ja kysymykset voi jättää suoraan tehtävän tai tekstin kohdalle:

1. Klikkaa lohkosta
2. Klikkaa **kynäikoni**
3. Valitse **Comment** / **Note**

> Kommentti näkyy opettajalle nimelläsi, kaikille muille anonyyminä

---

# Poimintoja Q/A-palstalta

> **Q:** [...] onko jossain jotain aloittelijan opasta näille dokumentaatiosivuille, vaikka ne ovatkin hyvin erilaisia keskenään, vai pitääkö vaan räpiköidä kunnes "oppii uimaan"?

**A:**

- Ei tarvitse painia asioiden kanssa yksin: kysy ohjaajilta (Teams, pääteohjaukset)
- Kaikkea ei myös tarvitse osata jo ensimmäisellä viikolla
- Palautetta ja ehdotuksia luentoihin liittyen otetaan vastaan!

---
layout: cover
---

# Muuttujat

Miten ohjelmassa säilytetään ja käsitellään tietoa?

---

# Mikä on muuttuja

Tietokoneen muistista lohkaistu **nimetty säilytyspaikka** tiedolle.

- Muuttujaan voidaan tallentaa tietoa suorituksen ajaksi
- Muuttujan sisältämä arvo voidaan lukea
- Muuttujan tietoa voidaan muuttaa

<br>

> Vahvasti ja staattisesti tyypitetyissä kielissä (C#, Java, ...) muuttujan **tyyppi** kirjoitetaan aina koodiin näkyville.

---

# Muuttujan määrittely

```
[tyyppi] [nimi];
```

Esimerkkejä:

```csharp
int x;
string merkkijono;
```

<br>

- Näin kirjoitettuna syntyy muuttuja, jolla **ei ole arvoa**
- Muuttujaa voi käyttää vain sen jälkeen, kun se on **määritelty**

---

# Sijoittaminen muuttujaan

```
[nimi] = [lauseke];
```

```csharp
x = 42;
merkkijono = "kissa";
```

Yhtäsuuruusmerkki `=` on nimeltään **sijoitusoperaattori** (*assignment operator*).

Määrittely ja sijoitus yhdessä:

```
[tyyppi] [nimi] = [lauseke];
```

```csharp
int x = 42;
string merkkijono = "kissa";
```

> Tyyppi mainitaan vain **määrittelyn** yhteydessä.

---

# Muuttujan nimi

Muuttujan nimen tulee **kuvailla sisällön merkitystä** — helpottaa koodin lukemista.

Rajoitukset:
- Ei voi sisältää kielen merkitseviä erikoismerkkejä (välilyönti, `.` `;` `()`)
- Ei voi alkaa numerolla
- Ei voi olla C#:n avainsana, kuten `int`, `double` tai `public`

<br>

**Nimeämiskäytäntö C#-kielessä: `camelCase`**

```csharp
int kissoja;
int kirjojenLukumaara;
bool onkoPeliLoppu;
```

---

# Lauseke ja lause

**Lauseke** (*expression*) — koodin osa, jonka tuloksena saadaan jokin arvo:

| Lauseke | Arvo |
|---------|------|
| `67` | 67 |
| `x` | 42 (jos x = 42) |
| `1 + 1` | 2 |
| `Console.ReadLine()` | käyttäjän syöte |

<br>

**Lause** (*statement*) — ohjelman itsenäinen suoritettava osa, usein päättyy `;`

```csharp
x + x        // lauseke, EI lause
x = x + 1;  // lause, sisältää lausekkeen x + 1
```

---
layout: two-cols-header
---

# Pohdinta: mikä on muuttujan arvo?

Mikä on `toka`-muuttujan arvo **viimeisen rivin** suorittamisen jälkeen?

::left::

```csharp
int eka = 1;
int toka = 2;
int tmp;
tmp = toka;
toka = eka;
eka = tmp;
```

::right::

<Poll :compact="true" :questions="[
  { type: 'quiz', question: 'Mikä on toka-muuttujan arvo viimeisen rivin jälkeen?', options: ['1', '2', '0', 'Virhe'], answer: 0 },
]" />

---

# Vakio

```
const [tyyppi] [nimi] = [arvo];
```

```csharp
const int Sormia = 2;
const string VERSIO = "1.0";
```

- "Annetaan nimi" arvolle
- Kääntäjä "korvaa" vakion nimen sen arvolla käännösvaiheessa
- Voi sisältää literaaleja, muita vakioita tai laskutoimituksia
- **Arvoa ei voi muuttaa** määrittelyn jälkeen

---
layout: cover
---

# Tietotyypeistä

Minkä tyyppistä tietoa muuttujaan voidaan tallentaa?

---

# Tietotyypeistä

**Tietotyyppi** kertoo, mitä tietoa ohjelmassa oleva data esittää.

Tietotyyppi:
- **määrittää** paljonko tilaa datan tallentamiseen tarvitaan
- **määrittää** mitä asioita datalla voi tehdä (esim. laskutoimitukset)

<br>

C#-kielessä on:
- **Sisäänrakennettuja tietotyyppejä** (*built-in types*) — käytettävissä kaikissa ohjelmissa
- **Itsetehtyjä tietotyyppejä** (*custom types*) — esim. Jypelin `GameObject`, `PhysicsObject`, `Color`

---

# Sisäänrakennetut tietotyypit

| C#-tyyppi | Selitys | Koko | Arvoalue |
|-----------|---------|------|----------|
| `bool` | kaksiarvoinen tyyppi | 1 (8) bit | `true` tai `false` |
| `char` | yksi merkki | 16 bit | kaikki Unicode-merkit, esim. `'a'`, `'6'`, `'👨‍💻'` |
| `int` | kokonaisluku | 32 bit | −2 147 483 648 .. 2 147 483 647 |
| `double` | liukuluku | 64 bit | noin 15 desimaalin tarkkuus |

<br>

> Taulukko kaikista alkeistietotyypeistä: kurssimonisteessa luku **7.2**.

---

# Quiz: tietotyypit

<Poll :questions="[
  { type: 'quiz', question: 'Millä tietotyypillä tallennat arvon true tai false?', options: ['int', 'string', 'bool', 'char'], answer: 2 },
  { type: 'quiz', question: 'Kuinka monta bittiä int-tyyppi vie muistissa?', options: ['8', '16', '32', '64'], answer: 2 },
]" />

---

# Merkkijonot — string

Olennainen sisäänrakennettu tyyppi: **`string`**

- Esittää jonon merkkejä
- Literaali kirjoitetaan lainausmerkkeihin

```csharp
string nimi = "Meikä";
int ika = 42;

// Yhdistäminen +-operaattorilla
Console.WriteLine("Olen " + nimi + ", " + ika + " v.");

// Interpolaatio
Console.WriteLine($"Olen {nimi}, {ika} v.");
```

Molemmat tulostavat: `Olen Meikä, 42 v.`

---

# Esimerkki: lumiukko

Aiemmin luennolla tehtiin lumiukko Jypelillä:

```csharp
Camera.ZoomToLevel(); // tai Camera.ZoomToAllObjects()
Level.Background.Color = Color.Black;

GameObject alapallo = new GameObject(2 * 100, 2 * 100, Shape.Circle);
alapallo.X = 0;
alapallo.Y = Level.Bottom + 200;
Add(alapallo);
```

---

# Esimerkki: lumiukko (jatkuu)

```csharp
GameObject vartalo = new GameObject(2 * 50, 2 * 50, Shape.Circle);
vartalo.X = 0;
vartalo.Y = alapallo.Y + 100 + 50;
Add(vartalo);

GameObject paa = new GameObject(2 * 30, 2 * 30, Shape.Circle);
paa.X = 0;
paa.Y = vartalo.Y + 50 + 30;
Add(paa);
```

Huomaa: jokainen muuttuja (`alapallo`, `vartalo`, `paa`) on tyyppiä `GameObject`.

---

# Quiz: lauseke vs. lause

<Poll :questions="[
  { type: 'quiz', question: 'Kumpi seuraavista on lause (statement)?', options: ['x + 1', 'x = x + 1;', 'Console.ReadLine()', '42'], answer: 1 },
  { type: 'choice', question: 'Mikä seuraavista on kelvollinen muuttujan nimi C#:ssa?', options: ['1muuttuja', 'muuttuja nimi', 'double', 'kirjojenMaara'] },
]" />

---

# Mitä seuraavaksi?

**Seuraavalla luennolla:**

- 📦 **Aliohjelmat** (funktiot)

<br>

> Kysymyksiä? Kommentit TIMiin tai kysy ohjaajilta Teamsissa / pääteohjausajalla.
