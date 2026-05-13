// 3D Printed Test Bench Case for the Alsea River 386SX system
//
// Copyright (C) 2026 Sergey Kiselev.
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

// TODO:
// - Cutouts in the motherboard tray to minimize print time and material use
// - Cutouts in the bottom panel to minimize print time and material use
// - Separate drives tray and left PSU bracket part

// set only one of the variables below to true to draw the respective part
generate_preview = false;
render_back = false;
render_mb_tray = true;
render_bottom = false;
render_left = false;
render_right = false;
render_slots_cover = false;
render_speaker_bracket = false;

// All dimensions are in mm
in2mm=25.4;                 // mm per inch
mb_depth=6.8*in2mm;         // motherboard X dimension
mb_width=8.6*in2mm;         // motherboard Y dimension

// openings for cable routing on the sides of the motherboard
cable_routing_width_left=0.4*in2mm; // opening for cable routing on the left of the motherboard (floppy and IDE ribbon cables)
cable_routing_depth_left=70; // 2.68" for 50 pin SCSI connector
cable_routing_width_right=0.6*in2mm; // openning for cable routing on the right of the motherboard (ATX power cable)
cable_routing_depth_right=54; // 51.60 mm for 24 pin ATX power connector


bracket_depth=0.45*in2mm;    // depth of an ISA bracket (top part inside)
mb_to_case_back=0.065*in2mm;// motherboard to the inside of the back of the case
bottom_to_mb_height=65; // SFX power supply height is 2.5"

// case inside dimensions
inside_depth=mb_depth+bracket_depth+mb_to_case_back;
inside_width=mb_width+cable_routing_width_left+cable_routing_width_right;
inside_height=134;
case_thickness=3.0;
// case outside dimensions
case_depth=inside_depth+case_thickness*2;
case_width=inside_width+case_thickness*2;
case_height=inside_height+case_thickness*2;


corner_radius=case_thickness/2;
nut_inserts_radius = 2.6;       // corner radius for nut inserts
bracket_thickness=1.6;       // thickness of the material around ISA brackets
pcb_thickness=1.6;

mb_to_case_left=cable_routing_width_left;  // keep space for the cables on the sides of the motherboard
mb_to_left_slot=0.558*in2mm; // distance between the left edge of motherboard to the center of the leftmost slot cut-out
slot_height=0.61*in2mm;
slot_spacing=0.8*in2mm;  // distance between ISA slots
card_height=3.9*in2mm;   // height of an ISA card, not including edge connector
card_to_bracket_top=3.65*in2mm; // ISA card bottom to the top of the bracket

bracket_height=card_to_bracket_top+slot_height;             // height of an ISA bracket (motherboard to top part inside)
bracket_width=0.72*in2mm; // width of an ISA bracket
tongue_cutout_width=12; // width of a cutout for the tongue of an ISA bracket

bracket_tab_offset = (0.740+0.110)*in2mm-bracket_width; // offset of the bracket tab relative to the bracket's left side
slots=6;                // number of slots
slots_area_width=slots*slot_spacing+bracket_tab_offset*2; // width of slots plus a bit more
slots_area_left=mb_to_case_left+mb_to_left_slot-bracket_width/2-bracket_tab_offset; // distance from the inside left wall to slots area
echo("bracket_tab_offset", bracket_tab_offset);
echo("slots_area_width", slots_area_width);

standoff_height=10;
standoff_radius=4;
m3_hole_radius=3.2/2;
unc3_32_hole_radius=0.144*in2mm/2;
m3_tap_hole_radius=3.0/2;
m3_head_radius=3;

floppy_width=101.6;
floppy_height=25.4;
floppy_depth=145;
floppy_mount_height=5;
floppy_mount_depth_1=21;
floppy_mount_depth_2=floppy_mount_depth_1+60;
floppy_mount_depth_3=floppy_mount_depth_1+90;
floppy_bezel_depth=4;
floppy_x_offset=inside_depth+case_thickness-floppy_bezel_depth;

hdd_width=101.6;
hdd_height=26.1;
hdd_depth=147;
hdd_mount_height=6.35;
hdd_mount_depth_1=16.9;
hdd_mount_depth_2=hdd_mount_depth_1+60;
hdd_mount_depth_3=hdd_mount_depth_1+101.6;
hdd_x_offset=inside_depth+case_thickness-floppy_bezel_depth-floppy_mount_depth_1+hdd_mount_depth_1;

drive_spacing=hdd_mount_height+floppy_height-floppy_mount_height; // 26.75 mm - this allows reusing the same holes for HDD and floppy
drive_y_offset=10; // distance from left edge of bottom plate to the left side of drives
drive_z_offset=1; // distance from bottom plate to the bottom of an HDD

screw_to_edge=5; // width of the material around the screws in the drives mounting bracket and PSU mounts
bar_width=24; // width of bars in left, right, and motherboard tray panels

psu_depth=100;
psu_height=2.5*in2mm; // 63.5 mm
psu_width=125;
psu_mount_height1=psu_height/2-25.8;
psu_mount_height2=psu_height/2;
psu_mount_height3=psu_height/2+25.8;
psu_mount_width1=6;
psu_mount_width2=119;
psu_fan_diameter=80;
psu_x_offset=15;
psu_y_offset=inside_width-psu_width-0.25; // 0.25 mm tolerance for PSU size

tolerance=0.1;

// middle front support
support_width=12;
support_screw_length=10;

// speaker
speaker_radius=36/2;
speaker_height=4.5;
speaker_to_case_back=inside_depth-speaker_radius-case_thickness-5;
speaker_to_case_left=speaker_radius-case_thickness+125;

// distance between ventilation holes
vent_hole_radius=3;
vent_holes_horiz_step=10;
vent_holes_vert_step=sin(60)*vent_holes_horiz_step;

// number of faces in circular objects
$fn=90;

echo("Case width", case_width);
echo("Case depth", case_depth);
echo("Case height", case_height+bottom_to_mb_height+case_thickness);
echo("Space above ISA cards", inside_height-standoff_height-pcb_thickness-slot_height-card_height);
echo("Maximal ISA card length", inside_depth-bracket_depth-mb_to_case_back);
echo("Space between drive bracket and power supply", psu_y_offset-(drive_y_offset+hdd_width+tolerance+case_thickness));

include <ISA_Brackets.scad>


