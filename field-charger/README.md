# Field Charging Safety Simulator

An interactive web tool designed to help FPV pilots and RC enthusiasts calculate the impact of field-charging battery packs on a vehicle's 12V starter battery.

## 🔋 What It Does

This tool converts the energy capacity of your RC lithium battery packs into Watt-hours (Wh) and compares it against the usable capacity of common automotive batteries. It helps ensure you never deep-discharge your car battery or get stranded at the flight line.

### Key Features

- **Chemistry-Specific Safety Thresholds:** Automatically adjusts safety margins based on whether you use a standard Flooded Lead Acid battery (70% safe limit) or a Dual-Purpose AGM battery (50% safe limit).
- **Efficiency Loss Compensation:** Factors in a standard 15% energy loss (85% efficiency) typical of DC-to-DC balance chargers (like ISDT or ToolkitRC units).
- **Real-Time Status Display:** Gives clear "Safe", "Caution", or "Critical" visual indicators based on your calculated remaining State of Charge (SoC).

## 🧮 The Core Math

1. **Vehicle Total Energy ($Wh$):** $$\text{Battery Amp-Hours (Ah)} \times 12\text{V}$$

2. **Drone Pack Total Energy ($Wh$):** $$\frac{\text{Capacity (mAh)}}{1000} \times \text{Cell Count (S)} \times 3.7\text{V nominal}$$

3. **Total System Draw ($Wh$):** $$\frac{\text{Drone Pack Energy} \times \text{Number of Packs}}{\text{0.85 Charger Efficiency}}$$

## 🛠️ Technology Stack

- **React (18.x):** Handled entirely client-side via CDN.
- **Tailwind CSS:** For clean, mobile-first responsive styling.

No installation, build steps, or backend servers are required. The entire utility runs locally inside `index.html`.

## 🤖 Acknowledgments

The core HTML, CSS (Tailwind), and React logic for these tools were generated with the assistance of Google Gemini (Gemini 1.5 Pro).
