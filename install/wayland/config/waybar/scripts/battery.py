#!/usr/bin/env python3

import json
from pathlib import Path

POWER_SUPPLY = Path("/sys/class/power_supply")
ICONS_DEFAULT = ["󰁺", "󰁻", "󰁼", "󰁽", "󰁾", "󰁿", "󰂀", "󰂁", "󰂂", "󰁹"]
ICONS_CHARGING = ["󰢜", "󰂆", "󰂇", "󰂈", "󰢝", "󰂉", "󰢞", "󰂊", "󰂋", "󰂅"]
LEVEL_GOOD = 95
LEVEL_WARNING = 15
LEVEL_CRITICAL = 15

def read_file(path) -> str:
    try:
        return path.read_text().strip()
    except(FileNotFoundError, PermissionError):
        return ""

def read_file_int(path) -> int:
    try:
        return int(read_file(path))
    except ValueError:
        return 0

def format_duration(seconds: float) -> str:
    if seconds is None or seconds < 0:
        return "unknown"
    
    minutes = round(seconds / 60)
    hours, minutes = divmod(minutes, 60)

    if hours:
        return f"{hours} h {minutes:02d} min"

    return f"{minutes} min"

batteries = []

for path in sorted(POWER_SUPPLY.glob("BAT*")):
    capacity = read_file_int(path / "capacity")
    status = read_file(path / "status")
    power_now = read_file_int(path / "power_now")
    energy_now = read_file_int(path / "energy_now")
    energy_full = read_file_int(path / "energy_full")
    if not energy_full:
        energy_full = read_file_int(path / "charge_full")

    batteries.append({
        "label": path.name,
        "capacity": capacity,
        "status": status,
        "power_now": power_now,
        "energy_full": energy_full,
        "energy_now": energy_now
    })

if not batteries:
    print(json.dumps({
        "text": "No batteries",
        "tooltip": "No batteries found",
        "class": "unavailable"
    }))
    raise SystemExit

total_full = sum([b['energy_full'] for b in batteries])
combined = 0
if total_full:
    combined = round(
        sum(b['capacity'] for b in batteries) / len(batteries)
    )

classes = []
is_charging = any("charging" == b["status"].lower() for b in batteries)
if is_charging:
    classes.append("charging")

total_energy_now = sum([b["energy_now"] for b in batteries])
total_energy_full = sum([b["energy_full"] for b in batteries])
discharge_power = sum(b["power_now"] for b in batteries if b["status"] == "Discharging")
charge_power = sum(b["power_now"] for b in batteries if b["status"] == "Charging")

if discharge_power > 0:
    empty_seconds = total_energy_now / discharge_power * 3600
else:
    empty_seconds = None

if charge_power > 0:
    missing_energy = total_energy_full - total_energy_now
    full_seconds = max(0, missing_energy) / charge_power * 3600
else:
    full_seconds = None

if combined <= LEVEL_CRITICAL:
    classes.append("critical")
elif combined <= LEVEL_WARNING:
    classes.append("warning")
else:
    classes.append("good")

icon = ICONS_CHARGING if is_charging else ICONS_DEFAULT
icon = icon[min(len(icon) - 1, combined // 10)]

tooltip_lines = []
if len(batteries) > 1:
    for battery in batteries:
        tooltip_lines.append(f'{battery["label"]}: {battery["capacity"]}% - {battery["status"]}')

if empty_seconds:
    tooltip_lines.append(f"Time to empty: {format_duration(empty_seconds)}")
elif full_seconds:
    tooltip_lines.append(f"Time to full: {format_duration(full_seconds)}")

print(json.dumps({
    "text": f"{combined}% {icon}",
    "tooltip": "\n".join(tooltip_lines),
    "class": classes
}, ensure_ascii=False))