if (render_back) {
    rotate([0,0,-90]) {
        case_back();
    }
}

if (render_bottom) {
    rotate([0,0,-90]) {
        case_bottom();
    }
}
if (render_mb_tray) {
//    rotate([0,0,-90]) {
        case_mb_tray();
//    }
}
if (render_left) {
    rotate([0,0,-90]) {
        case_left();
    }
}
if (render_right) {
    rotate([180,0,-90]) {
        case_right();
    }
}
if (render_slots_cover) {
    slots_cover();
}
if (render_speaker_bracket) {
    rotate([180,0,0]) {
        speaker_bracket();
    }
}

if (generate_preview) {
    // back panel
    translate([0,0,case_height]) {
        rotate([0,90,0]) {
            color("cyan") case_back();
        }
    }
    // slots cover
    translate([case_thickness+bracket_depth,case_thickness+slots_area_left,case_thickness+standoff_height+pcb_thickness]) {
        rotate([0,-90,0]) {
            color("blue") slots_cover();
        }
    }
    // case motherboard tray
    translate([case_thickness,case_thickness,0]) {
        color("orange") case_mb_tray();
    }
    // case bottom
    translate([0,case_thickness,-bottom_to_mb_height-case_thickness]) {
        color("magenta") case_bottom();
    }

    // left panel
    translate([0,0,-bottom_to_mb_height]) {
        rotate([-90,0,0]) {
            color("green") case_left();
        }
    }
    // right panel
    translate([0,case_width,-bottom_to_mb_height]) {
        rotate([-90,0,0]) {
            color("red") case_right();
        }
    }

    // power supply
    translate([psu_x_offset+case_thickness, psu_y_offset+case_thickness,(psu_height-bottom_to_mb_height)/2]) {
        sfx_power_supply(); 
    }

    // motherboard and ISA brackets
    translate([case_thickness,case_thickness,case_thickness]) {
        // motherboard translate
        translate([mb_to_case_back+bracket_depth,mb_to_case_left,standoff_height]) {
            mb();
        }
        // ISA bracket
        translate([bracket_depth+br_thick,mb_to_case_left+mb_to_left_slot-br_width/2,standoff_height+pcb_thickness+bracket_height]) {
            rotate([90,90,180]) {
                eth_bracket();
            }
        }
    }
    // hard drive
    translate([hdd_x_offset-hdd_depth+case_thickness,hdd_width+case_thickness+drive_y_offset,-bottom_to_mb_height+drive_z_offset]){
        rotate([90,0,0]) {
            hard_drive();
        }
    }
    // floppy drive
    translate([floppy_x_offset-floppy_depth+case_thickness,floppy_width+case_thickness+drive_y_offset,-bottom_to_mb_height+drive_z_offset+drive_spacing+hdd_mount_height-floppy_mount_height]){
        rotate([90,0,0]) {
            floppy_drive();
        }
    }

    // speaker bracket
    translate([speaker_to_case_back+case_thickness,speaker_to_case_left+case_thickness,speaker_height+case_thickness*2]) {
        rotate([180,0,90]) {
            color("purple") speaker_bracket();
        }
    }
}

module case_back() {
    bracket_top_offset=0.11*in2mm;
    hole_y=-bracket_width/2+bracket_top_offset+0.74*in2mm-0.125*in2mm;
    hole_z=0.25*in2mm;

    union() {
        difference() {
            case_front_back_panel();
            // various cutouts
            translate([case_thickness,case_thickness,-tolerance]) {
                // case back side
                // cutout for slots
                translate([inside_height+case_thickness-bracket_height-standoff_height-pcb_thickness,slots_area_left,0]) {
                    cube([bracket_height-case_thickness,slots_area_width,case_thickness+tolerance*2]);
                }
            }
        }
        // case inside translate
        translate([case_thickness,case_thickness,case_thickness]) {
            // ISA slots
            difference() {
                union() {
                    // bottom part (under slots openings)
                    translate([inside_height-pcb_thickness-standoff_height,slots_area_left,0]) {
                        cube([case_thickness,slots_area_width,bracket_depth]);
                    }
                    // left side
                    translate([inside_height-pcb_thickness-standoff_height-bracket_height,slots_area_left-bracket_thickness,0]){
                        cube([case_thickness+bracket_height,bracket_thickness,bracket_depth]);
                    }

                    // right side
                    translate([inside_height-pcb_thickness-standoff_height-bracket_height,slots_area_left+slots_area_width,0]){
                        cube([case_thickness+bracket_height,bracket_thickness,bracket_depth]);
                    }
                    // middle (slot cutouts area)
                    translate([inside_height-pcb_thickness-standoff_height-bracket_height,slots_area_left,bracket_depth-bracket_thickness]) {
                        cube([bracket_height,slots_area_width,bracket_thickness]);
                    }
                    // top/horizontal
                    translate([inside_height-bracket_height-pcb_thickness-standoff_height,slots_area_left,0]) {
                        cube([case_thickness,slots_area_width,bracket_depth]);
                    }
                }
                // ISA carts mounting holes
                for(slot_num = [0 : slots-1]) {
                    translate([inside_height-standoff_height-pcb_thickness-bracket_height-tolerance,mb_to_case_left+mb_to_left_slot+slot_spacing*slot_num+hole_y,hole_z ]) {
                        rotate([0,90,0]) cylinder(h=case_thickness+tolerance*2,r=m3_tap_hole_radius);
                    }
                }
                // cutout for the ISA slots cover
                translate([inside_height-standoff_height-pcb_thickness-bracket_height+case_thickness/2-tolerance,slots_area_left-0.6-tolerance,bracket_depth-bracket_thickness-tolerance]) {
                    cube([bracket_height+tolerance*2,slots_area_width+0.6*2+tolerance*2,bracket_thickness+tolerance*2]);
                }

                translate([inside_height-bracket_height-tolerance,slots_area_left-bracket_thickness-tolerance,bracket_depth-bracket_thickness-tolerance]) {
                    cube([bracket_height-20+tolerance*2,slots_area_width+bracket_thickness*2+tolerance*2,bracket_thickness+tolerance*2]);
                }
                
                translate([inside_height-bracket_height-tolerance,slots_area_left-bracket_thickness,bracket_depth-bracket_thickness*1.5-5]) {
                    rotate([45,0,0]) {
                        cube([bracket_height-20+tolerance*2, bracket_thickness/sqrt(2),bracket_thickness/sqrt(2)]);
                    }
                }
                
                translate([inside_height-bracket_height-tolerance,slots_area_left+slots_area_width+bracket_thickness,bracket_depth-bracket_thickness*1.5-5]) {
                    rotate([45,0,0]) {
                        cube([bracket_height-20+tolerance*2, bracket_thickness/sqrt(2),bracket_thickness/sqrt(2)]);
                    }
                }
            }
        }
    }
}

