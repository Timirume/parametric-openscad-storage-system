// ======================================================
// PROJECT: Parametric "Fluid-Joint" Storage System
// AUTHOR: Timothy Okibe Ogese
// PORTFOLIO ITEM #1: Computational Design & Parametric Logic
// 
// TECHNICAL MASTERY INCLUDED:
// 1. Union-Minkowski Blending (Seamless organic joints)
// 2. Hybrid CSG (Intersection-based flattening for manufacturing)
// 3. Single-Source-of-Truth Parameterization
// 4. Assembly Tolerance (Calculated Lid Clearance)
// ======================================================

// -------------------------
// 1. GLOBAL PARAMETERS
// -------------------------
base_side    = 50;   // Footprint width/depth
mid_side     = 40;   // Shared geometric anchor
top_side     = 55;   // Mouth width/depth

height_base  = 30;
height_top   = 30;

roundness    = 5;    // Minkowski radius
wall_t       = 3;    // Consistent wall & base thickness

/* [Lid Settings] */
lid_thickness = 3;
clearance     = 0.5; // Gap for 3D printing fit
lid_float     = 20;  // Display offset

// Derived Constants
total_h = height_base + height_top;
$fn = 30; // Set to 80+ for production render (F6)

// -------------------------
// 2. MODULE: THE CONTAINER
// -------------------------
module container_shell() {
    difference() {
        // OUTER MASS: Blended via Minkowski
        minkowski() {
            union() {
                linear_extrude(height = height_base, scale = mid_side/base_side) 
                    square(base_side, center=true);
                translate([0, 0, height_base])
                    linear_extrude(height = height_top, scale = top_side/mid_side) 
                        square(mid_side, center=true);
            }
            sphere(r = roundness);
        }

        // INNER VOID: Shifted UP by wall_t to keep base solid
        translate([0, 0, wall_t])
        minkowski() {
            union() {
                linear_extrude(height = height_base, scale = (mid_side-wall_t*2)/(base_side-wall_t*2)) 
                    square(base_side-wall_t*2, center=true);
                translate([0, 0, height_base])
                    linear_extrude(height = height_top + 10, scale = (top_side-wall_t*2)/(mid_side-wall_t*2)) 
                        square(mid_side-wall_t*2, center=true);
            }
            sphere(r = roundness - 0.5); 
        }
    }
}

// -------------------------
// 3. RENDER: CONTAINER (Clipped for Flat Top)
// -------------------------
intersection() {
    container_shell();
    
    // Cutting Box: Preserves rounded base, flattens top rim
    translate([0, 0, (total_h - roundness)/2])
        cube([base_side*4, base_side*4, total_h + roundness], center=true);
}

// -------------------------
// 4. RENDER: MATCHING LID
// -------------------------
translate([0, 0, total_h + lid_float]) {
    // Lid Plate
    color("DodgerBlue")
    linear_extrude(height = lid_thickness)
    offset(r = roundness)
        square(top_side, center=true);
    
    // Lid Plug (Recessed Fit)
    color("SkyBlue")
    translate([0, 0, -lid_thickness])
    linear_extrude(height = lid_thickness)
    offset(r = roundness - wall_t - clearance)
        square(top_side - wall_t*2, center=true);
}
