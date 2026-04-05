import pandas as pd
import folium
from folium.plugins import HeatMap
from flask import Flask, render_template

app = Flask(__name__)

# Load data
df = pd.read_csv('pubsafedash_offenses.csv').sample(n=5000, random_state=42)

# Load sex offender data
sor_cols = ['AddressId', 'IND_IDN', 'SNU_NBR', 'SNA_TXT', 'SUD_COD', 'SUD_NBR', 
            'CTY_TXT', 'PLT_COD', 'ZIP_TXT', 'COU_COD', 'LAT_NBR', 'LON_NBR']
sor_df = pd.read_csv('sor_data/Address.txt', sep='\t', encoding='latin1', header=None, names=sor_cols, usecols=range(12))

# Load names
name_df = pd.read_csv('sor_data/NAME.txt', sep='\t', encoding='latin1', header=None, usecols=[1, 3])
name_df.columns = ['IND_IDN', 'FULL_NAME']
name_df = name_df.drop_duplicates(subset='IND_IDN', keep='first')

# Filter for San Antonio TX only and valid coordinates
sor_sa = sor_df[
    (sor_df['CTY_TXT'].str.upper().str.contains('SAN ANTONIO', na=False)) &
    (sor_df['PLT_COD'] == 'TX') &
    (sor_df['LAT_NBR'].notna()) &
    (sor_df['LAT_NBR'] != 0) &
    (sor_df['LON_NBR'].notna()) &
    (sor_df['LON_NBR'] != 0)
].copy()

# Merge names after sor_sa is created
sor_sa = sor_sa.merge(name_df, on='IND_IDN', how='left')

print(f"San Antonio sex offenders found: {len(sor_sa)}")

# SA zip code coordinates (center points)
zip_coords = {
    '78201': [29.4241, -98.5330],
    '78202': [29.4200, -98.4800],
    '78203': [29.4100, -98.4700],
    '78204': [29.4000, -98.5100],
    '78205': [29.4241, -98.4936],
    '78206': [29.4300, -98.4600],
    '78207': [29.4200, -98.5300],
    '78208': [29.4400, -98.4600],
    '78209': [29.4600, -98.4500],
    '78210': [29.4000, -98.4800],
    '78211': [29.3700, -98.5500],
    '78212': [29.4500, -98.5000],
    '78213': [29.4700, -98.5300],
    '78214': [29.3800, -98.4900],
    '78215': [29.4300, -98.4800],
    '78216': [29.5000, -98.5000],
    '78217': [29.5000, -98.4500],
    '78218': [29.4800, -98.4300],
    '78219': [29.4600, -98.4000],
    '78220': [29.4400, -98.4000],
    '78221': [29.3600, -98.4800],
    '78222': [29.3800, -98.4000],
    '78223': [29.3600, -98.4300],
    '78224': [29.3600, -98.5300],
    '78225': [29.3900, -98.5300],
    '78226': [29.4000, -98.5500],
    '78227': [29.4000, -98.6000],
    '78228': [29.4400, -98.5500],
    '78229': [29.4900, -98.5700],
    '78230': [29.5100, -98.5500],
    '78231': [29.5300, -98.5500],
    '78232': [29.5300, -98.5000],
    '78233': [29.5100, -98.4000],
    '78234': [29.4600, -98.4300],
    '78235': [29.3400, -98.4500],
    '78236': [29.3900, -98.6200],
    '78237': [29.4200, -98.5800],
    '78238': [29.4500, -98.6000],
    '78239': [29.5000, -98.4000],
    '78240': [29.5100, -98.6000],
    '78241': [29.4200, -98.4200],
    '78242': [29.3700, -98.6200],
    '78243': [29.3600, -98.6000],
    '78244': [29.4700, -98.3800],
    '78245': [29.4000, -98.6500],
    '78247': [29.5400, -98.4500],
    '78248': [29.5500, -98.5200],
    '78249': [29.5300, -98.6200],
    '78250': [29.4800, -98.6500],
    '78251': [29.4600, -98.6500],
    '78252': [29.3800, -98.6500],
    '78253': [29.4400, -98.7000],
    '78254': [29.4900, -98.7000],
    '78255': [29.5500, -98.6000],
    '78256': [29.5500, -98.6500],
    '78257': [29.5600, -98.6200],
    '78258': [29.5700, -98.5000],
    '78259': [29.5700, -98.4500],
    '78260': [29.6000, -98.4800],
    '78261': [29.6000, -98.4300],
    '78263': [29.3400, -98.3500],
    '78264': [29.3000, -98.5000],
    '78266': [29.6200, -98.4000],
}

