---
theme: slidev-theme-jyu
addons:
  - slidev-addon-polls
title: "Ohjelmointi 1 – Luento 2"
download: false
favicon: https://jyu-polls.dezhidki-hermes.party/jyu-logo-cover.svg
pollQr: "https://jyu-polls.dezhidki-hermes.party/vote.html"
layout: cover
---

# Ohjelmointi 1 – Luento 2

Integroitu kehitysympäristö, graafinen C#-ohjelma

---

# Luennon ohjelma

- Ohjelmointi integroidussa kehitysympäristössä
- C#-ohjelman perusrakenne
- Jypeli: Rakennetaan lumiukko
- Harjoitustehtävät 1
- Kysymyksiä?

---

# Tarkennuksia eiliseen

- Ajantasaiset ohjausten ajat näkyvissä kurssin etusivulla (https://tim.pm/ohj1)
- Kaikkiin ohjauksiin saa tulla riippumatta siitä, minkä pääteohjausryhmän valitsit Sisussa
- Jos haluat poistaa tai muuttaa ryhmiä Sisussa, laita viestiä it-studyaffairs@jyu.fi
- Harjoitustyöaihetta voi alkaa miettiä; Katso Harjoitustyö-sivulla kohta 3.1 inspiraatiota varten

---

# Tarkennuksia eiliseen

> Poiminta esikyselystä (s2025): Suurin kirjoitettu ohjelma ennen Ohj1

---

# Ohjelmointi integroidussa kehitysympäristössä

- Toimivan tietokoneohjelman tuottamiseen kuuluu (1) koodin kirjoittaminen, (2) kääntäminen ja (3) ajaminen
- Koko prosessi voidaan toteuttaa samassa paikassa nk. integroidussa kehitysympäristössä (engl. integrated development environment, IDE)
  - Projektin luominen, koodin kirjoittaminen, virheiden jäljitys, kääntäminen, ajaminen
  - Oheistiedostojen linkittäminen (kuvat, äänet, …)

---

# Ohjelmointi integroidussa kehitysympäristössä

- Tämän kurssin IDE: JetBrains Rider
  - Asennusohjeet: ohjelmointi1.it.jyu.fi/tyokalut
  - Muita vaihtoehtoja voivat olla esim. Visual Studio ja VS Code

> Demo: Luodaan “Hei maailma” -projekti Riderissa ja tutkitaan sen osia.

---

# Lähdekoodi

- Lähdekoodi on tietokoneohjelman kuvaus
  - Lähdekoodi noudattaa (jonkin) ohjelmointikielen syntaksia  (kielioppi, kirjoitussäännöt, ym.)
- Koodi kirjoitetaan tyypillisesti ns. pelkkänä tekstinä (engl. plain text)
  - Ohjelmat voivat koostua muustakin kuin tekstimuotoisesta lähdekoodista, vrt. esim. graafiset blokit Scratch-ympäristössä tai Blueprint  Unreal Engine -pelimoottorissa.
- C#-kielessä lähdekoodi käännetään ajettavaksi ohjelmaksi kääntäjällä (engl. compiler)

---

# C#-ohjelman perusrakenne

- C#-ohjelma koostuu vähintään yhdestä luokasta (engl. class)
- Ohjelma alkaa pääohjelmasta (C#-kielessä Main)
- Ohjelman keskiössä ovat perättäin suoritettavat lauseet (engl. statement)
- Koodi voidaan ryhmitellä erilaisiin uudelleenkäytettäviin kokonaisuuksiin, C#:ssa mm.
  - aliohjelma (engl. function, method)
  - luokka (engl. class)
  - nimiavaruus (engl. namespace)
  - kirjasto (engl. library)

---

# Koodin kirjoittamisesta

- Aaltosulkeiden sisällä oleva koodi “sisennetään” luettavuutta varten
- Ohjelmakoodin lomaan voi kirjoittaa kommentteja sekä dokumentaatioita
  - Koodin seassa olevat kommentit ovat itselle ja muille koodareille. Nämä kirjoitetaan // tai /* */ merkinnöillä
  - Dokumentaatiokommentit kirjoitetaan ohjelman osien yläpuolelle käyttämällä /// merkintöjä ja ennalta määriteltyjä tageja
- Koodin dokumentointi helpottaa koodin ymmärtämistä, ylläpitämistä ja uudelleenkäyttöä

---

<!-- Tähän tulee kaavio: Esikyselytulokset (suurin kirjoitettu ohjelma ennen Ohj1) -->

---

# Jypeli

- Jypeli on opintojaksolla käytössä oleva peliohjelmointikirjasto
- Asennusohjeet: https://ohjelmointi1.it.jyu.fi/tyokalut
- Jypeli-wiki: https://tim.pm/jypeli-wiki
- Jypelin dokumentaatio: https://tim.pm/jypeli-docs

> Demo: Rakennetaan lumiukko Jypelillä

---

# Mitä seuraavaksi?

- Seuraavalla luennolla:
  - Aliohjelmat (funktiot)
  - Muuttujat
- Kotitehtävät:
  - Asenna tarvittavat työkalut: https://tim.pm/ohj1-tyokalut
  - Tee Harjoitustehtävät 1

<br>

> Kysymyksiä? Kommentit TIMiin tai kysy ohjaajilta Teamsissa / pääteohjausajalla.