module slots_cover() {
    cutout_width=0.5*in2mm;
    cutout_height=95;
    cutout_radius=1.27;
    mb_to_cutout=8.06-pcb_thickness;


    difference() {
        union() {
            translate([-case_thickness/2,-0.6,0]) {
                cube([bracket_height,slots_area_width+0.6*2,bracket_thickness]);
            }
            translate([20-standoff_height-pcb_thickness,-bracket_thickness-tolerance,0]) {
                cube([bracket_height-20,slots_area_width+bracket_thickness*2+tolerance*2,bracket_thickness]);
            }

            translate([20-standoff_height-pcb_thickness,-bracket_thickness*2-tolerance,0]) {
                cube([bracket_height-20,bracket_thickness,5+bracket_thickness*1.5]);
            }

            translate([20-standoff_height-pcb_thickness,slots_area_width+bracket_thickness+tolerance,0]) {
                cube([bracket_height-20,bracket_thickness,5+bracket_thickness*1.5]);
            }

            translate([20-standoff_height-pcb_thickness,-bracket_thickness-tolerance,5+bracket_thickness*0.5]) {
                rotate([45,0,0])
                cube([bracket_height-20,bracket_thickness/sqrt(2),bracket_thickness/sqrt(2)]);
            }
            translate([20-standoff_height-pcb_thickness,slots_area_width+bracket_thickness+tolerance,5+bracket_thickness*0.5]) {
                 rotate([45,0,0])
                 cube([bracket_height-20,bracket_thickness/sqrt(2),bracket_thickness/sqrt(2)]);
            }
        }
        translate([0,bracket_width/2+bracket_tab_offset,-tolerance]){
            // ISA slot cutouts
            for(slot_num = [0 : slots-1]) {
                translate([mb_to_cutout+cutout_radius,slot_spacing*slot_num-cutout_width/2+cutout_radius,0]) {
                    minkowski() {
                        cube([cutout_height-cutout_radius*2,cutout_width-cutout_radius*2,bracket_thickness+tolerance*2]);
                        cylinder(h=bracket_thickness+tolerance*2,r=cutout_radius);
                    }
                }
            }
        }
    }
}


// case front or back panels with nut inserts
module case_front_back_panel() {
    union() {
        // slot area
        translate([case_height,case_thickness,0]) {
            rotate([0,0,90]) {
                rounded_cube2(slots_area_left+slots_area_width+case_thickness,case_height,case_thickness,corner_radius);
            }
        }
        // left rounded vertial bar
        translate([0,slots_area_left+slots_area_width+case_thickness,0]) {
            rounded_cube8(12,case_height,case_thickness,corner_radius);
        }
        // rightmost side
        translate([case_height,case_thickness+inside_width-12,0]) {
            rotate([0,0,90]) {
                rounded_cube2(12,case_height,case_thickness,corner_radius);
            }
        }
        // right rounded vertial bar
        translate([0,case_thickness+inside_width-15,0]) {
            rounded_cube8(12,case_height,case_thickness,corner_radius);
        }
        // top rounded bar
        translate([0,case_thickness,0]) {
            rounded_cube8(inside_width,15,case_thickness,corner_radius);
        }
        // bottom rounded bar
        translate([case_height-14.6,case_thickness,0]) {
            rounded_cube8(inside_width,14.6,case_thickness,corner_radius);
        }

        // bottom support bar
        translate([case_height-case_thickness*2,case_thickness+15,case_thickness]) {
            cube([case_thickness,case_width-case_thickness*2-15*2,case_thickness]);
        }
        // side support bar
        translate([case_thickness+15,case_thickness,case_thickness]) {
            cube([case_height-case_thickness*2-15*2,case_thickness,case_thickness]);
        }
        
        // top left nut inserts
        translate([case_thickness+3,case_thickness+6,case_thickness]) {
            rotate([90,0,0]) {
                nut_insert_two_round_corners();
            }
        }
        // bottom left nut inserts
        translate([-case_thickness+case_height,case_thickness,case_thickness]) {
            rotate([0,0,90]) {
                nut_inserts_corner();
            }
        }
        // bottom right nut inserts
        translate([-case_thickness+case_height,-case_thickness+case_width,case_thickness]) {
            rotate([0,0,180]) {
                nut_inserts_corner();
            }
        }
        // top right nut inserts
        translate([case_thickness+3,-case_thickness+case_width,case_thickness]) {
            rotate([90,0]) {
                nut_insert_two_round_corners();
            }
        }
    }
}

