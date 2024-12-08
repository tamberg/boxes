// CC BY-SA 4.0, @tamberg

$fn = 72;

wx = 73;
wy = 60;
h = 35;

module round_cube(wx, wy, h, r) {
    hull() {
        translate([r, r, r]) sphere(r);
        translate([wx - r, r, r]) sphere(r);
        translate([wx - r, wy - r, r]) sphere(r);
        translate([r, wy - r, r]) sphere(r);
        translate([r, r, h - r]) sphere(r);
        translate([wx - r, r, h - r]) sphere(r);
        translate([wx - r, wy - r, h - r]) sphere(r);
        translate([r, wy - r, h - r]) sphere(r);
    }
}

module round_cube2(wx, wy, h, r) {
    hull() {
        translate([r, r, r]) sphere(r);
        translate([wx - r, r, r]) sphere(r);
        translate([wx - r, wy - r, r]) sphere(r);
        translate([r, wy - r, r]) sphere(r);
        translate([r, r, h - r]) cylinder(r, r, r);
        translate([wx - r, r, h - r]) cylinder(r, r, r);
        translate([wx - r, wy - r, h - r]) cylinder(r, r, r);
        translate([r, wy - r, h - r]) cylinder(r, r, r);
    }
}

module round_cube3(wx, wy, h, r) {
    hull() {
        translate([r, r, 0]) cylinder(h, r, r);
        translate([wx - r, r, 0])  cylinder(h, r, r);
        translate([wx - r, wy - r, 0])  cylinder(h, r, r);
        translate([r, wy - r, 0])  cylinder(h, r, r);
    }
}

module round_box2(wx, wy, h, r, d) {
    difference() {
        round_cube2(wx, wy, h, r);
        translate([d, d, d]) round_cube2(wx - 2 * d, wy - 2 * d, h - d + 1, r - d);
    }
}

module round_box3(wx, wy, h, r, d) {
    difference() {
        round_cube3(wx, wy, h, r);
        translate([d, d, d]) round_cube3(wx - 2 * d, wy - 2 * d, h - d + 1, r - d);
    }
}

module round_box4(wx, wy, h, r, d) {
    difference() {
        round_cube3(wx, wy, h, r);
        translate([d, d, d]) round_cube2(wx - 2 * d, wy - 2 * d, h - d + 1, r - d);
    }
}

module round_cover(wx, wy, r, d) {
    union() {
        translate([d - .1, d - .1, 0.25 * d]) round_box3(wx - 2 * d + 2 * .1, wy - 2 * d + 2 * .1, 5 * d, r, d);
        round_cube3(wx, wy, 1.25 * d, r);
    }
}

module round_box_array(wx, wy, h, r, d, n) {
    difference() {
        round_cube3(wx, wy, h, r);
        w = (wx - (n + 1) * d)/n;
        for (i = [0:n]) {
            translate([i * w + (i + 1) * d, d, d]) round_cube2(w, wy - 2 * d, h - d + 1, r - d);
        }
        translate([d, d, h - 5 * d]) round_cube3(wx - 2 * d, wy - 2 * d, 5 * d + 1, r);
    }
}

module round_box_matrix(wx, wy, h, r, d, n, m) {
    difference() {
        round_cube3(wx, wy, h, r);
        wx2 = (wx - (n + 1) * d)/n;
        wy2 = (wy - (m + 1) * d)/m;
        for (i = [0:n - 1]) {
            for (j = [0:m - 1]) {
                translate([i * wx2 + (i + 1) * d, j * wy2 + (j + 1) * d, d]) round_cube2(wx2, wy2, h - d + 1, r - d);
            }
        }
        translate([d, d, h - 5 * d]) round_cube3(wx - 2 * d, wy - 2 * d, 5 * d + 1, r);
    }
}

