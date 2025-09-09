# NiFHIR
A minimal, container-friendly scaffold for standing up a data-processing stack with configuration and initialization assets. The repository includes:
- A Docker Compose setup for services (e.g., data processing and persistence)
- Initialization SQL for a database
- Configuration directories for runtime services
- A simple Python entry point for local testing

Use this template to bootstrap a local environment for experimenting with data flows and service orchestration.
## Repository structure
- — Orchestrates the services for local development. `docker-compose.yml`
- — Database initialization scripts (e.g., creates baseline tables). Files in this folder are typically mounted to initialize a DB on first start.
    - — Example SQL to provision initial schema/objects. `01_Create_IP_Encounters.sql`

`maria-init/`
- — Configuration to be mounted into the data-flow service runtime. `nifi-conf/`
- — Storage for flow/versioned artifacts. `nifi-registry-data/`
- `data/` — Working data directory (e.g., inputs/outputs, temp files).
- `opt/` — Optional runtime assets, scripts, or binaries.
- — Simple Python script for quick local testing. `main.py`
- — Standard ignore rules. `.gitignore`

Note: Folder names (e.g., , ) indicate intended usage; adjust mounts and paths in as needed. `nifi-conf``nifi-registry-data``docker-compose.yml`
## Prerequisites
- Docker
- Docker Compose
- Optional: Python 3.9+ (for running locally) `main.py`

## Quick start
1. Review and adjust to match your environment (paths, ports, volumes). `docker-compose.yml`
2. Place any required configuration into:
    - for service configuration `nifi-conf/`
    - for persisted artifacts `nifi-registry-data/`
    - for database bootstrap SQL (executed on first DB start if mounted as an init directory) `maria-init/`

3. Start the stack:
    - Detached: `docker compose up -d`
    - Foreground: `docker compose up`

4. Verify services are healthy (logs or UI as applicable):
    - `docker compose ps`
    - `docker compose logs -f <service-name>`

To stop:
- `docker compose down`
- Add `-v` to remove named/anonymous volumes if you want a clean slate (this will also remove any initialized data).

## Running the sample Python script
- `python3 main.py`

This is a minimal script intended as a placeholder for local checks or quick experiments.
## Data and configuration
- Keep configuration under version control where possible (e.g., ). `nifi-conf/`
- Store secrets outside of the repo (e.g., environment variables, secret managers).
- For database initialization, place idempotent SQL in so cold starts yield a predictable schema. `maria-init/`

## Troubleshooting
- Ports already in use
    - Adjust ports in to avoid conflicts. `docker-compose.yml`

- Database initialization not applied
    - Ensure the init folder is correctly mounted to the container’s expected initialization directory and that the DB volume is fresh if re-initialization is needed.

- Configuration not taking effect
    - Confirm volume mounts and service reload/restart behavior.

## Contributing
Contributions are welcome. Please:
- Open an issue to discuss major changes
- Keep PRs focused and include a brief rationale and testing notes

## License
MIT License
Copyright (c) 2025 Yaan Dalzell 
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