// case motherboard tray
module case_mb_tray() {
    difference() {
        union() {
            cube([inside_depth+case_thickness-corner_radius,inside_width,case_thickness]);
            translate([inside_depth+case_thickness-corner_radius,0,corner_radius]) {
                rotate([-90,0,0]) {
                    cylinder(h=inside_width,r=corner_radius);
                }
            }
            // speaker
            translate([speaker_to_case_back,speaker_to_case_left,case_thickness]){
                // speaker center circle
                cylinder(h=speaker_height,r=speaker_radius+case_thickness);
                // speaker mount standoffs
                translate([15,15,0]) {
                    cylinder(h=speaker_height,r=standoff_radius);
                }
                translate([-15,-15,0]) {
                    cylinder(h=speaker_height,r=standoff_radius);
                }
            }
        }
        // back left screw hole
        translate([9,9,0]) {
            m3_flat_screw_hole();
        }
        // back right screw hole
        translate([9,inside_width-9,0]) {
            m3_flat_screw_hole();
        }
        // center front support screw hole
        translate([inside_depth+case_thickness-support_width/2,inside_width/2,case_thickness]) {
            rotate([0,180,0]) {
                m3_flat_screw_hole();
            }
        }
        // center back support screw hole
        translate([psu_x_offset-case_thickness+support_width/2,drive_y_offset+hdd_width+tolerance+case_thickness,case_thickness]) {
            rotate([0,180,0]) {
                m3_flat_screw_hole();
            }
        }
        
        // left cutout for cables routing
        translate([(inside_depth-cable_routing_depth_left)/2,0,-tolerance]) {
            translate([0,-tolerance,0]) {
                cube([cable_routing_depth_left,cable_routing_width_left-corner_radius+tolerance,case_thickness+tolerance*2]);
            }
            translate([corner_radius,0,0]) {
                cube([cable_routing_depth_left-corner_radius*2,cable_routing_width_left,case_thickness+tolerance*2]);
            }
            translate([corner_radius,cable_routing_width_left-corner_radius,0]) {
                cylinder(h=case_thickness+tolerance*2,r=corner_radius);
            }
            translate([cable_routing_depth_left-corner_radius,cable_routing_width_left-corner_radius,0]) {
                cylinder(h=case_thickness+tolerance*2,r=corner_radius);
            }
        }
        // right cutout for cables routing
        translate([inside_depth-cable_routing_depth_right-12-3,inside_width-cable_routing_width_right,-tolerance]) {
            translate([0,corner_radius,0]) {
                cube([cable_routing_depth_right,cable_routing_width_right-corner_radius+tolerance,case_thickness+tolerance*2]);
            }
            translate([corner_radius,0,0]) {
                cube([cable_routing_depth_right-corner_radius*2,cable_routing_width_right+tolerance,case_thickness+tolerance*2]);
            }
            translate([corner_radius,corner_radius,0]) {
                cylinder(h=case_thickness+tolerance*2,r=corner_radius);
            }
            translate([cable_routing_depth_right-corner_radius,corner_radius,0]) {
                cylinder(h=case_thickness+tolerance*2,r=corner_radius);
            }
            
        }
        // cutouts under the motherboard
        mb_cutout_x_offset=mb_to_case_back+bracket_depth+bar_width;
        mb_left_cutout_y_offset=bar_width+cable_routing_width_left;
        mb_right_cutout_y_offset=(inside_width+bar_width)/2;
        mb_left_cutout_width=inside_width/2-bar_width*1.5-cable_routing_width_left;
        mb_right_cutout_width=inside_width/2-bar_width*1.5;
//        mb_right_cutout_width=inside_width/2-bar_width*1.5-cable_routing_width_right;
        mb_left_cutout_depth=inside_depth-mb_cutout_x_offset-bar_width;
        mb_right_cutout_depth=inside_depth-mb_cutout_x_offset-bar_width;
        // left cutout under the motherboard
        translate([mb_cutout_x_offset,mb_left_cutout_y_offset,-tolerance]) {
            rounded_cube4(mb_left_cutout_depth,mb_left_cutout_width,case_thickness+tolerance*2,corner_radius);
        }
        // right cutout under the motherboard
        translate([mb_cutout_x_offset,mb_right_cutout_y_offset,-tolerance]) {
            rounded_cube4(mb_right_cutout_depth,mb_right_cutout_width,case_thickness+tolerance*2,corner_radius);
        }

        // power supply vent opening
        translate([psu_x_offset+psu_depth/2+10,psu_y_offset+psu_width/2,-tolerance]) {
            cylinder(h=case_thickness+tolerance*2, d=psu_fan_diameter);
            cylinder(h=0.5+tolerance, d1=psu_fan_diameter+1+tolerance*2,d2=psu_fan_diameter);

        }
        translate([psu_x_offset+psu_depth/2+10,psu_y_offset+psu_width/2,case_thickness-0.5]) {
            cylinder(h=0.5+tolerance, d1=psu_fan_diameter, d2=psu_fan_diameter+1+tolerance*2);
        }

        // ISA brackets cut-outs
        translate([0,0,case_thickness]) {
            for(slot_num = [0 : slots-1]) {
                 translate([bracket_depth-tolerance,mb_to_case_left+mb_to_left_slot+slot_spacing*slot_num-tongue_cutout_width/2,-1]) {
                    cube([mb_to_case_back+tolerance*2,tongue_cutout_width,1+tolerance]);
                 }
            } 
        }
        
        // speaker cut-outs
        translate([speaker_to_case_back,speaker_to_case_left,case_thickness]){
            // speaker center cut-out
            cylinder(h=speaker_height+tolerance,r=speaker_radius+tolerance);
            translate([15,15,0]) {
                cylinder(h=speaker_height+tolerance,r=m3_tap_hole_radius);
            }
            translate([-15,-15,0]) {
                cylinder(h=speaker_height+tolerance,r=m3_tap_hole_radius);
            }
            // speaker grill
            translate([vent_holes_vert_step,0,-case_thickness-tolerance]) {
                cylinder(h=case_thickness+tolerance*2,r=vent_hole_radius,$fn=6);
            }
            translate([-vent_holes_vert_step,0,-case_thickness-tolerance]) {
                cylinder(h=case_thickness+tolerance*2,r=vent_hole_radius,$fn=6);
            }
            translate([0,vent_holes_horiz_step*0.5,-case_thickness-tolerance]) {
                cylinder(h=case_thickness+tolerance*2,r=vent_hole_radius,$fn=6);
            }
            translate([0,-vent_holes_horiz_step*0.5,-case_thickness-tolerance]) {
                cylinder(h=case_thickness+tolerance*2,r=vent_hole_radius,$fn=6);
            }
            translate([0,vent_holes_horiz_step*1.5,-case_thickness-tolerance]) {
                cylinder(h=case_thickness+tolerance*2,r=vent_hole_radius,$fn=6);
            }
            translate([0,-vent_holes_horiz_step*1.5,-case_thickness-tolerance]) {
                cylinder(h=case_thickness+tolerance*2,r=vent_hole_radius,$fn=6);
            }

            translate([vent_holes_vert_step,vent_holes_horiz_step,-case_thickness-tolerance]) {
                cylinder(h=case_thickness+tolerance*2,r=vent_hole_radius,$fn=6);
            }
            translate([-vent_holes_vert_step,vent_holes_horiz_step,-case_thickness-tolerance]) {
                cylinder(h=case_thickness+tolerance*2,r=vent_hole_radius,$fn=6);
            }

            translate([vent_holes_vert_step,-vent_holes_horiz_step,-case_thickness-tolerance]) {
                cylinder(h=case_thickness+tolerance*2,r=vent_hole_radius,$fn=6);
            }
            translate([-vent_holes_vert_step,-vent_holes_horiz_step,-case_thickness-tolerance]) {
                cylinder(h=case_thickness+tolerance*2,r=vent_hole_radius,$fn=6);
            }
        }
    }
    // case inside translate
    translate([0,0,case_thickness]) {
        // motherboard - standoffs
        // motherboard translate
        translate([mb_to_case_back+bracket_depth,mb_to_case_left,0]) {
            // motherboard standoffs
            translate([0.4*in2mm,0.65*in2mm,0]) {
                mb_standoff();
            }
            translate([6.5*in2mm,0.65*in2mm,0]) {
                mb_standoff();
            }
            translate([0.4*in2mm,3.75*in2mm,0]) {
                mb_standoff();
            }
            translate([6.5*in2mm,3.75*in2mm,0]) {
                mb_standoff();
            }
            translate([0.4*in2mm,5.55*in2mm,0]) {
                mb_standoff();
            }
            translate([0.4*in2mm,8.35*in2mm,0]) {
                mb_standoff();
            }
            translate([6.5*in2mm,8.35*in2mm,0]) {
                mb_standoff();
            }
        }
        // nut insert - front left
        translate([inside_depth-case_thickness-12,6+tolerance,0]) {
            rotate([90,0,0]) {
                nut_insert_two_round_corners();
            }
        }
        // nut insert - front right
        translate([inside_depth-case_thickness-12,inside_width-tolerance,0]) {
                rotate([90,0,0]) {
                    nut_insert_two_round_corners();
                }
            }

    }
}