module round_box_grove2(wx, wy, h, r, d) {
    n = 1;
    m = 2;
    difference() {
        round_cube3(wx, wy, h, r);
        wx2 = ((wx - (n + 1) * d)/n) - (25 + d);
        wy2 = (wy - (m + 1) * d)/m;
        for (i = [0:n - 1]) {
            for (j = [0:m - 1]) {
                translate([i * wx2 + (i + 1) * d, j * wy2 + (j + 1) * d, d]) round_cube2(wx2, wy2, h - d + 1, r - d);
            }
        }
        translate([wx2 + 2 * d, d, d]) round_cube2(25, wy - 2 * d, h - d + 1, r - d);
        translate([d, d, h - 5 * d]) round_cube3(wx - 2 * d, wy - 2 * d, 5 * d + 1, r);
    }
}

module pi_zero_w() {
    cube([65, 12, 30]);
}

module feather() {
    cube([16, 51, 23]);
}

module sd_card() {
    cube([32, 2, 24]);
}

module sd_card2() {
    cube([2, 24, 32]);
}

module ranger() {
    cube([16, 51, 27]);    
}

module grove() {
    cube([20, 14, 24]);
}

module grove2() {
    cube([20, 24, 20]);    
}

module grove3() {
    cube([24, 42, 20]);    
}

module rotho_box() {
    # difference() {
        cube([182, 315, 108]);
        translate([(182 - 154) / 2, (315 - 290) / 2, 108 - 100]) cube([154, 290, 100 + 1]);
    }
}

module rotho_box_packed(wx, wy, h) {
    dx = (182 - 154) / 2;
    dy = (315 - 290) / 2;
    dh = 108 - 100;
    g = 1;
    rotho_box();
    translate([dx + g, dy + g, dh]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + wx + 2 * g, dy + g, dh]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + g, dy + 1, dh + (h + 2) + g]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + g, dy + 1 * wy + 2 * g, dh]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + g, dy + 2 * wy + 3 * g, dh]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + g, dy + 3 * wy + 4 * g, dh]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + g, dy + 4 * wy + 5 * g + (h + 2) + g, dh]) rotate([90, 0, 0]) round_cube3(wx, wy, h + 2, 8);    
}

module rotho_box_packed2(wx, wy, h) {
    dx = (182 - 154) / 2;
    dy = (315 - 290) / 2;
    dh = 108 - 100;
    g = 1;
    g2 = 0.2;
    rotho_box();
    translate([dx + g, dy + g, dh]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + wx + 2 * g, dy + g, dh]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + g, dy + 1 * wy + 2 * g, dh]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + g, dy + 2 * wy + 3 * g, dh]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + g, dy + 3 * wy + 4 * g, dh]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + g, dy + (h + 2) + g, dh + (h + 2) + g]) rotate([90, 0, 0]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + g, dy + 2 * (h + 2) + 2 * g2, dh + (h + 2) + g]) rotate([90, 0, 0]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + g, dy + 3 * (h + 2) + 3 * g2, dh + (h + 2) + g]) rotate([90, 0, 0]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + g, dy + 4 * (h + 2) + 4 * g2, dh + (h + 2) + g]) rotate([90, 0, 0]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + g, dy + 5 * (h + 2) + 5 * g2, dh + (h + 2) + g]) rotate([90, 0, 0]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + g, dy + 6 * (h + 2) + 6 * g2, dh + (h + 2) + g]) rotate([90, 0, 0]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + g, dy + 7 * (h + 2) + 7 * g2, dh + (h + 2) + g]) rotate([90, 0, 0]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + g, dy + 8 * (h + 2) + 8 * g2, dh]) rotate([90, 0, 0]) round_cube3(wx, wy, h + 2, 8);
}

