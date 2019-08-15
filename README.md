# README

This application is the simple site parser. 

It takes url or domain name and checks presence of:
 - 'www' subdomain,
 - https connection.

It checks presence of file - robots.txt, and searches for 'sitemap.xml' url in it .

It analyzes the site and displays a list of existing pages. 

It parses individual pages and provides information from meta tags and lists of titles, links, tables, lists.

* Ruby version 2.6.0
* Ruby on Rails version 5.2.3

Used gems:
- Devise (admin authentication);
- Bootstrap (UI);
- Nokogiri (sitemap and html parsing).