module case_bottom() {
    rotate([0,0,-90]) {
        translate([-inside_width,0,0]) {
            rounded_cube2(inside_width,case_depth,case_thickness,corner_radius);
        }
    }
    // nut insert - back left
    translate([case_thickness+3,6,case_thickness]) {
        rotate([90,0,0]) {
            nut_insert_two_round_corners();
        }
    }
    // nut insert - front left
    translate([case_depth-case_thickness*2-12,6,case_thickness]) {
        rotate([90,0,0]) {
            nut_insert_two_round_corners();
        }
    }
    // nut insert - back right
    translate([case_thickness+3,inside_width,case_thickness]) {
        rotate([90,0,0]) {
            nut_insert_two_round_corners();
        }
    }
    // nut insert - front right
    translate([case_depth-case_thickness*2-12,inside_width,case_thickness]) {
        rotate([90,0,0]) {
            nut_insert_two_round_corners();
        }
    }
    // left drives mounting bracket
    translate([hdd_x_offset+case_thickness-hdd_mount_depth_3,drive_y_offset-case_thickness-tolerance,case_thickness]) {
        drives_mount();
    }
    // right drives mounting bracket
    translate([hdd_x_offset+case_thickness-hdd_mount_depth_3,drive_y_offset+hdd_width+tolerance,case_thickness]) {
        drives_mount();
    }
    // left PSU mounting bracket
    difference() {
        union() {
            translate([psu_x_offset,drive_y_offset+hdd_width+tolerance,case_thickness]) {
                cube([hdd_x_offset+case_thickness-hdd_mount_depth_3-psu_x_offset-screw_to_edge,case_thickness,drive_z_offset+drive_spacing+hdd_mount_height]);
                cube([case_thickness,psu_y_offset+psu_mount_width1-(drive_y_offset+hdd_width+tolerance)+screw_to_edge,bottom_to_mb_height]);
                // center back support
                cube([support_width,case_thickness*2,bottom_to_mb_height]);
            }
        }
        // PSU middle left mount hole
        translate([psu_x_offset,psu_y_offset+psu_mount_width1,bottom_to_mb_height/2+case_thickness]) {
            rotate([0,90,0]) {
                unc6_32_screw_hole();
            }
        }
        // PSU bottom left mount hole
        translate([psu_x_offset,psu_y_offset+psu_mount_width1,bottom_to_mb_height/2+psu_mount_height1-psu_mount_height2+case_thickness]) {
            rotate([0,90,0]) {
                unc6_32_screw_hole();
            }
        }
        // PSU top left mount hole
        translate([psu_x_offset,psu_y_offset+psu_mount_width1,bottom_to_mb_height/2+psu_mount_height3-psu_mount_height2+case_thickness]) {
            rotate([0,90,0]) {
                unc6_32_screw_hole();
            }
        }
        // center back support screw hole
        translate([psu_x_offset+support_width/2,drive_y_offset+hdd_width+tolerance+case_thickness,case_thickness+bottom_to_mb_height-support_screw_length]) {
            cylinder(h=support_screw_length+tolerance,r=m3_tap_hole_radius);
        }
    }
    // center front support
    translate([inside_depth-support_width/2,(inside_width-support_width)/2,case_thickness]) {
        difference() {
            // support
            translate([0,support_width,bottom_to_mb_height]) {
                rotate([180,0,0]) {
                    rounded_cube8(support_width,support_width,bottom_to_mb_height,corner_radius);
                }
            }
            // screw hole
            translate([support_width/2,support_width/2,bottom_to_mb_height-support_screw_length]) {
                cylinder(h=support_screw_length+tolerance,r=m3_tap_hole_radius);
            }
        }
    }
}


// case left side
module case_left() {
    difference() {
        union() {
            // top horizontal bar along the motherboard tray
            translate([0,-bottom_to_mb_height-bar_width,0]) {
                rounded_cube8(bar_width,case_depth,case_thickness,corner_radius);
            }
            // back vertical bar
            translate([0,-bottom_to_mb_height-case_height,0]) {
                rounded_cube8(case_height+bottom_to_mb_height+case_thickness,bar_width,case_thickness,corner_radius);
            }
            // front vertical bar
            translate([case_depth-bar_width,-bottom_to_mb_height-case_thickness,0]) {
                rounded_cube8(bottom_to_mb_height+case_thickness*2,bar_width,case_thickness,corner_radius);
            }
        }
        // back bottom screw hole
        translate([9+case_thickness,-9,0]) {
            m3_flat_screw_hole();
        }
        // front bottom screw hole
        translate([case_depth-9-case_thickness,-9,0]) {
            m3_flat_screw_hole();
        }
        // back motherboard tray screw hole
        translate([9+case_thickness,-9-bottom_to_mb_height-case_thickness,0]) {
            m3_flat_screw_hole();
        }
        // front motherboard tray screw hole
        translate([case_depth-9-case_thickness,-9-bottom_to_mb_height-case_thickness,0]) {
            m3_flat_screw_hole();
        }
        // back top screw hole
        translate([9+case_thickness,9-case_height-bottom_to_mb_height+case_thickness,0]) {
            m3_flat_screw_hole();
        }
    }
}

