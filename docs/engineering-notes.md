# Engineering Notes

## 1. Why dual taper geometry?
The dual taper simulates ergonomic container design where:
- Base stability is maximized
- Upper volume is optimized for usability

---

## 2. Why Minkowski smoothing?
Used to approximate injection-moulded fillets in FDM constraints. While computationally expensive, it provides:
- Consistent edge curvature
- A more realistic consumer product finish

---

## 3. Tolerance system
A 0.5mm clearance was chosen to accommodate:
- Typical FDM printer variance
- Material shrinkage (PLA/ABS)

---

## 4. Design limitation
Minkowski operation increases render time exponentially with complexity. Future optimization may replace this with hull-based or custom filleting logic.