module rotho_box_packed3(wx, wy, h) {
    dx = (182 - 154) / 2;
    dy = (315 - 290) / 2;
    dh = 108 - 100;
    g = 1;
    g2 = 0.2;
    rotho_box();
    translate([dx + g, dy + (h + 2) + g2, dh]) rotate([90, 0, 0]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + g, dy + 2 * (h + 2) + 2 * g2, dh]) rotate([90, 0, 0]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + g, dy + 3 * (h + 2) + 3 * g2, dh]) rotate([90, 0, 0]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + g, dy + 4 * (h + 2) + 4 * g2, dh]) rotate([90, 0, 0]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + g, dy + 5 * (h + 2) + 5 * g2, dh]) rotate([90, 0, 0]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + g, dy + 6 * (h + 2) + 6 * g2, dh]) rotate([90, 0, 0]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + g, dy + 7 * (h + 2) + 7 * g2, dh]) rotate([90, 0, 0]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + g, dy + 8 * (h + 2) + 8 * g2, dh]) rotate([90, 0, 0]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + g + wx + g, dy + (h + 2) + g2, dh]) rotate([90, 0, 0]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + g + wx + g, dy + 2 * (h + 2) + 2 * g2, dh]) rotate([90, 0, 0]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + g, dy + g, dh + wy + g]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + wx + 2 * g, dy + g, dh + wy + g]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + g, dy + 1 * wy + 2 * g, dh + wy + g]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + g, dy + 2 * wy + 3 * g, dh + wy + g]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + g, dy + 3 * wy + 4 * g, dh + wy + g]) round_cube3(wx, wy, h + 2, 8);
}

module rotho_box_packed4(wx, wy, h) {
    dx = (182 - 154) / 2;
    dy = (315 - 290) / 2;
    dh = 108 - 100;
    g = 1;
    g2 = 0.2;
    rotho_box();
    translate([dx + g, dy + g2, dh]) rotate([90, 0, 90]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + g, dy + wx + 2 * g2, dh]) rotate([90, 0, 90]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + g, dy + 2 * wx + 3 * g2, dh]) rotate([90, 0, 90]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + g, dy + 3 * wx + 4 * g2, dh]) rotate([90, 0, 90]) round_cube3(wx, wy, h + 2, 8);

    translate([dx + 1 * (h + 2) + 2 * g, dy + 0 * wx + 1 * g2, dh]) rotate([90, 0, 90]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + 1 * (h + 2) + 2 * g, dy + 1 * wx + 2 * g2, dh]) rotate([90, 0, 90]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + 1 * (h + 2) + 2 * g, dy + 2 * wx + 3 * g2, dh]) rotate([90, 0, 90]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + 1 * (h + 2) + 2 * g, dy + 3 * wx + 4 * g2, dh]) rotate([90, 0, 90]) round_cube3(wx, wy, h + 2, 8);

    translate([dx + 2 * (h + 2) + 3 * g, dy + 0 * wx + 1 * g2, dh]) rotate([90, 0, 90]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + 2 * (h + 2) + 3 * g, dy + 1 * wx + 2 * g2, dh]) rotate([90, 0, 90]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + 2 * (h + 2) + 3 * g, dy + 2 * wx + 3 * g2, dh]) rotate([90, 0, 90]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + 2 * (h + 2) + 3 * g, dy + 3 * wx + 4 * g2, dh]) rotate([90, 0, 90]) round_cube3(wx, wy, h + 2, 8);

    translate([dx + 3 * (h + 2) + 4 * g, dy + 0 * wx + 1 * g2, dh]) rotate([90, 0, 90]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + 3 * (h + 2) + 4 * g, dy + 1 * wx + 2 * g2, dh]) rotate([90, 0, 90]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + 3 * (h + 2) + 4 * g, dy + 2 * wx + 3 * g2, dh]) rotate([90, 0, 90]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + 3 * (h + 2) + 4 * g, dy + 3 * wx + 4 * g2, dh]) rotate([90, 0, 90]) round_cube3(wx, wy, h + 2, 8);

    translate([dx + g, dy + g2, wy + dh + g]) rotate([0, 0, 0]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + g, dy + wy + 2 * g2, wy + dh + g]) rotate([0, 0, 0]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + g, dy + 2 * wy + 3 * g2, wy + dh + g]) rotate([0, 0, 0]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + g, dy + 3 * wy + 4 * g2, wy + dh + g]) rotate([0, 0, 0]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + g, dy + 4 * wy + 5 * g2, wy + dh + g]) rotate([0, 0, 0]) round_cube3(wx, wy, h + 2, 8);

    translate([dx + wx + 2 * g, dy + g2, wy + dh + g]) rotate([0, 0, 0]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + wx + 2 *  + g, dy + wy + 2 * g2, wy + dh + g]) rotate([0, 0, 0]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + wx + 2 *  + g, dy + 2 * wy + 3 * g2, wy + dh + g]) rotate([0, 0, 0]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + wx + 2 *  + g, dy + 3 * wy + 4 * g2, wy + dh + g]) rotate([0, 0, 0]) round_cube3(wx, wy, h + 2, 8);
    translate([dx + wx + 2 *  + g, dy + 4 * wy + 5 * g2, wy + dh + g]) rotate([0, 0, 0]) round_cube3(wx, wy, h + 2, 8);
}

