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

3. Fill envs according to `.env.example`
```bash
DB_USERNMAME=
DB_PASSWORD=
```
4. Set up the database
```bash
rails db:create db:migrate
```

5. Seed database with doctors
```bash
rails db:seed
```

6. Import patients form csv file
```bash
rake import:patients
```

7. Start the server
```bash
rails s
```