// case right side
module case_right() {
    mirror([0,0,1]) {
        case_left();
    }
    rotate([90,0,0]) {
            // top right PSU mounting bracket
            difference() {
                union() {
                    translate([psu_x_offset,-case_thickness-inside_width+psu_y_offset+psu_mount_width2,bottom_to_mb_height/2+psu_mount_height3-psu_mount_height2-screw_to_edge]) {
                        cube([case_thickness,inside_width-psu_y_offset-psu_mount_width2,bottom_to_mb_height-(bottom_to_mb_height/2+psu_mount_height3-psu_mount_height2-screw_to_edge)]);
                    }
                    translate([psu_x_offset,-case_thickness-inside_width+psu_y_offset+psu_mount_width2-screw_to_edge,bottom_to_mb_height/2+psu_mount_height3-psu_mount_height2]) {
                        cube([case_thickness,inside_width-psu_y_offset-psu_mount_width2+screw_to_edge,bottom_to_mb_height-(bottom_to_mb_height/2+psu_mount_height3-psu_mount_height2)]);
                    }
                    // PSU top right mount ear
                    translate([psu_x_offset,-case_thickness-inside_width+psu_y_offset+psu_mount_width2,bottom_to_mb_height/2+psu_mount_height3-psu_mount_height2]) {
                        rotate([0,90,0]) {
                            cylinder(h=case_thickness, r=screw_to_edge);
                        }
                    }
                }
                // PSU top right mount hole
                translate([psu_x_offset,-case_thickness-inside_width+psu_y_offset+psu_mount_width2,bottom_to_mb_height/2+psu_mount_height3-psu_mount_height2]) {
                    rotate([0,90,0]) {
                        unc6_32_screw_hole();
                    }
                }
            }
        }
}

module drives_mount() {
    difference() {
        union() {
            // two overlapping rectangles
            translate([-screw_to_edge,0,0]) {
                cube([hdd_mount_depth_3-hdd_mount_depth_1+screw_to_edge*2,case_thickness,drive_z_offset+drive_spacing+hdd_mount_height]);
            }
            translate([0,0,0]) {
                cube([hdd_mount_depth_3-hdd_mount_depth_1,case_thickness,drive_z_offset+drive_spacing+hdd_mount_height+screw_to_edge]);
            }
            // rounded corner 1
            translate([0,0,drive_z_offset+drive_spacing+hdd_mount_height]) {
                rotate([-90,0,0]) {
                    cylinder(h=case_thickness,r=screw_to_edge);
                }
            }
            // rounded corner 2
            translate([hdd_mount_depth_3-hdd_mount_depth_1,0,drive_z_offset+drive_spacing+hdd_mount_height]) {
                rotate([-90,0,0]) {
                    cylinder(h=case_thickness,r=screw_to_edge);
                }
            }
        }
        // bottom hard drive mount hole 1 - back
        translate([0,0,drive_z_offset+hdd_mount_height]) {
            rotate([-90,0,0]) {
                unc6_32_screw_hole();
            }
        }
        // bottom floppy drive mount hole 1 - back
        translate([floppy_mount_depth_1-hdd_mount_depth_1+hdd_mount_depth_3-floppy_mount_depth_3,0,drive_z_offset+hdd_mount_height]) {
            rotate([-90,0,0]) {
                unc6_32_screw_hole();
            }
        }
        // bottom hard drive mount hole 2 - middle
        translate([hdd_mount_depth_3-hdd_mount_depth_2,0,drive_z_offset+hdd_mount_height]) {
            rotate([-90,0,0]) {
                unc6_32_screw_hole();
            }
        }
        // bottom hard drive mount hole 3 - front
        translate([hdd_mount_depth_3-hdd_mount_depth_1,0,drive_z_offset+hdd_mount_height]) {
            rotate([-90,0,0]) {
                unc6_32_screw_hole();
            }
        }
        // top hard drive mount hole 1 - back
        translate([0,0,drive_z_offset+drive_spacing+hdd_mount_height]) {
            rotate([-90,0,0]) {
                unc6_32_screw_hole();
            }
        }
        // top floppy drive mount hole 1 - back
        translate([floppy_mount_depth_1-hdd_mount_depth_1+hdd_mount_depth_3-floppy_mount_depth_3,0,drive_z_offset+drive_spacing+hdd_mount_height]) {
            rotate([-90,0,0]) {
                unc6_32_screw_hole();
            }
        }
        // top hard drive mount hole 2 - middle
        translate([hdd_mount_depth_3-hdd_mount_depth_2,0,drive_z_offset+drive_spacing+hdd_mount_height]) {
            rotate([-90,0,0]) {
                unc6_32_screw_hole();
            }
        }
        // top hard drive mount hole 3 - front
        translate([hdd_mount_depth_3-hdd_mount_depth_1,0,drive_z_offset+drive_spacing+hdd_mount_height]) {
            rotate([-90,0,0]) {
                unc6_32_screw_hole();
            }
        }
    }
}

module mb_standoff() {
    difference() {
        union() {
            cylinder(h=standoff_radius*0.5,r1=standoff_radius*1.5,r2=standoff_radius);
            cylinder(h=standoff_height,r=standoff_radius);
        }
        // screw hole
        cylinder(h=standoff_height,r=m3_tap_hole_radius);
    }
}

module speaker_bracket() {
    difference() {
        hull() {
            // rounded sides
            translate([15,15,0]) {
                cylinder(h=case_thickness,r=standoff_radius);
            }
            translate([-15,-15,0]) {
                cylinder(h=case_thickness,r=standoff_radius);
            }
        }
        translate([15,15,0]) {
            m3_flat_screw_hole();
        }
        translate([-15,-15,0]) {
            m3_flat_screw_hole();
        }
    }
}

