# Bürger Büro Warteizeiten API

Die Stadt Münster hat eine eigene Seite/Snippet für die Wartezeiten im
Bürgerbüro Mitte: http://muenster.de/stadt/buergeramt/mobil-wartezeit.shtml

Diese Seite wird gescraped und einfach zugänglich gemacht mit Hilfe
einer API.

Die API hat zwei Endpunkte:

`` / `` für den Zugriff auf alle Einträge, liefert ein JSON Array zurück  
`` /latest `` liefert ein JSON Objekt zurück mit dem letzten Eintrag.  

Das JSON Objekt setzt sich folgendermaßen zusammen

```
{
  "id":1,
  "wartezeit":"2 Minuten",
  "warteende":"1",
  "naechste_nummer":"152",
  "aktualisiert":"2015-01-31T09:36:48+00:00",
  "created_at":"2015-01-31T08:40:32+00:00"
}

```

## Install & run using Docker

* Install [Docker](https://docs.docker.com/installation/#installation) and [Fig](http://www.fig.sh/).
* Then run: `sudo fig up`

The website is now available at [http://localhost:3338](http://localhost:3338).

## Contributing
[![Stories in Ready](https://badge.waffle.io/codeformuenster/buergerbuero.png?label=ready&title=Ready)](https://waffle.io/codeformuenster/buergerbuero)

Issues are managed in [Github Issues](https://github.com/codeformuenster/buergerbuero/issues?state=open). You can also view them on a [Kanban board](https://waffle.io/codeformuenster/buergerbuero).

Either fork and pull-request or ask @kirel or @milafrerichs for access and work on feature branches.

Feature branches should be names `Issue#-descriptive-name` - see https://github.com/codeformuenster/codeformuenster.github.io/branches for examples.


## ToDo
Daten in elasticsearch oder so stecken um diese analysieren zu können.
