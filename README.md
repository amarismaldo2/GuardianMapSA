# GuardianMap SA

A public safety data visualization tool for San Antonio, Texas. Combines real SAPD crime incident data with the Texas Sex Offender Registry to display risk levels and offender locations on an interactive map.

![GuardianMap SA Preview](preview.png)

---

## Features
- Interactive heatmap showing crime density across San Antonio
- Color-coded crime risk markers (High / Medium / Low) based on NIBRS offense classifications
- 3,400+ registered sex offender locations with names and addresses from the TX DPS public registry
- Toggleable map layers for crime and sex offender data
- Click any marker for detailed incident or offender information

---

## Tech Stack
- Python, Flask, pandas, folium, geopy
- SAPD Offense Data — City of San Antonio Open Data Portal
- TX Sex Offender Registry- Texas DPS Public SOR Database

---

## Installation

### 1. Clone the repository
```bash
git clone https://github.com/amarismaldo2/GuardianMapSA.git
```

### 2. Create a conda environment
```bash
conda create -n guardianmap python=3.11
conda activate guardianmap
```

### 3. Install dependencies
```bash
conda install pandas folium flask jupyter -c conda-forge
pip install geopy
```

### 4. Add data files
- Download SAPD Offenses CSV from the [San Antonio Open Data Portal](https://data.sanantonio.gov) and save as `pubsafedash_offenses.csv`
- Download the TX SOR database from [Texas DPS](https://txdps.state.tx.us) and extract into a `sor_data/` folder

### 5. Run the app
```bash
python main.py
```

Then open `http://127.0.0.1:5000` in your browser.

---

## Data Sources
- SAPD crime data is a static snapshot and does not update in real time
- Sex offender registry data is sourced from the Texas DPS public database (March 2024)

---

## Disclaimer
This project uses publicly available government data for educational purposes only. All sex offender information is sourced from the official Texas DPS public registry.

---

# GuardianMap SA
![License: MIT](https://img.shields.io/badge/License-MIT-white.svg) 🤍