module mb()
{
    isa8_slot_x=87.88;
    isa16_slot_x=55.4;
    isa_slot_y=9.1;
    isa_slot_z=15.42;
    isa8_edge_x=84.12;
    isa16_edge_x=51.1;
    isa_edge_y=2;
    isa_edge_z=0.3*in2mm;
    // motherboard PCB
    color("blue") {
        difference() {
            cube([mb_depth,mb_width,pcb_thickness]);
            // motherboard mounting holes
            translate([0.4*in2mm,0.65*in2mm,-tolerance]) {
                cylinder(h=pcb_thickness+tolerance*2,r=2);
            }
            translate([6.5*in2mm,0.65*in2mm,-tolerance]) {
                cylinder(h=pcb_thickness+tolerance*2,r=2);
            }
            translate([0.4*in2mm,3.75*in2mm,-tolerance]) {
                cylinder(h=pcb_thickness+tolerance*2,r=2);
            }
            translate([6.5*in2mm,3.75*in2mm,-tolerance]) {
                cylinder(h=pcb_thickness+tolerance*2,r=2);
            }
            translate([0.4*in2mm,5.55*in2mm,-tolerance]) {
                cylinder(h=pcb_thickness+tolerance*2,r=2);
            }
            translate([0.4*in2mm,8.35*in2mm,-tolerance]) {
                cylinder(h=pcb_thickness+tolerance*2,r=2);
            }
            translate([6.5*in2mm,8.35*in2mm,-tolerance]) {
                cylinder(h=pcb_thickness+tolerance*2,r=2);
            }
        }
    }
    // isa slots
    color("DarkSlateGray") {
        for(slot_num = [0 : slots-1]) {
            // 8 bit part of an ISA slot
            difference() {
                translate([2.5*in2mm-isa8_slot_x/2,slot_spacing*slot_num+0.25*in2mm-isa_slot_y/2,pcb_thickness]) {
                    cube([isa8_slot_x,isa_slot_y,isa_slot_z]);
                }
                translate([2.5*in2mm-isa8_edge_x/2,slot_spacing*slot_num+0.25*in2mm-isa_edge_y/2,pcb_thickness+isa_slot_z-isa_edge_z]) {
                    cube([isa8_edge_x,isa_edge_y,isa_edge_z+tolerance]);
                }
            }
            // 16 bit extension part of an ISA slot
            difference() {
                translate([5.25*in2mm-isa16_slot_x/2,slot_spacing*slot_num+0.25*in2mm-isa_slot_y/2,pcb_thickness]) {
                    cube([isa16_slot_x,isa_slot_y,isa_slot_z]);
                }
                translate([5.25*in2mm-isa16_edge_x/2,slot_spacing*slot_num+0.25*in2mm-isa_edge_y/2,pcb_thickness+isa_slot_z-isa_edge_z]) {
                    cube([isa16_edge_x,isa_edge_y,isa_edge_z+tolerance]);
                }
            }
        }
    }
}

module floppy_drive() {
    color("silver") difference() {
        cube([floppy_depth,floppy_height,floppy_width]);
        translate([floppy_depth-floppy_mount_depth_1,floppy_mount_height,-tolerance]) {
            cylinder(h=6,r=1.5);
        }
        translate([floppy_depth-floppy_mount_depth_2,floppy_mount_height,-tolerance]) {
            cylinder(h=6,r=1.5);
        }
        translate([floppy_depth-floppy_mount_depth_3,floppy_mount_height,-tolerance]) {
            cylinder(h=6,r=1.5);
        }
        translate([floppy_depth-floppy_mount_depth_1,floppy_mount_height,floppy_width-6+tolerance]) {
            cylinder(h=6,r=1.5);
        }
        translate([floppy_depth-floppy_mount_depth_2,floppy_mount_height,floppy_width-6+tolerance]) {
            cylinder(h=6,r=1.5);
        }
        translate([floppy_depth-floppy_mount_depth_3,floppy_mount_height,floppy_width-6+tolerance]) {
            cylinder(h=6,r=1.5);
        }
    }
    
    union() {
        // bezel
        color("ivory") {
            difference () {
                translate([floppy_depth,0,0]) {
                    cube([floppy_bezel_depth,floppy_height,floppy_width]);
                }
                translate([floppy_depth+floppy_bezel_depth-1,3,floppy_width/2-36/2]) {
                    cube([1.1,20,36]);
                }
            }
        }
        // eject button
        translate([floppy_depth+floppy_bezel_depth,6-6/2,floppy_width/2-30-11.5/2]) {
            color("beige") cube([1,6,11.5]);
        }
        // LED
        translate([floppy_depth+floppy_bezel_depth,6-2/2,floppy_width/2+27.5-5/2]) {
            color("SpringGreen") cube([0.5,2,5]);
        }
        // diskette
        translate([floppy_depth+floppy_bezel_depth,17-4.6/2,(floppy_width-90.6)/2]) {
            color("blue") cube ([15,4.6,90.6]);
        }
    }
}

module sfx_power_supply() {
    rotate([0,90,0]) {
        color("LightGray") {
            difference() {
                cube([psu_height,psu_width,psu_depth]);
                // fan opening
                translate([-tolerance,psu_width/2,psu_depth/2]) {
                    rotate([0,90,0]) {
                        cylinder(h=2, d=psu_fan_diameter);
                    }
                }
                // mount holes
                translate([psu_mount_height1, psu_mount_width1,-tolerance]) {
                    cylinder(h=6,d=3.505);
                }
                cube([psu_height,psu_width,psu_depth]);
                translate([psu_mount_height1, psu_mount_width2,-tolerance]) {
                    cylinder(h=6,d=3.505);
                }
                cube([psu_height,psu_width,psu_depth]);
                translate([psu_mount_height2, psu_mount_width1,-tolerance]) {
                    cylinder(h=6,d=3.505);
                }
                cube([psu_height,psu_width,psu_depth]);
                translate([psu_mount_height2, psu_mount_width2,-tolerance]) {
                    cylinder(h=6,d=3.505);
                }
                cube([psu_height,psu_width,psu_depth]);
                translate([psu_mount_height3, psu_mount_width1,-tolerance]) {
                    cylinder(h=6,d=3.505);
                }
                cube([psu_height,psu_width,psu_depth]);
                translate([psu_mount_height3, psu_mount_width2,-tolerance]) {
                    cylinder(h=6,d=3.505);
                }
            }
        }
    }
}

