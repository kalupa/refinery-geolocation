# RefineryCMS Geolocations

__A geolocator plugin for the [Refinery](http://github.com/resolve/refinerycms) content management system.__

## Description:

Search Locations

* uses Google MAPS API

Administration panel

* Add locations

## Installation (as a plugin)

First, make sure you've run the migration on RefineryCMS (db:setup / db:migrate).

Clone the plugin:

> script/plugin install git://github.com/kalupa/refinery-geolocation.git

Copy the migration with

> script/generate geolocation

& run the migration

> rake db:migrate

Make sure you update your API key in Settings

## Credit

Installation scripts based on RefineryCMS Blog. see: [http://github.com/resolve/refinerycms-blog](http://github.com/resolve/refinerycms-blog)