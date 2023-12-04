# RoR clinic app

## Description 
Clinic app for managing patients appointments

## Getting started

Follow these steps to get your application up and running

1. Clone the repository

```bash
git clone https://github.com/bbronek/RoR-Clinic.git
```

2. Install dependencies
```bash
bundle install
```

3. Set up the database
```bash
rails db:create db:migrate
```

4. Import patients form csv file
```bash
rake import:patients
```

5. Start the server
```bash
rails s
```