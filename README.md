﻿# Open-blog

Klient aplikacji blog dla stosu technologicznego Ruby on Rails + PostgreSQL napisany w języku Ruby na platformie programistycznej Rails

### Wymagania
  - język Ruby (3.2.0)
  - platforma Rails ```gem install rails -v 7.0.4.2```
  - baza danych PostgreSQL w następującej konfiguracji (lub dostosować plik config/database.yml)
    * użytkownik: ```postgres```, 
    * hasło: ```postgres```, 
    * port: ```5432```,
    * nazwa bazy: ```chat```
  
### Uruchomienie
 Należy uruchomić wiersz poleceń w głównym folderze, uruchomić kolejno ```bundle install```, ```rails db:migrate RAILS_ENV=development```, ```set RAILS_ENV=production```, ```bundle exec rake secret``` (zwrócony ciąg znaków skopiować, wkleić do pliku config/secret:yml)

config/secret.yml:
``` # [...]
production:
	secret_key_base: <skopiowany ciąg znaków>
# [...] ```

Aplikację można uruchomić komendą rails s -e production, dostępna będzie pod adresem localhost/3000
