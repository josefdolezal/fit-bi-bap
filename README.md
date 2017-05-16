# Bakalářská práce: iOS aplikace k ovládání 3D tiskáren [![Build Status](https://travis-ci.com/josefdolezal/fit-bi-bap.svg?token=AxpSW7yys3aiQpPG9zMW&branch=master)](https://travis-ci.com/josefdolezal/fit-bi-bap)
Repozitář k rešeršní části bakalářské práce.
V rešeršní části se zabývám návrhem a implementací mobilní aplikace pro ovládání 3D tiskárny.

## PDF verze

Jednotlivé verze práce jsou dostupné v záložce [Releases](https://github.com/josefdolezal/fit-bi-bap/releases). Výsledná odevzdaná práce je [verze 1.0.0](https://github.com/josefdolezal/fit-bi-bap/releases/tag/1.0.0).

## Implementační část

Implementační část práce je dostupná v samostatném repozitáři. V souladu se zadáním je v anglickém jazyce.

Repozitář je dostupný [zde](https://github.com/3DprintFIT/octoprint-ios-client).

## Kompilace PDF

Práce je nasázena v systému LaTeX, pro vytvoření PDF je možné využít nástroj [latexmk](https://www.ctan.org/pkg/latexmk). Kompilaci lze spustit příkazem:

```bash
$ latexmk -pdf
```

Výstupem tohoto příkazu jsou soubory `thesis.pdf` a `thesis_cover_bw.pdf`.
Pro korektní kompilaci je potřeba doinstalovat potřebné závislosti.

Pro systém Ubuntu 14.04 lze závislosti získat příkazy:

```bash
$ sudo apt-get update
$ sudo apt-get install texlive-fonts-recommended texlive-latex-extra texlive-fonts-extra dvipng texlive-latex-recommended texlive-lang-czechslovak texlive-generic-extra lmodern latexmk latex-xcolor etoolbox python-pip
$ pip install pygments
```
