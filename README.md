# FLARE — Fire Literature Analysis and Research Explorer

FLARE is a local research workspace for exploring NASA Physical Sciences Informatics (PSI) microgravity/combustion investigation records, comparing metadata, indexing research themes, and asking an optional evidence-grounded AI assistant questions.

**FLARE is an independent educational/research interface, not an official NASA product and not endorsed by NASA.**

## Quick start (Windows)

1. Extract the entire `FLARE` folder from the ZIP. Do not run the app from inside the ZIP preview.
2. Install **Python 3.10 or newer** from [python.org](https://www.python.org/downloads/). On Windows, tick **Add Python to PATH** during installation.
3. Open the extracted folder and double-click **`run.bat`**.
4. The launcher creates its own Python environment, installs the required packages, starts the local server, and opens FLARE in your browser at **http://127.0.0.1:8000**.
5. Keep the black terminal window open while using FLARE. Close it or press Ctrl+C to stop the app.

The first launch needs an internet connection to install Python packages. Later launches are faster.

## Quick start (macOS)

1. Extract the ZIP.
2. Install Python 3.10 or newer from [python.org](https://www.python.org/downloads/).
3. Double-click `run.command`. If macOS blocks it, right-click the file and choose **Open**.
4. Keep the Terminal window open while using FLARE.

## Optional AI assistant setup

The main app works without an AI key. To enable AI:

1. Make a copy of `.env.example` in the same folder and name the copy `.env`.
2. Open `.env` in a text editor and add your own provider key after `OPENAI_API_KEY=`.
3. Save the file and restart FLARE.

Never share your API key or upload the `.env` file. API usage may incur charges. If you do not have a key, leave this feature unconfigured; the rest of FLARE remains usable.

## What is included

- Responsive dashboard with counts calculated from the local SQLite catalogue.
- Searchable and filterable investigation explorer.
- Side-by-side comparison of 2–4 records.
- CSV/JSON import with validation and an import template.
- Research-theme index based on transparent keyword matching in loaded text.
- Optional backend-only OpenAI-compatible research assistant.
- Live NASA Technical Reports Server (NTRS) literature search.
- One-click Windows and macOS launchers.

## Important data note

The included database does **not** contain invented/sample NASA investigations. NASA PSI records need to be imported from metadata you are permitted to use. FLARE links to the live [NASA PSI investigation search](https://psi.nasa.gov/physci/repo/search?data_source=psi&data_type=investigation) and supports CSV/JSON imports. A documented public PSI metadata API/export contract could not be verified, so FLARE does not claim to automatically harvest PSI records.

NTRS is a separate supplementary literature search. NTRS publications are not silently merged into PSI experiment records.

## Manual start / developer notes

From the project folder:

### Windows
```powershell
py -m venv .venv
.venv\\Scripts\\python.exe -m pip install -r backend\\requirements.txt
.venv\\Scripts\\python.exe -m uvicorn backend.server:app --host 127.0.0.1 --port 8000
```

### macOS / Linux
```bash
python3 -m venv .venv
.venv/bin/python -m pip install -r backend/requirements.txt
.venv/bin/python -m uvicorn backend.server:app --host 127.0.0.1 --port 8000
```

Open http://127.0.0.1:8000. Do not open `frontend/index.html` directly; the backend serves the frontend and its API.

API health: http://127.0.0.1:8000/api/health  
Interactive API docs: http://127.0.0.1:8000/docs

## Tests

After installing dependencies, run:
```bash
.venv/bin/python -m pytest -q
```
On Windows use:
```powershell
.venv\\Scripts\\python.exe -m pytest -q
```

## Scientific safeguards and limitations

- PSI records must be imported; no fictional investigations are seeded.
- No official public PSI metadata API was verified; repository search is linked live.
- Imported metadata quality determines what FLARE can summarize. It does not download or parse raw experimental datasets.
- Theme indexing uses keyword matching; it is not a systematic review or proof of a research gap.
- Verify AI-generated claims against original records and publications.
- Before public deployment, configure authentication, rate limiting, HTTPS, and explicit CORS origins.
