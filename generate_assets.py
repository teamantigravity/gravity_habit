import os
import urllib.request
import wave
import struct

# Create directories
dirs = [
    'assets/fonts',
    'assets/audio/cosmos',
    'assets/audio/forest',
    'assets/audio/analog',
    'assets/ads'
]
for d in dirs:
    os.makedirs(d, exist_ok=True)

# Generate a silent 0.1s WAV file
wav_path = 'silent.wav'
with wave.open(wav_path, 'w') as wav_file:
    wav_file.setnchannels(1)
    wav_file.setsampwidth(2)
    wav_file.setframerate(44100)
    # 0.1 seconds of silence
    num_frames = int(44100 * 0.1)
    data = struct.pack('<h', 0) * num_frames
    wav_file.writeframes(data)

# Copy the WAV file to all audio events
events = ['tap', 'complete', 'milestone', 'error', 'ambient']
packs = ['cosmos', 'forest', 'analog']

for pack in packs:
    for event in events:
        dest = f'assets/audio/{pack}/{event}.wav'
        with open(wav_path, 'rb') as src, open(dest, 'wb') as dst:
            dst.write(src.read())
os.remove(wav_path)

# Download fonts
fonts = {
    'SpaceGrotesk-Variable.ttf': 'https://github.com/googlefonts/spacegrotesk/raw/main/fonts/variable/SpaceGrotesk%5Bwght%5D.ttf',
    'Inter-Variable.ttf': 'https://github.com/rsms/inter/raw/master/docs/font-files/Inter-VariableFont_slnt%2Cwght.ttf',
    'JetBrainsMono-Regular.ttf': 'https://github.com/JetBrains/JetBrainsMono/raw/master/fonts/ttf/JetBrainsMono-Regular.ttf',
    'OpenDyslexic-Regular.otf': 'https://github.com/antijingoist/opendyslexic/raw/master/compiled/OpenDyslexic-Regular.otf',
    'OpenDyslexic-Bold.otf': 'https://github.com/antijingoist/opendyslexic/raw/master/compiled/OpenDyslexic-Bold.otf'
}

for filename, url in fonts.items():
    dest = f'assets/fonts/{filename}'
    if not os.path.exists(dest):
        try:
            print(f"Downloading {filename}...")
            urllib.request.urlretrieve(url, dest)
        except Exception as e:
            print(f"Failed to download {filename}: {e}")

# Create desktop ad HTML
ad_html_content = """<!DOCTYPE html>
<html>
<head>
    <style>
        body { margin: 0; display: flex; justify-content: center; align-items: center; height: 100vh; background-color: #f0f0f0; font-family: sans-serif; }
        .ad-container { text-align: center; color: #555; }
    </style>
</head>
<body>
    <div class="ad-container">
        <h3>Ad Placeholder</h3>
        <p>Desktop Ad Content Goes Here</p>
    </div>
</body>
</html>
"""
with open('assets/ads/desktop_ad.html', 'w') as f:
    f.write(ad_html_content)

print("Done generating missing assets!")
