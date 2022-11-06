/*
 * Calculations for dimentions:
 * Screw hole size - guesstimated
 * Width is 19" in standard rack
 * Thickness - totally arbitrary, but seemed reasonable
 * Rack units to inches - https://en.wikipedia.org/wiki/Rack_unit#/media/File:Server_rack_rail_dimensions.svg
 * Hole distance from sides - https://upload.wikimedia.org/wikipedia/commons/0/08/19_inch_rack_dimensions.svg - this is equal to (19-18.312)/2 as we use the outer dimentions (slightly different number for 18.312" and 17.75")
 * Hole distance from top - https://en.wikipedia.org/wiki/Rack_unit#/media/File:Server_rack_rail_dimensions.svg - 0.5" as we assume we are at the top/bottom of a rack unit, not in the middle of one
 */

// determines if there should be one or two pairs of holes - if there is one pair, they are centered on the y axis; otherwise, a set distance from the edge is used
multi_hole = true;

// the number of rack units it should be
rack_units = 1;

// the size of the screwholes - you likely want to keep the default value
screw_hole_size = 5/16;

// the height of it in inches is the number of rack units multiplied by 1.75
height = rack_units * 1.75;

// total width of the object in inches - you almost certainly want 19" unless you know your rack has a different size
width = 19;

// how thick the part is in inches - I'm using 1/8" (a.k.a. 0.125") wood
thickness = 0.125;

/* [Hidden] */

// distance between the center of the screw holes and the left/right sides of the panel
hole_distance_from_sides = 0.334;

// distance between the center of the screw holes and the left/right sides of the panel - option has no effect if multi_hole is false
hole_distance_from_top = 0.25;

// resolution for the circular screw holes
$fn = 128;

linear_extrude(thickness) {
     difference() {
        square(size = [width, height]);
         if (!multi_hole) {
             translate([hole_distance_from_sides, height/2]) {
                circle(d = screw_hole_size);
             }
             translate([width - hole_distance_from_sides, height/2]) {
                circle(d = screw_hole_size);
             }
         } else {
             translate([hole_distance_from_sides, hole_distance_from_top]) {
                circle(d = screw_hole_size);
             }
             translate([width - hole_distance_from_sides, hole_distance_from_top]) {
                circle(d = screw_hole_size);
             }
             translate([hole_distance_from_sides, height - hole_distance_from_top]) {
                circle(d = screw_hole_size);
             }
             translate([width - hole_distance_from_sides, height - hole_distance_from_top]) {
                circle(d = screw_hole_size);
             }
         }
    }
}
