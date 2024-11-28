# Boxology
In the tradition of [SGMK Boxology](https://wiki.sgmk-ssam.ch/index.php/Boxology).

- Box_146x30x27 — a parametric box for short USB cables, jumper wires, pens, etc.
- Box_73x60x35 — a parametric box for electronics like Feather, Grove, Pi Zero, QT Py, Xiao, etc.
- Box_73x180x34.5 — a parametric box for bigger tools, the size of 3 * Box_73x60x35, with thicker walls.

## Preview
<img src="https://live.staticflickr.com/65535/54169023418_5afeb15fe2.jpg"/><br/>
One of many [photos](https://flickr.com/photos/tamberg/albums/72177720322230844/with/54153425718).

## How to
```console
$ cd boxology
$ cat Box.scad # parametric, as needed
$ ls OpenScad/*/*/*.stl # 3D model, mm
$ ls OpenScad/*/*/*.3mf # Prusa slicer
$ ls OpenScad/*/*/*.gcode # Prusa mini
$ tree
.
├── OpenScad
│   ├── Box.scad
│   ├── Box_146x30x27
│   │   ├── 1x1
│   │   │   ├── Box_146x30x27_1x1.3mf
│   │   │   ├── Box_146x30x27_1x1.stl
│   │   │   └── Box_146x30x27_1x1_0.4n_0.2mm_PLA_MINI_1h21m.gcode
│   │   └── 2x1
│   │       ├── Box_146x30x27_2x1.3mf
│   │       ├── Box_146x30x27_2x1.stl
│   │       └── Box_146x30x27_2x1_0.4n_0.2mm_PLA_MINI_1h30m.gcode
│   ├── Box_73x180x34.5
│   │   └── 1x1
│   │       ├── Box_73x180x34.5_1x1.3mf
│   │       ├── Box_73x180x34.5_1x1.stl
│   │       └── Box_73x180x34.5_1x1_0.4n_0.2mm_PLA_MINI_3h33m.gcode
│   ├── Box_73x60x35
│   │   ├── 1x1
│   │   │   ├── Box_73x60x35_1x1.3mf
│   │   │   ├── Box_73x60x35_1x1.stl
│   │   │   └── Box_73x60x35_1x1_0.4n_0.2mm_PLA_MINI_1h18m.gcode
│   │   ├── 1x2
│   │   │   ├── Box_73x60x35_1x2.3mf
│   │   │   ├── Box_73x60x35_1x2.stl
│   │   │   └── Box_73x60x35_1x2_0.4n_0.2mm_PLA_MINI_1h41m.gcode
│   │   ├── 1x3
│   │   │   ├── Box_73x60x35_1x3.3mf
│   │   │   ├── Box_73x60x35_1x3.stl
│   │   │   └── Box_73x60x35_1x3_0.4n_0.2mm_PLA_MINI_2h5m.gcode
│   │   ├── 1x4
│   │   │   ├── Box_73x60x35_1x4.3mf
│   │   │   ├── Box_73x60x35_1x4.stl
│   │   │   └── Box_73x60x35_1x4_0.4n_0.2mm_PLA_MINI_2h27m.gcode
│   │   ├── 2x1
│   │   │   ├── Box_73x60x35_2x1.3mf
│   │   │   ├── Box_73x60x35_2x1.stl
│   │   │   └── Box_73x60x35_2x1_0.4n_0.2mm_PLA_MINI_1h39m.gcode
│   │   ├── 2x2
│   │   │   ├── Box_73x60x35_2x2.3mf
│   │   │   ├── Box_73x60x35_2x2.stl
│   │   │   └── Box_73x60x35_2x2_0.4n_0.2mm_PLA_MINI_2h5m.gcode
│   │   ├── 2x3
│   │   │   ├── Box_73x60x35_2x3.3mf
│   │   │   ├── Box_73x60x35_2x3.stl
│   │   │   └── Box_73x60x35_2x3_0.4n_0.2mm_PLA_MINI_2h31m.gcode
│   │   ├── 2x4
│   │   │   ├── Box_73x60x35_2x4.3mf
│   │   │   ├── Box_73x60x35_2x4.stl
│   │   │   └── Box_73x60x35_2x4_0.4n_0.2mm_PLA_MINI_2h58m.gcode
│   │   ├── 3x1
│   │   │   ├── Box_73x60x35_3x1.3mf
│   │   │   ├── Box_73x60x35_3x1.stl
│   │   │   └── Box_73x60x35_3x1_0.4n_0.2mm_PLA_MINI_2h0m.gcode
│   │   ├── 3x2
│   │   │   ├── Box_73x60x35_3x2.3mf
│   │   │   ├── Box_73x60x35_3x2.stl
│   │   │   └── Box_73x60x35_3x2_0.4n_0.2mm_PLA_MINI_2h29m.gcode
│   │   ├── 3x3
│   │   │   ├── Box_73x60x35_3x3.3mf
│   │   │   ├── Box_73x60x35_3x3.stl
│   │   │   └── Box_73x60x35_3x3_0.4n_0.2mm_PLA_MINI_2h59m.gcode
│   │   ├── 3x4
│   │   │   ├── Box_73x60x35_3x4.3mf
│   │   │   ├── Box_73x60x35_3x4.stl
│   │   │   └── Box_73x60x35_3x4_0.4n_0.2mm_PLA_MINI_3h27m.gcode
│   │   ├── 4x1
│   │   │   ├── Box_73x60x35_4x1.3mf
│   │   │   ├── Box_73x60x35_4x1.stl
│   │   │   └── Box_73x60x35_4x1_0.4n_0.2mm_PLA_MINI_2h18m.gcode
│   │   ├── 4x2
│   │   │   ├── Box_73x60x35_4x2.3mf
│   │   │   ├── Box_73x60x35_4x2.stl
│   │   │   └── Box_73x60x35_4x2_0.4n_0.2mm_PLA_MINI_2h52m.gcode
│   │   ├── 4x3
│   │   │   ├── Box_73x60x35_4x3.3mf
│   │   │   ├── Box_73x60x35_4x3.stl
│   │   │   └── Box_73x60x35_4x3_0.4n_0.2mm_PLA_MINI_3h26m.gcode
│   │   ├── 4x4
│   │   │   ├── Box_73x60x35_4x4.3mf
│   │   │   ├── Box_73x60x35_4x4.stl
│   │   │   └── Box_73x60x35_4x4_0.4n_0.2mm_PLA_MINI_4h2m.gcode
│   │   └── Grove2
│   │       ├── Box_73x60x35_Grove2.3mf
│   │       ├── Box_73x60x35_Grove2.stl
│   │       └── Box_73x60x35_Grove2_0.4n_0.2mm_PLA_MINI_1h58m.gcode
│   ├── Cover_146x30
│   │   └── 1x1
│   │       ├── Cover_146x30x1.5_1x1.3mf
│   │       ├── Cover_146x30x1.5_1x1.stl
│   │       └── Cover_146x30x1.5_1x1_0.4n_0.2mm_PLA_MINI_37m.gcode
│   ├── Cover_73x180
│   │   └── 1x1
│   │       ├── Cover_73x180x2_1x1.3mf
│   │       ├── Cover_73x180x2_1x1.stl
│   │       └── Cover_73x180x2_1x1_0.4n_0.2mm_PLA_MINI_1h57m.gcode
│   └── Cover_73x60
│       └── 1x1
│           ├── Cover_73x60x1.5_1x1.3mf
│           ├── Cover_73x60x1.5_1x1.stl
│           └── Cover_73x60x1.5_1x1_0.4n_0.2mm_PLA_MINI_34m.gcode
└── README.md
```
