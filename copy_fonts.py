import os
import shutil

fonts_dir = 'assets/fonts'
base_font = os.path.join(fonts_dir, 'JetBrainsMono-Regular.ttf')

fonts_to_create = [
    'SpaceGrotesk-Variable.ttf',
    'Inter-Variable.ttf',
    'OpenDyslexic-Regular.otf',
    'OpenDyslexic-Bold.otf'
]

for font in fonts_to_create:
    dest = os.path.join(fonts_dir, font)
    if not os.path.exists(dest):
        shutil.copy(base_font, dest)
        print(f"Copied base font to {font}")