# Risk levels based on crime type
def get_risk_level(crime):
    high = ['Murder', 'Rape', 'Robbery', 'Aggravated Assault', 'Kidnapping']
    medium = ['Burglary', 'Motor Vehicle Theft', 'Arson', 'Simple Assault']
    if any(h.lower() in str(crime).lower() for h in high):
        return 'high'
    elif any(m.lower() in str(crime).lower() for m in medium):
        return 'medium'
    return 'low'

df['risk_level'] = df['NIBRS_Code_Name'].apply(get_risk_level)

risk_colors = {
    'high': 'red',
    'medium': 'orange',
    'low': 'green'
}

# Generate map once at startup
print("Generating map...")
print("Adding legend...")
m = folium.Map(location=[29.4241, -98.4936], zoom_start=11)

crime_layer = folium.FeatureGroup(name='Crime Risk')
sor_layer = folium.FeatureGroup(name='Sex Offenders')

heat_data = []
for _, row in df.iterrows():
    zip_code = str(row['Zip_Code']).split('.')[0]
    if zip_code in zip_coords:
        coords = zip_coords[zip_code]
        risk = row['risk_level']
        heat_data.append(coords)
        folium.CircleMarker(
            location=coords,
            radius=5,
            color=risk_colors[risk],
            fill=True,
            fill_opacity=0.6,
            popup=f"Crime: {row['NIBRS_Code_Name']}<br>Zip: {zip_code}<br>Risk: {risk.upper()}"
        ).add_to(crime_layer)

for _, row in sor_sa.iterrows():
    folium.CircleMarker(
        location=[row['LAT_NBR'], row['LON_NBR']],
        radius=6,
        color='#FF1493',
        fill=True,
        fill_opacity=0.8,
        popup=f"Sex Offender<br>Name: {row['FULL_NAME']}<br>Address: {row['SNU_NBR']} {row['SNA_TXT']}<br>Zip: {row['ZIP_TXT']}"
    ).add_to(sor_layer)

crime_layer.add_to(m)
sor_layer.add_to(m)
HeatMap(heat_data, name='Crime Heatmap').add_to(m)
folium.LayerControl().add_to(m)

legend_html = '''
<div style="position: fixed; top: 20px; right: 20px; z-index: 1000;
     background-color: white; padding: 20px; border-radius: 10px;
     border: 2px solid #ccc; font-family: Arial; box-shadow: 2px 2px 6px rgba(0,0,0,0.2);
     min-width: 220px;">
     <h4 style="margin:0 0 5px 0; color:#222;">GuardianMap SA</h4>
     <p style="margin:0 0 15px 0; color:#888; font-size:11px;">SAPD Crime Risk & Sex Offender Data</p>
     <div style="margin-bottom:10px;">
         <i style="background:red; border-radius:50%; width:12px; height:12px; display:inline-block; vertical-align:middle;"></i>
         <span style="vertical-align:middle; margin-left:8px;">High Risk Crime</span>
     </div>
     <div style="margin-bottom:10px;">
         <i style="background:orange; border-radius:50%; width:12px; height:12px; display:inline-block; vertical-align:middle;"></i>
         <span style="vertical-align:middle; margin-left:8px;">Medium Risk Crime</span>
     </div>
     <div style="margin-bottom:10px;">
         <i style="background:green; border-radius:50%; width:12px; height:12px; display:inline-block; vertical-align:middle;"></i>
         <span style="vertical-align:middle; margin-left:8px;">Low Risk Crime</span>
     </div>
     <div style="margin-bottom:5px;">
         <i style="background:#FF1493; border-radius:50%; width:12px; height:12px; display:inline-block; vertical-align:middle;"></i>
         <span style="vertical-align:middle; margin-left:8px;">Registered Sex Offender</span>
     </div>
</div>
'''

m.get_root().html.add_child(folium.Element(legend_html))
print("Legend added!")
m.save('templates/map.html')
print("Map ready!")

@app.route('/')
def index():
    return render_template('map.html')

if __name__ == '__main__':
    app.run(debug=True)