//round_box_matrix(wx, wy, h, 8, 1.2, 1, 1);
//round_box_matrix(wx, wy, h, 8, 1.2, 1, 2);
//round_box_matrix(wx, wy, h, 8, 1.2, 1, 3);
//round_box_matrix(wx, wy, h, 7.95, 1.2, 1, 4);
//#translate([1.2 + 4, 1.2, 1.2]) pi_zero_w();

//round_box_matrix(wx, wy, h, 8, 1.2, 2, 1);
//round_box_matrix(wx, wy, h, 8, 1.2, 2, 2);
//round_box_matrix(wx, wy, h, 8, 1.2, 2, 3);
//round_box_matrix(wx, wy, h, 7.95, 1.2, 2, 4);

//round_box_matrix(wx, wy, h, 8, 1.2, 3, 1);
//#translate([1.2, 1.2 + 8, 1.2]) grove3();
//round_box_matrix(wx, wy, h, 8, 1.2, 3, 2);
//#translate([1.2 + 1, 1.2 + 2, 1.2]) grove2();
//round_box_matrix(wx, wy, h, 8, 1.2, 3, 3);
//translate([1.2 + 1, 1.2 + 2, 1.2]) grove();
//round_box_matrix(wx, wy, h, 7.95, 1.2, 3, 4);

//round_box_matrix(wx, wy, h, 8, 1.2, 4, 1);
//#translate([1.2, 1.2 + 3, 1.2]) feather();
//#translate([1.2, 1.2 + 3, 1.2]) ranger();
//round_box_matrix(wx, wy, h, 8, 1.2, 4, 2);
//#translate([1.2 + 5, 1.2 + 2, 1.2]) sd_card2();
//round_box_matrix(wx, wy, h, 8, 1.2, 4, 3);
//round_box_matrix(wx, wy, h, 7.95, 1.2, 4, 4);

//round_box_grove2(wx, wy, h, 7.95, 1.2);

//round_cover(wx, wy, 8, 1.2);

//round_box_matrix(2 * wx, wy / 2, h - 8, 8, 1.2, 2, 1);
//round_box_matrix(2 * wx, wy / 2, h - 8, 8, 1.2, 1, 1);
//round_cover(2 * wx, wy / 2, 8, 1.2);

// 34.5 + 2 => 36.5
// 1.25 * 1.6 => 2
//round_box_matrix(wx, 3 * wy, 34.5, 8, 1.6, 1, 1);
//round_cover(wx, 3 * wy, 8, 1.6);

round_box_matrix(2 * wx, wy, 34.5, 8, 1.6, 1, 1);
//round_cover(2 * wx, wy, 8, 1.6);

//rotho_box_packed(wx, wy, h);
//rotho_box_packed2(wx, wy, h);
//rotho_box_packed3(wx, wy, h);
//rotho_box_packed4(wx, wy, h);
