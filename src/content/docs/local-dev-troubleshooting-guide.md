---
title: Local Development Troubleshooting
description: Common issues and fixes when setting up OnTrack locally.
---

This page covers common problems new contributors run into when setting up OnTrack for the first time, along with simple fixes for each one.

---

## Ruby Version Error (doubtfire-api)

OnTrack requires Ruby 3.1.0. If you have a different version, the backend won't start.

Run these commands to switch to the right version:

```bash
rvm install 3.1.0
rvm use 3.1.0
ruby -v
```

The last command should print `ruby 3.1.0`. If RVM isn't installed yet, follow the [RVM install guide](https://rvm.io/rvm/install) first.

---

## Database Won't Load (doubtfire-api)

Don't run `db:migrate` on a fresh clone — it will fail. Use this instead:

```bash
bundle exec rails db:schema:load
```

---

## RabbitMQ Error on Startup

If the API fails to connect on startup, you probably need to export these variables. They reset every time you open a new terminal:

```bash
export RABBITMQ_USERNAME=guest
export RABBITMQ_PASSWORD=guest
```

To make this permanent, add them to your `~/.bashrc`:

```bash
echo 'export RABBITMQ_USERNAME=guest' >> ~/.bashrc
echo 'export RABBITMQ_PASSWORD=guest' >> ~/.bashrc
source ~/.bashrc
```

---

## Port Already in Use

If a service won't start because a port is taken, run this to find what's using it:

```bash
lsof -i :3000
```

Then kill it using the PID number shown:

```bash
kill -9 <PID>
```

Default ports:

| Service | Port |
|---|---|
| doubtfire-api | 3000 |
| doubtfire-web | 4200 |
| doubtfire-astro | 4321 |
| PostgreSQL | 5432 |
| RabbitMQ | 5672 |

---

## Docs Page Not Showing (doubtfire-astro)

Every Markdown file needs this at the very top or it won't appear on the site:

```md
---
title: Your Page Title
description: A short description.
---
```

Also make sure the file is inside `src/content/docs/`.

---

## npm Install Failing (doubtfire-astro)

Try clearing the cache and reinstalling:

```bash
npm cache clean --force
npm install
```

---

## Docker Won't Start (doubtfire-deploy)

Make sure Docker Desktop is running first. Then check which service is failing:

```bash
docker compose logs doubtfire-api
docker compose logs doubtfire-web
```

Most startup failures are caused by missing RabbitMQ variables — see above.

---

## Still Stuck?

Post in the team channel with the full error message and someone will help you out.
