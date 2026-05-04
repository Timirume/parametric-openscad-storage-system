# Parametric Modular Storage System (OpenSCAD)

## Overview
This project is a fully parametric dual-taper storage system designed for manufacturable 3D printing workflows. It explores geometric transitions, tolerance-controlled mating parts, and scalable product design logic.

---

## Design Intent
The goal was to create a storage container system that is:

- Fully parametric and scalable
- Manufacturable using FDM 3D printing
- Mechanically consistent in lid-to-body fit
- Structurally smooth with reduced stress edges

The design simulates a real-world product development workflow where geometry must adapt to manufacturing constraints.

---

## Key Engineering Features

### 1. Dual-Stage Taper System
The container transitions through two controlled scaling zones:
- Base → mid section
- Mid → top section

This allows controlled volume shaping without manual modelling.

---

### 2. Manufacturing Tolerance System
A clearance parameter ensures real-world fit:

- Wall thickness: `3mm`
- Lid clearance: `0.5mm`
- Adaptive plug geometry for lid insertion

---

### 3. Surface Smoothing Strategy
Geometric rounding is achieved using Minkowski operations to simulate filleted edges suitable for consumer-grade objects.

---

### 4. Lid Interface System
The lid uses a dual-layer structure:
- Top plate (external interface)
- Internal plug (friction-fit engagement)

This creates a passive alignment system without mechanical fasteners.

---

## Parameters (Fully Adjustable)
- Base width
- Mid width
- Top width
- Height segmentation
- Wall thickness
- Lid clearance

---

## Technical Stack
- OpenSCAD (parametric CAD)
- Boolean operations
- Minkowski transformations
- Linear extrusion scaling

---

## Future Improvements
- Snap-fit mechanical locking system
- Stackable modular variants
- Optimized non-Minkowski filleting for performance
- Automated size presets (S/M/L system)

---

## Author
Timothy Okibe Ogese
