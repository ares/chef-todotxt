name             'todotxt'
maintainer       "Ares"
maintainer_email "ar3s.cz@gmail.com"
license          "All rights reserved"
description      "Installs/Configures todotxt CLI"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.2.2"

depends 'desktop'
depends	'user', '>= 0.1.0'
depends 'zsh'