module hard_drive() {
    color("DarkSlateGray") difference() {
        cube([hdd_depth,hdd_height,hdd_width]);
        translate([hdd_depth-hdd_mount_depth_1,hdd_mount_height,-tolerance]) {
            cylinder(h=6,d=3.505);
        }
        translate([hdd_depth-hdd_mount_depth_2,hdd_mount_height,-tolerance]) {
            cylinder(h=6,d=3.505);
        }
        translate([hdd_depth-hdd_mount_depth_3,hdd_mount_height,-tolerance]) {
            cylinder(h=6,d=3.505);
        }
        translate([hdd_depth-hdd_mount_depth_1,hdd_mount_height,hdd_width-6+tolerance]) {
            cylinder(h=6,d=3.505);
        }
        translate([hdd_depth-hdd_mount_depth_2,hdd_mount_height,hdd_width-6+tolerance]) {
            cylinder(h=6,d=3.505);
        }
        translate([hdd_depth-hdd_mount_depth_3,hdd_mount_height,hdd_width-6+tolerance]) {
            cylinder(h=6,d=3.505);
        }
    }
}

// rectangluar prism with rounded edges on 2 out of 12 sides
module rounded_cube2(depth,width,height,radius) {
    union() {
        translate([0,radius,radius]) {
            rotate([0,90,0]) {
                cylinder(h=depth,r=radius);
            }
        }
        translate([0,width-radius,radius]) {
            rotate([0,90,0]) {
                cylinder(h=depth,r=radius);
            }
        }
        translate([0,radius,0]) {
            cube([depth,width-radius*2,radius]);
        }
        translate([0,0,radius]) {
            cube([depth,width,height-radius]);
        }
    }
}

// rectangluar prism with rounded edges on 4 out of 12 sides
// edges along Z access are rounded
module rounded_cube4(x,y,z,radius) {
    union() {
        translate([radius,radius,0]) {
            cylinder(h=z,r=radius);
        }
        translate([radius,y-radius,0]) {
            cylinder(h=z,r=radius);
        }
        translate([x-radius,radius,0]) {
            cylinder(h=z,r=radius);
        }
        translate([x-radius,y-radius,0]) {
            cylinder(h=z,r=radius);
        }
        translate([radius,0,0]) {
            cube([x-radius*2,y,z]);
        }
        translate([0,radius,0]) {
            cube([x,y-radius*2,z]);
        }
    }
}

// rectangluar prism with rounded edges on 8 out of 12 sides
module rounded_cube8(x,y,z,radius) {
    union() {
        translate([radius,radius,radius]) {
            rotate([0,90,0]) {
                cylinder(h=y-radius*2,r=radius);
            }
            rotate([270,0,0]) {
                cylinder(h=x-radius*2,r=radius);
            }
            cylinder(h=z-radius,r=radius);
            sphere(r=radius);
        }
        translate([radius,x-radius,radius]) {
            rotate([0,90,0]) {
                cylinder(h=y-radius*2,r=radius);
            }
            cylinder(h=z-radius,r=radius);
            sphere(r=radius);
        }
        translate([y-radius,radius,radius]) {
            rotate([270,0,0]) {
                cylinder(h=x-radius*2,r=radius);
            }
            cylinder(h=z-radius,r=radius);
            sphere(r=radius);
        }
        translate([y-radius,x-radius,radius]) {
            cylinder(h=z-radius,r=radius);
            sphere(r=radius);
        }
        
        translate([radius,radius,0]) {
            cube([y-radius*2,x-radius*2,radius]);
        }
        translate([radius,0,radius]) {
            cube([y-radius*2,x,z-radius]);
        }
        translate([0,radius,radius]) {
            cube([y,x-radius*2,z-radius]);
        }
    }
}

// corner piece with two nut inserts
// size: X*Y*Z = 15*15*12
// hole centers: X*Y*Z = 0,9,9 and X*Y*Z = 9,0,9
module nut_inserts_corner() {
    union() {
        translate([3,6,0]) {
            rotate([90,0,0]) {
                nut_insert();
            }
        }
        translate([0,3,0]) {
            rotate([90,0,90]) {
            
                nut_insert();
            }
        }
        cube([3,3,12]);
    }
}

// nut insert with a cutout for a square nut
// lays down X-Y plane, screw hole is parallel to Z axis
module nut_insert() {
    difference() {
        // corner plastic
        union() {
            cube([12-nut_inserts_radius,12,6]);
            cube([12,12-nut_inserts_radius,6]);
            translate([12-nut_inserts_radius,12-nut_inserts_radius,0]) {
                cylinder(h=6,r=nut_inserts_radius);
            }
        }
        // cutouts
        // screw hole
        translate([6,9,-tolerance]){
            cylinder(h=6+tolerance*2,r=m3_hole_radius);
        }
        // nut slot
        translate([3,6,2]) {
            cube([6,6+tolerance,2]);
        }
    }
}

// nut insert with a cutout for a square nut
// lays down X-Y plane, screw hole is parallel to Z axis
module nut_insert_two_round_corners() {
    difference() {
        // corner plastic
        union() {
            translate([nut_inserts_radius,0,0]) {
                cube([12-nut_inserts_radius*2,12,6]);
            }
            cube([12,12-nut_inserts_radius,6]);
            translate([nut_inserts_radius,12-nut_inserts_radius,0]) {
                cylinder(h=6,r=nut_inserts_radius);
            }
            translate([12-nut_inserts_radius,12-nut_inserts_radius,0]) {
                cylinder(h=6,r=nut_inserts_radius);
            }
        }
        // cutouts
        // screw hole
        translate([6,9,-tolerance]){
            cylinder(h=6+tolerance*2,r=m3_hole_radius);
        }
        // nut slot
        translate([3,6,2]) {
            cube([6,6+tolerance,2]);
        }
    }
}



module m3_flat_screw_hole() {
    translate([0,0,-tolerance]) {
        cylinder(h=case_thickness+tolerance*3, r=m3_hole_radius);
        cylinder(h=0.5+0.01,r=m3_head_radius);
        translate([0,0,0.5]) {
            cylinder(h=m3_head_radius,r1=m3_head_radius,r2=0);
        }
    }
}

module m3_screw_hole() {
    translate([0,0,-tolerance]) {
        cylinder(h=case_thickness+tolerance*3, r=m3_hole_radius);
    }
}

module unc6_32_screw_hole() {
    translate([0,0,-tolerance]) {
        cylinder(h=case_thickness+tolerance*3, r=unc3_32_hole_radius);
    }
}
