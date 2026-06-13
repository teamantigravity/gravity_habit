import os
import math
import struct
import wave
import random

SAMPLE_RATE = 44100

def save_wav(filename, samples):
    os.makedirs(os.path.dirname(filename), exist_ok=True)
    with wave.open(filename, 'w') as wav_file:
        wav_file.setnchannels(1)
        wav_file.setsampwidth(2)
        wav_file.setframerate(SAMPLE_RATE)
        # Convert float samples (-1.0 to 1.0) to 16-bit PCM
        pcm_samples = []
        for s in samples:
            # clip to [-1, 1]
            s = max(-1.0, min(1.0, s))
            pcm_samples.append(int(s * 32767.0))
        data = struct.pack('<' + 'h' * len(pcm_samples), *pcm_samples)
        wav_file.writeframes(data)

def generate_tone(freq, duration, wave_type='sine'):
    num_samples = int(SAMPLE_RATE * duration)
    samples = []
    for i in range(num_samples):
        t = i / SAMPLE_RATE
        if wave_type == 'sine':
            s = math.sin(2 * math.pi * freq * t)
        elif wave_type == 'square':
            s = 1.0 if math.sin(2 * math.pi * freq * t) > 0 else -1.0
        elif wave_type == 'sawtooth':
            s = 2.0 * (t * freq - math.floor(0.5 + t * freq))
        elif wave_type == 'noise':
            s = random.uniform(-1.0, 1.0)
        else:
            s = 0.0
        samples.append(s)
    return samples

def apply_envelope(samples, attack=0.01, decay=0.1, sustain=0.7, release=0.2, duration=None):
    if duration is None:
        duration = len(samples) / SAMPLE_RATE
    env_samples = []
    for i in range(len(samples)):
        t = i / SAMPLE_RATE
        env = 0.0
        if t < attack:
            env = t / attack
        elif t < attack + decay:
            env = 1.0 - (1.0 - sustain) * ((t - attack) / decay)
        elif t < duration - release:
            env = sustain
        elif t < duration:
            env = sustain * (1.0 - ((t - (duration - release)) / release))
        else:
            env = 0.0
        env_samples.append(samples[i] * env)
    return env_samples

def mix(*sample_lists):
    max_len = max(len(s) for s in sample_lists)
    mixed = [0.0] * max_len
    for s_list in sample_lists:
        for i in range(len(s_list)):
            mixed[i] += s_list[i] / len(sample_lists)
    return mixed

# --- COSMOS PACK (Sine waves, smooth, ethereal) ---
# ambient: low drone
cosmos_ambient = apply_envelope(mix(generate_tone(100, 2), generate_tone(150, 2)), attack=0.5, release=0.5)
save_wav('assets/audio/cosmos/ambient.wav', cosmos_ambient)

# tap: soft short high beep
cosmos_tap = apply_envelope(generate_tone(800, 0.1), attack=0.01, release=0.05)
save_wav('assets/audio/cosmos/tap.wav', cosmos_tap)

# complete: C major chord
c_chord = mix(generate_tone(523.25, 1.0), generate_tone(659.25, 1.0), generate_tone(783.99, 1.0))
cosmos_complete = apply_envelope(c_chord, attack=0.1, release=0.5)
save_wav('assets/audio/cosmos/complete.wav', cosmos_complete)

# milestone: rising arpeggio (C, E, G, C)
arpeggio = []
for f in [523.25, 659.25, 783.99, 1046.50]:
    arpeggio.extend(apply_envelope(generate_tone(f, 0.25), attack=0.05, release=0.1))
save_wav('assets/audio/cosmos/milestone.wav', arpeggio)

# error: low dull thump
cosmos_error = apply_envelope(generate_tone(150, 0.3), attack=0.01, release=0.2)
save_wav('assets/audio/cosmos/error.wav', cosmos_error)

# --- FOREST PACK (Triangle/Noise, organic) ---
# ambient: noise (wind)
forest_ambient = apply_envelope(generate_tone(0, 2, 'noise'), attack=0.5, release=0.5)
# lower volume of noise
forest_ambient = [s * 0.2 for s in forest_ambient]
save_wav('assets/audio/forest/ambient.wav', forest_ambient)

# tap: wooden tock (short noise burst + low freq)
tock = mix(generate_tone(400, 0.05, 'sine'), generate_tone(0, 0.05, 'noise'))
forest_tap = apply_envelope(tock, attack=0.005, release=0.03)
save_wav('assets/audio/forest/tap.wav', forest_tap)

# complete: high chime (sine)
forest_complete = apply_envelope(generate_tone(1200, 1.0, 'sine'), attack=0.01, release=0.8)
save_wav('assets/audio/forest/complete.wav', forest_complete)

# milestone: fast high arpeggio (birds/harp)
harp = []
for f in [800, 1000, 1200, 1500, 1800]:
    harp.extend(apply_envelope(generate_tone(f, 0.1, 'sine'), attack=0.01, release=0.08))
save_wav('assets/audio/forest/milestone.wav', harp)

# error: earthy thud
forest_error = apply_envelope(generate_tone(100, 0.2, 'square'), attack=0.01, release=0.1)
forest_error = [s * 0.5 for s in forest_error]
save_wav('assets/audio/forest/error.wav', forest_error)

# --- ANALOG PACK (Square/Sawtooth, mechanical) ---
# ambient: vinyl crackle simulation (sparse noise spikes)
analog_ambient = []
for i in range(SAMPLE_RATE * 2):
    if random.random() < 0.001:
        analog_ambient.append(random.uniform(-0.5, 0.5))
    else:
        analog_ambient.append(random.uniform(-0.02, 0.02))
save_wav('assets/audio/analog/ambient.wav', analog_ambient)

# tap: mechanical click
analog_tap = apply_envelope(generate_tone(0, 0.05, 'noise'), attack=0.001, release=0.02)
save_wav('assets/audio/analog/tap.wav', analog_tap)

# complete: typewriter ding
analog_complete = apply_envelope(generate_tone(1500, 0.5, 'sine'), attack=0.005, release=0.4)
save_wav('assets/audio/analog/complete.wav', analog_complete)

# milestone: cha-ching (mixed noise and high sine)
chaching = mix(generate_tone(0, 0.4, 'noise'), generate_tone(2000, 0.4, 'sine'))
analog_milestone = apply_envelope(chaching, attack=0.01, release=0.2)
save_wav('assets/audio/analog/milestone.wav', analog_milestone)

# error: heavy clack
analog_error = apply_envelope(generate_tone(200, 0.1, 'sawtooth'), attack=0.005, release=0.05)
save_wav('assets/audio/analog/error.wav', analog_error)

print("Synthesized 15 audio files as .wav")
