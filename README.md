# ⚔️ Ragnarok Online MVP Timer

A lightweight, production-ready web application for tracking Ragnarok Online MVP respawn times. Built with standard web technologies (pure HTML5, CSS3, and Vanilla JavaScript) with zero external frameworks or backend dependencies required for client execution.

This repository comes pre-configured with a hardened Docker setup, automatic SSL via Caddy, log rotation policies, and a unified `Makefile` for both local builds and automated GitHub Actions CI/CD.

---

## ✨ Features

### Application Features
* **Time of Death (TOD) Input:** Enter the exact timestamp shown on an MVP Tombstone. Automatically resolves whether TOD occurred earlier today or late yesterday.
* **"Killed Just Now" Quick Add:** Instantly start a timer with a single click if you personally secured the kill.
* **Persistent Storage (`localStorage`):** Active timers survive browser refreshes, accidental tab closures, and system restarts.
* **Desktop Notifications:** Browser-native alerts ping you when an MVP is about to respawn or has spawned.
* **Dynamic Visual Cue:** Spawned MVPs feature an animated warning glow and status indicator.

### Infrastructure & DevOps Features
* **Hardened NGINX Image:** Uses `nginxinc/nginx-unprivileged:alpine` to ensure web processes never execute as `root`.
* **Automatic HTTPS / TLS:** Caddy reverse proxy handles Let's Encrypt certificate acquisition, HTTP-to-HTTPS redirection, and renewal.
* **Log Rotation:** Docker Compose configured with `json-file` log size limits (`10m`, max 3 files) to prevent disk space exhaustion.
* **Unified Pipeline:** Single `Makefile` standardizes build, authentication, and push targets across local development and GitHub Actions.

---

## 📁 Repository Structure

```text
.
├── .github/
│   └── workflows/
│       └── docker-publish.yml   # CI/CD workflow triggering Makefile
├── Caddyfile                    # Caddy reverse proxy configuration & security headers
├── Dockerfile                   # Unprivileged NGINX container definition
├── docker-compose.yml           # Production service orchestration & log management
├── Makefile                     # Build & push automation targets
└── mvp_timer.html               # Main application code (HTML/CSS/JS)
