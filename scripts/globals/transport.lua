------------------------------------
--
-- Contains global functions and variables
-- related to area specific things
--
------------------------------------
require('scripts/globals/settings')
require('scripts/globals/zone')
------------------------------------

tpz = tpz or {}

tpz.dockzones =
{
    -- Jeuno Airships
    [tpz.zone.PORT_JEUNO] = {
        docks = {
            [1] = {
                settings = {
                    name = "Jeuno to Bastok Airship Dock",
                    doorid = 17784933,
                    vesselid = 17784936,
                    vessel_pos = {
                        x = 0,
                        y = 10.450,
                        z = 0,
                        rot = 192
                    },
                    dock_pos = {
                        x   = -70.000,
                        y   =  10.450,
                        z   = -117.000,
                        rot = 192
                    },
                    dropoff_pos = {
                        x   = -50,
                        y   = 12.001,
                        z   = -116.557,
                        rot = 0
                    },
                    arrive_anim = 20,
                    arrive_anim_time = 28,
                    takeoff_anim = 21,
                    takeoff_anim_time = 38,
                    boundary = 475,
                    anim_path = 6,
                    depart_despawn = false
                },
                schedules = {
                    [1] = {
                        origin_vessel = tpz.zone.BASTOK_JEUNO_AIRSHIP,
                        vessel_zone = tpz.zone.BASTOK_JEUNO_AIRSHIP,
                        destination = tpz.zone.PORT_BASTOK,
                        dest_dock = 1,
                        times = {
                            [1] = {
                                arrive_hour = 3,
                                arrive_minute = 11,
                                depart_hour = 4,
                                depart_minute = 14
                            },
                            [2] = {
                                arrive_hour = 9,
                                arrive_minute = 11,
                                depart_hour = 10,
                                depart_minute = 14
                            },
                            [3] = {
                                arrive_hour = 15,
                                arrive_minute = 11,
                                depart_hour = 16,
                                depart_minute = 14
                            },
                            [4] = {
                                arrive_hour = 21,
                                arrive_minute = 11,
                                depart_hour = 22,
                                depart_minute = 14
                            }
                        },
                        direction = 0,
                        animation = 0,
                        duration = 320, -- 260
                        origin_pirates = 0,
                        pirate_zone = 0,
                        pirate_chance = 0
                    }
                }
            },
            [2] = {
                settings = {
                    name = "Jeuno to Sandy Airship Dock",
                    doorid = 17784932,
                    vesselid = 17784936,
                    vessel_pos = {
                        x   = 0,
                        y   = 10.450,
                        z   = 0,
                        rot = 64
                    },
                    dock_pos = {
                        x   = -68.000,
                        y   =  10.450,
                        z   = 117.000,
                        rot = 64
                    },
                    dropoff_pos = {
                        x   = -87.742,
                        y   = 12.001,
                        z   = 116.953,
                        rot = 127
                    },
                    arrive_anim = 18,
                    arrive_anim_time = 28,
                    takeoff_anim = 19,
                    takeoff_anim_time = 28,
                    boundary = 474,
                    anim_path = 6,
                    depart_despawn = false
                },
                schedules = {
                    [1] = {
                        origin_vessel = tpz.zone.SAN_DORIA_JEUNO_AIRSHIP,
                        vessel_zone = tpz.zone.SAN_DORIA_JEUNO_AIRSHIP,
                        destination = tpz.zone.PORT_SAN_DORIA,
                        dest_dock = 1,
                        times = {
                            [1] = {
                                arrive_hour = 6,
                                arrive_minute = 11,
                                depart_hour = 7,
                                depart_minute = 13
                            },
                            [2] = {
                                arrive_hour = 12,
                                arrive_minute = 11,
                                depart_hour = 13,
                                depart_minute = 13
                            },
                            [3] = {
                                arrive_hour = 18,
                                arrive_minute = 11,
                                depart_hour = 19,
                                depart_minute = 13
                            },
                            [4] = {
                                arrive_hour = 0,
                                arrive_minute = 11,
                                depart_hour = 01,
                                depart_minute = 13
                            }
                        },
                        direction = 4,
                        animation = 0,
                        duration = 320, -- 255
                        origin_pirates = 0,
                        pirate_zone = 0,
                        pirate_chance = 0
                    }
                }
            },
            [3] = {
                settings = {
                    name = "Jeuno to Windy Airship Dock",
                    doorid = 17784934,
                    vesselid = 17784936,
                    vessel_pos = {
                        x = 0,
                        y =  10.450,
                        z = 0,
                        rot = 192
                    },
                    dock_pos = {
                        x   = -6.000,
                        y   =  10.450,
                        z   = -117.000,
                        rot = 192
                    },
                    dropoff_pos = {
                        x   = 13.481,
                        y   = 12.001,
                        z   = -116.780,
                        rot = 0
                    },
                    arrive_anim = 22,
                    arrive_anim_time = 28,
                    takeoff_anim = 23,
                    takeoff_anim_time = 28,
                    boundary = 476,
                    anim_path = 6,
                    depart_despawn = false
                },
                schedules = {
                    [1] = {
                        origin_vessel = tpz.zone.WINDURST_JEUNO_AIRSHIP,
                        vessel_zone = tpz.zone.WINDURST_JEUNO_AIRSHIP,
                        destination = tpz.zone.PORT_WINDURST,
                        dest_dock = 1,
                        times = {
                            [1] = {
                                arrive_hour = 7,
                                arrive_minute = 41,
                                depart_hour = 8,
                                depart_minute = 43
                            },
                            [2] = {
                                arrive_hour = 13,
                                arrive_minute = 41,
                                depart_hour = 14,
                                depart_minute = 43
                            },
                            [3] = {
                                arrive_hour = 19,
                                arrive_minute = 41,
                                depart_hour = 20,
                                depart_minute = 43
                            },
                            [4] = {
                                arrive_hour = 1,
                                arrive_minute = 41,
                                depart_hour = 02,
                                depart_minute = 43
                            }
                        },
                        direction = 0,
                        animation = 0,
                        duration = 320, -- 271
                        origin_pirates = 0,
                        pirate_zone = 0,
                        pirate_chance = 0
                    }
                }
            },
            [4] = {
                settings = {
                    name = "Jeuno to Kazham Airship Dock",
                    doorid = 17784935,
                    vesselid = 17784936,
                    vessel_pos = {
                        x = 0,
                        y =  10.450,
                        z = 0,
                        rot = 64
                    },
                    dock_pos = {
                        x   = -4.000,
                        y   =  10.450,
                        z   = 117.000,
                        rot = 64
                    },
                    dropoff_pos = {
                        x   = -24.242,
                        y   = 12.001,
                        z   = 116.923,
                        rot = 127
                    },
                    arrive_anim = 24,
                    arrive_anim_time = 50,
                    takeoff_anim = 25,
                    takeoff_anim_time = 42,
                    boundary = 477,
                    anim_path = 6,
                    depart_despawn = false
                },
                schedules = {
                    [1] = {
                        origin_vessel = tpz.zone.KAZHAM_JEUNO_AIRSHIP,
                        vessel_zone = tpz.zone.KAZHAM_JEUNO_AIRSHIP,
                        destination = tpz.zone.KAZHAM,
                        dest_dock = 1,
                        times = {
                            [1] = {
                                arrive_hour = 4,
                                arrive_minute = 49,
                                depart_hour = 5,
                                depart_minute = 37
                            },
                            [2] = {
                                arrive_hour = 10,
                                arrive_minute = 49,
                                depart_hour = 11,
                                depart_minute = 37
                            },
                            [3] = {
                                arrive_hour = 16,
                                arrive_minute = 49,
                                depart_hour = 17,
                                depart_minute = 37
                            },
                            [4] = {
                                arrive_hour = 22,
                                arrive_minute = 49,
                                depart_hour = 23,
                                depart_minute = 37
                            }
                        },
                        direction = 0,
                        animation = 0,
                        duration = 320, -- 285
                        origin_pirates = 0,
                        pirate_zone = 0,
                        pirate_chance = 0
                    }
                }
            }


        }
    },
    -- Sandy Airship
    [tpz.zone.PORT_SAN_DORIA] = {
        docks = {
            [1] = {
                settings = {
                    name = "Sandy Airship Dock",
                    doorid = 17727595,
                    vesselid = 17727598,
                    vessel_pos = {
                        x = 0,
                        y =  -2.000,
                        z = 0,
                        rot = 64
                    },
                    dock_pos = {
                        x   = 20.000,
                        y   = -2.000,
                        z   = 44.000,
                        rot = 64
                    },
                    dropoff_pos = {
                        x   = -0.351,
                        y   = -0.439,
                        z   = 44.011,
                        rot = 128
                    },
                    arrive_anim = 18,
                    arrive_anim_time = 28,
                    takeoff_anim = 19,
                    takeoff_anim_time = 38,
                    boundary = 369,
                    anim_path = 2,
                    depart_despawn = true
                },
                schedules = {
                    [1] = {
                        origin_vessel = tpz.zone.SAN_DORIA_JEUNO_AIRSHIP,
                        vessel_zone = tpz.zone.SAN_DORIA_JEUNO_AIRSHIP,
                        destination = tpz.zone.PORT_JEUNO,
                        dest_dock = 2,
                        times = {
                            [1] = {
                                arrive_hour = 3,
                                arrive_minute = 10,
                                depart_hour = 4,
                                depart_minute = 12
                            },
                            [2] = {
                                arrive_hour = 9,
                                arrive_minute = 10,
                                depart_hour = 10,
                                depart_minute = 12
                            },
                            [3] = {
                                arrive_hour = 15,
                                arrive_minute = 10,
                                depart_hour = 16,
                                depart_minute = 12
                            },
                            [4] = {
                                arrive_hour = 21,
                                arrive_minute = 10,
                                depart_hour = 22,
                                depart_minute = 12
                            }
                        },
                        direction = 0,
                        animation = 0,
                        duration = 320, -- 258
                        origin_pirates = 0,
                        pirate_zone = 0,
                        pirate_chance = 0
                    }
                }
            }
        }
    },
    -- Bastok Airship
    [tpz.zone.PORT_BASTOK] = {
        docks = {
            [1] = {
                settings = {
                    name = "Bastok Airship Dock",
                    doorid = 17743965,
                    vesselid = 17743971,
                    vessel_pos = {
                        x = 0,
                        y =  6.365,
                        z = 0,
                        rot = 128
                    },
                    dock_pos = {
                        x   = -36.458,
                        y   =  6.365,
                        z   = -77.322,
                        rot = 128
                    },
                    dropoff_pos = {
                        x   = -35.420,
                        y   = 7.362,
                        z   = -57.374,
                        rot = 185
                    },
                    arrive_anim = 18,
                    arrive_anim_time = 33,
                    takeoff_anim = 19,
                    takeoff_anim_time = 38,
                    boundary = 315,
                    anim_path = 0,
                    depart_despawn = true
                },
                schedules = {
                    [1] = {
                        origin_vessel = tpz.zone.BASTOK_JEUNO_AIRSHIP,
                        vessel_zone = tpz.zone.BASTOK_JEUNO_AIRSHIP,
                        destination = tpz.zone.PORT_JEUNO,
                        dest_dock = 1,
                        times = {
                            [1] = {
                                arrive_hour = 0,
                                arrive_minute = 13,
                                depart_hour = 1,
                                depart_minute = 12
                            },
                            [2] = {
                                arrive_hour = 6,
                                arrive_minute = 13,
                                depart_hour = 7,
                                depart_minute = 12
                            },
                            [3] = {
                                arrive_hour = 12,
                                arrive_minute = 13,
                                depart_hour = 13,
                                depart_minute = 12
                            },
                            [4] = {
                                arrive_hour = 18,
                                arrive_minute = 13,
                                depart_hour = 19,
                                depart_minute = 12
                            }
                        },
                        direction = 4,
                        animation = 0,
                        duration = 320, -- 260
                        origin_pirates = 0,
                        pirate_zone = 0,
                        pirate_chance = 0
                    }
                }
            }
        }
    },
    -- Windurst Airship
    [tpz.zone.PORT_WINDURST] = {
        docks = {
            [1] = {
                settings = {
                    name = "Windurst Airship Dock",
                    doorid = 17760419,
                    vesselid = 17760420,
                    vessel_pos = {
                        x = 0,
                        y =  -3.522,
                        z = 0,
                        rot = 96
                    },
                    dock_pos = {
                        x   = 242.281,
                        y   =  -3.522,
                        z   =  61.994,
                        rot = 96
                    },
                    dropoff_pos = {
                        x   = 229.228,
                        y   = -2.525,
                        z   = 74.884,
                        rot = 158
                    },
                    arrive_anim = 18,
                    arrive_anim_time = 44,
                    takeoff_anim = 19,
                    takeoff_anim_time = 34,
                    boundary = 416,
                    anim_path = 1,
                    depart_despawn = true
                },
                schedules = {
                    [1] = {
                        origin_vessel = tpz.zone.WINDURST_JEUNO_AIRSHIP,
                        vessel_zone = tpz.zone.WINDURST_JEUNO_AIRSHIP,
                        destination = tpz.zone.PORT_JEUNO,
                        dest_dock = 3,
                        times = {
                            [1] = {
                                arrive_hour = 4,
                                arrive_minute = 47,
                                depart_hour = 5,
                                depart_minute = 43
                            },
                            [2] = {
                                arrive_hour = 10,
                                arrive_minute = 47,
                                depart_hour = 11,
                                depart_minute = 43
                            },
                            [3] = {
                                arrive_hour = 16,
                                arrive_minute = 47,
                                depart_hour = 17,
                                depart_minute = 43
                            },
                            [4] = {
                                arrive_hour = 22,
                                arrive_minute = 47,
                                depart_hour = 23,
                                depart_minute = 43
                            }
                        },
                        direction = 4,
                        animation = 0,
                        duration = 320, -- 253
                        origin_pirates = 0,
                        pirate_zone = 0,
                        pirate_chance = 0
                    }
                }
            }
        }
    },
    -- Kazham Airship
    [tpz.zone.KAZHAM] = {
        docks = {
            [1] = {
                settings = {
                    name = "Kazham Airship Dock",
                    doorid = 17801319,
                    vesselid = 17801320,
                    vessel_pos = {
                        x = 0,
                        y = -3.497,
                        z = 0,
                        rot = 128
                    },
                    dock_pos = {
                        x   = -4.000,
                        y   = -3.497,
                        z   = 32.125,
                        rot = 128
                    },
                    dropoff_pos = {
                        x   = -4.077,
                        y   = -2.5,
                        z   = 13.358,
                        rot = 53
                    },
                    arrive_anim = 18,
                    arrive_anim_time = 43,
                    takeoff_anim = 19,
                    takeoff_anim_time = 43,
                    boundary = 512,
                    anim_path = 5,
                    depart_despawn = true
                },
                schedules = {
                    [1] = {
                        origin_vessel = tpz.zone.KAZHAM_JEUNO_AIRSHIP,
                        vessel_zone = tpz.zone.KAZHAM_JEUNO_AIRSHIP,
                        destination = tpz.zone.PORT_JEUNO,
                        dest_dock = 4,
                        times = {
                            [1] = {
                                arrive_hour = 1,
                                arrive_minute = 48,
                                depart_hour = 2,
                                depart_minute = 42
                            },
                            [2] = {
                                arrive_hour = 7,
                                arrive_minute = 48,
                                depart_hour = 8,
                                depart_minute = 42
                            },
                            [3] = {
                                arrive_hour = 13,
                                arrive_minute = 48,
                                depart_hour = 14,
                                depart_minute = 42
                            },
                            [4] = {
                                arrive_hour = 19,
                                arrive_minute = 48,
                                depart_hour = 20,
                                depart_minute = 42
                            }
                        },
                        direction = 4,
                        animation = 0,
                        duration = 320, -- 280
                        origin_pirates = 0,
                        pirate_zone = 0,
                        pirate_chance = 0
                    }
                }
            }
        }
    },
    -- Selbina Boat
    [tpz.zone.SELBINA] = {
        docks = {
            [1] = {
                settings = {
                    name = "Selbina Dock",
                    doorid = 17793087,
                    vesselid = 17793088,
                    vessel_pos = {
                        x = -401.468,
                        y =  0.026,
                        z = -123.873,
                        rot = 0
                    },
                    dock_pos = {
                        x   = 9.294,
                        y   =  0.026,
                        z   = -69.775,
                        rot = 0
                    },
                    dropoff_pos = {
                        x   = 32.500,
                        y   = -2.500,
                        z   = -45.500,
                        rot = 192
                    },
                    arrive_anim = 18,
                    arrive_anim_time = 43,
                    takeoff_anim = 19,
                    takeoff_anim_time = 40,
                    boundary = 485,
                    anim_path = 4,
                    depart_despawn = false
                },
                schedules = {
                    [1] = {
                        origin_vessel = tpz.zone.SHIP_BOUND_FOR_SELBINA,
                        vessel_zone = tpz.zone.SHIP_BOUND_FOR_MHAURA,
                        destination = tpz.zone.MHAURA,
                        dest_dock = 1,
                        times = {
                            [1] = {
                                arrive_hour = 22,
                                arrive_minute = 40,
                                depart_hour = 0,
                                depart_minute = 0
                            },
                            [2] = {
                                arrive_hour = 6,
                                arrive_minute = 40,
                                depart_hour = 8,
                                depart_minute = 0
                            },
                            [3] = {
                                arrive_hour = 14,
                                arrive_minute = 40,
                                depart_hour = 16,
                                depart_minute = 0
                            }
                        },
                        direction = 0,
                        animation = 0,
                        duration = 960, -- 908
                        origin_pirates = tpz.zone.SHIP_BOUND_FOR_SELBINA_PIRATES,
                        pirate_zone = tpz.zone.SHIP_BOUND_FOR_MHAURA_PIRATES,
                        pirate_chance = 15
                    }
                }
            }
        }
    },
    -- Mhaura Boats
    [tpz.zone.MHAURA] = {
        docks = {
            [1] = {
                settings = {
                    name = "Mhaura Dock",
                    doorid = 17797181,
                    vesselid = 17797182,
                    vessel_pos = {
                        x   = -391.05,
                        y   =  0.026,
                        z   = -205.20,
                        rot = 0
                    },
                    dock_pos = {
                        x = -0.516,
                        y =  0.026,
                        z = -8.409,
                        rot = 0
                    },
                    dropoff_pos = {
                        x   = 14.960,
                        y   = -3.430,
                        z   = 18.423,
                        rot = 192
                    },
                    arrive_anim = 18,
                    arrive_anim_time = 43,
                    takeoff_anim = 19,
                    takeoff_anim_time = 43,
                    boundary = 493,
                    anim_path = 3,
                    depart_despawn = false
                },
                schedules = {
                    [1] = {
                        origin_vessel = tpz.zone.SHIP_BOUND_FOR_MHAURA,
                        vessel_zone = tpz.zone.SHIP_BOUND_FOR_SELBINA,
                        destination = tpz.zone.SELBINA,
                        dest_dock = 1,
                        times = {
                            [1] = {
                                arrive_hour = 22,
                                arrive_minute = 40,
                                depart_hour = 0,
                                depart_minute = 0
                            },
                            [2] = {
                                arrive_hour = 6,
                                arrive_minute = 40,
                                depart_hour = 8,
                                depart_minute = 0
                            },
                            [3] = {
                                arrive_hour = 14,
                                arrive_minute = 40,
                                depart_hour = 16,
                                depart_minute = 0,
                            }
                        },
                        direction = 0,
                        animation = 0,
                        duration = 960,
                        origin_pirates = tpz.zone.SHIP_BOUND_FOR_MHAURA_PIRATES,
                        pirate_zone = tpz.zone.SHIP_BOUND_FOR_SELBINA_PIRATES,
                        pirate_chance = 15
                    },
                    [2] = {
                        origin_vessel = tpz.zone.OPEN_SEA_ROUTE_TO_MHAURA,
                        vessel_zone = tpz.zone.OPEN_SEA_ROUTE_TO_AL_ZAHBI,
                        destination = tpz.zone.AHT_URHGAN_WHITEGATE,
                        dest_dock = 1,
                        times = {
                            [1] = {
                                arrive_hour = 2,
                                arrive_minute = 40,
                                depart_hour = 4,
                                depart_minute = 0,
                            },
                            [2] = {
                                arrive_hour = 10,
                                arrive_minute = 40,
                                depart_hour = 12,
                                depart_minute = 0
                            },
                            [3] = {
                                arrive_hour = 18,
                                arrive_minute = 40,
                                depart_hour = 20,
                                depart_minute = 0
                            }
                        },
                        arrive_hour = 2,
                        arrive_minute = 40,
                        depart_hour = 4,
                        depart_minute = 0,
                        direction = 0,
                        animation = 0,
                        duration = 960, -- 920
                        origin_pirates = 0,
                        pirate_zone = 0,
                        pirate_chance = 0
                    }
                }
            }
        }
    },
    -- Bibiki Bay Manaclipper
    [tpz.zone.BIBIKI_BAY] = {
        docks = {
            [1] = { -- Sunset Docks
                settings = {
                    name = "Bibiki Bay Dock",
                    doorid = 16793914,
                    vesselid = 16793913,
                    vessel_pos = {
                        x = 0,
                        y = 0,
                        z = 0,
                        rot = 128
                    },
                    dock_pos = {
                        x   = 491.500,
                        y   =   0.000,
                        z   = 687.400,
                        rot = 128
                    },
                    dropoff_pos = {
                        x   = 489.763,
                        y   = -3.004,
                        z   = 712.000,
                        rot = 191
                    },
                    arrive_anim = 18,
                    arrive_anim_time = 38,
                    takeoff_anim = 19,
                    takeoff_anim_time = 43,
                    boundary = {
                        name = "bibiki",
                        value = 1
                    },
                    anim_path = 17,
                    depart_despawn = false
                },
                schedules = {
                    [1] = { -- To Purgonorgo Isle
                        origin_vessel = tpz.zone.MANACLIPPER,
                        vessel_zone = tpz.zone.MANACLIPPER,
                        destination = tpz.zone.BIBIKI_BAY,
                        dest_dock = 2,
                        times = {
                            [1] = {
                                arrive_hour = 4,
                                arrive_minute = 50,
                                depart_hour = 5,
                                depart_minute = 30
                            },
                            [2] = {
                                arrive_hour = 16,
                                arrive_minute = 50,
                                depart_hour = 17,
                                depart_minute = 30
                            }
                        },
                        direction = 0,
                        animation = 16,
                        duration = 445, -- 399
                        origin_pirates = 0,
                        pirate_zone = 0,
                        pirate_chance = 0
                    },
                    [2] = { -- Maliyakaleya Reef Tour
                        origin_vessel = tpz.zone.MANACLIPPER,
                        vessel_zone = tpz.zone.MANACLIPPER,
                        destination = tpz.zone.BIBIKI_BAY,
                        dest_dock = 1,
                        times = {
                            [1] = {
                                arrive_hour = 12,
                                arrive_minute = 10,
                                depart_hour = 12,
                                depart_minute = 50
                            }
                        },
                        direction = 0,
                        animation = 8,
                        duration = 590, -- 549
                        origin_pirates = 0,
                        pirate_zone = 0,
                        pirate_chance = 0
                    },
                    [3] = { -- Dhalmel Rock Tour
                        origin_vessel = tpz.zone.MANACLIPPER,
                        vessel_zone = tpz.zone.MANACLIPPER,
                        destination = tpz.zone.BIBIKI_BAY,
                        dest_dock = 1,
                        times = {
                            [1] = {
                                arrive_hour = 0,
                                arrive_minute = 10,
                                depart_hour = 0,
                                depart_minute = 50
                            }
                        },
                        direction = 0,
                        animation = 0,
                        duration = 590,
                        origin_pirates = 0,
                        pirate_zone = 0,
                        pirate_chance = 0
                    }
                }
            },
            [2] = { -- Purgonorgo Isle
                settings = {
                    name = "Bibiki Bay Dock - Purgonorgo Isle",
                    doorid = 16793915,
                    vesselid = 16793913,
                    vessel_pos = {
                        x = 0,
                        y = 0,
                        z = 0,
                        rot = 128
                    },
                    dock_pos = {
                        x = -392.000,
                        y = 0.000,
                        z = -364.000,
                        rot = 128
                    },
                    dropoff_pos = {
                        x   = -393.358,
                        y   = -3.000,
                        z   = -387.582,
                        rot = 193
                    },
                    arrive_anim = 20,
                    arrive_anim_time = 38,
                    takeoff_anim = 21,
                    takeoff_anim_time = 43,
                    boundary = {
                        name = "bibiki",
                        value = 2
                    },
                    anim_path = 17,
                    depart_despawn = false
                },
                schedules = {
                    [1] = { -- To Sunset Docks
                        origin_vessel = tpz.zone.MANACLIPPER,
                        vessel_zone = tpz.zone.MANACLIPPER,
                        destination = tpz.zone.BIBIKI_BAY,
                        dest_dock = 1,
                        times = {
                            [1] = {
                                arrive_hour = 8,
                                arrive_minute = 40,
                                depart_hour = 9,
                                depart_minute = 15
                            },
                            [2] = {
                                arrive_hour = 20,
                                arrive_minute = 30,
                                depart_hour = 21,
                                depart_minute = 15
                            }
                        },
                        direction = 0,
                        animation = 24,
                        duration = 445, -- 379
                        origin_pirates = 0,
                        pirate_zone = 0,
                        pirate_chance = 0
                    }
                }
            }
        }
    },
    -- Carpenter's Landing Barge
    [tpz.zone.CARPENTERS_LANDING] = {
        docks = {
            [1] = { -- North Landing
                settings = {
                    name = "North Landing Dock",
                    doorid = 16785757,
                    vesselid = 16785747,
                    vessel_pos = {
                        x = 0,
                        y = 100,
                        z = 0,
                        rot = 0
                    },
                    dock_pos = {
                        x   = -291.355,
                        y   =   0.000,
                        z   = 516.868,
                        rot = 32
                    },
                    dropoff_pos = {
                        x   = -308.259,
                        y   = -2,
                        z   = 500,
                        rot = 64
                    },
                    arrive_anim = 24,
                    arrive_anim_time = 45,
                    takeoff_anim = 25,
                    takeoff_anim_time = 31,
                    boundary = {
                        name = "barge",
                        value = 1
                    },
                    anim_path = 16,
                    depart_despawn = false
                },
                schedules = {
                    [1] = { -- To Central Landing
                        origin_vessel = tpz.zone.PHANAUET_CHANNEL,
                        vessel_zone = tpz.zone.PHANAUET_CHANNEL,
                        destination = tpz.zone.CARPENTERS_LANDING,
                        dest_dock = 2,
                        times = {
                            [1] = {
                                arrive_hour = 16,
                                arrive_minute = 00,
                                depart_hour = 17,
                                depart_minute = 25
                            }
                        },
                        direction = 0,
                        animation = 24,
                        duration = 270,
                        origin_pirates = 0,
                        pirate_zone = 0,
                        pirate_chance = 0
                    }
                }
            },
            [2] = { -- Central Landing
                settings = {
                    name = "Central Landing Dock",
                    doorid = 16785756,
                    vesselid = 16785747,
                    vessel_pos = {
                        x = 0,
                        y = 100,
                        z = 0,
                        rot = 0
                    },
                    dock_pos = {
                        x   = -125.04,
                        y   =   0.000,
                        z   =  72.79,
                        rot = 160
                    },
                    dropoff_pos = {
                        x   = -141.618,
                        y   = -2,
                        z   = 56.131,
                        rot = 64
                    },
                    arrive_anim = 20,
                    arrive_anim_time = 34,
                    takeoff_anim = 21,
                    takeoff_anim_time = 35,
                    boundary = {
                        name = "barge",
                        value = 2
                    },
                    anim_path = 16,
                    depart_despawn = false
                },
                schedules = {
                    [1] = { -- To South Landing
                        origin_vessel = tpz.zone.PHANAUET_CHANNEL,
                        vessel_zone = tpz.zone.PHANAUET_CHANNEL,
                        destination = tpz.zone.CARPENTERS_LANDING,
                        dest_dock = 3,
                        times = {
                            [1] = {
                                arrive_hour = 4,
                                arrive_minute = 35,
                                depart_hour = 5,
                                depart_minute = 10
                            },
                            [2] = {
                                arrive_hour = 19,
                                arrive_minute = 15,
                                depart_hour = 19,
                                depart_minute = 50
                            }
                        },
                        direction = 4,
                        animation = 0,
                        duration = 540
                    }
                }
            },
            [3] = { -- South Landing
                settings = {
                    name = "South Landing Dock",
                    doorid = 16785755,
                    vesselid = 16785747,
                    vessel_pos = {
                        x = 0,
                        y = 100,
                        z = 0,
                        rot = 0
                    },
                    dock_pos = {
                        x   = 246.38,
                        y   =   0.000,
                        z   = -529.79,
                        rot = 192
                    },
                    dropoff_pos = {
                        x   = 222.959,
                        y   = -2,
                        z   = -530,
                        rot = 128
                    },
                    arrive_anim = 18,
                    arrive_anim_time = 35,
                    takeoff_anim = 19,
                    takeoff_anim_time = 35,
                    boundary = {
                        name = "barge",
                        value = 3
                    },
                    anim_path = 16,
                    depart_despawn = false
                },
                schedules = {
                    [1] = { -- To Central Landing
                        origin_vessel = tpz.zone.PHANAUET_CHANNEL,
                        vessel_zone = tpz.zone.PHANAUET_CHANNEL,
                        destination = tpz.zone.CARPENTERS_LANDING,
                        dest_dock = 2,
                        times = {
                            [1] = {
                                arrive_hour = 23,
                                arrive_minute = 35,
                                depart_hour = 0,
                                depart_minute = 50
                            }
                        },
                        direction = 0,
                        animation = 8,
                        duration = 540
                    },
                    [2] = { -- To North landing
                        origin_vessel = tpz.zone.PHANAUET_CHANNEL,
                        vessel_zone = tpz.zone.PHANAUET_CHANNEL,
                        destination = tpz.zone.CARPENTERS_LANDING,
                        dest_dock = 1,
                        times = {
                            [1] = {
                                arrive_hour = 8,
                                arrive_minute = 55,
                                depart_hour = 10,
                                depart_minute = 10
                            }
                        },
                        direction = 0,
                        animation = 16,
                        duration = 840
                    }
                }
            }
        }
    },
    -- Whitegate Boats
    [tpz.zone.AHT_URHGAN_WHITEGATE] = {
        docks = {
            [1] = { -- Whitegate to Mhaura dock
                settings = {
                    name = "Whitegate to Mhaura Dock",
                    doorid = 16982044,
                    vesselid = 16982046,
                    vessel_pos = {
                        x = 0,
                        y = 3.389,
                        z = 0,
                        rot = 0
                    },
                    dock_pos = {
                        x   = -20.726,
                        y   =  3.389,
                        z   = -154.231,
                        rot = 0
                    },
                    dropoff_pos = {
                        x   = -11,
                        y   = 2,
                        z   = -142,
                        rot = 192
                    },
                    arrive_anim = 18,
                    arrive_anim_time = 43,
                    takeoff_anim = 19,
                    takeoff_anim_time = 38,
                    boundary = 569,
                    anim_path = 20,
                    depart_despawn = false
                },
                schedules = {
                    [1] = {
                        origin_vessel = tpz.zone.OPEN_SEA_ROUTE_TO_AL_ZAHBI,
                        vessel_zone = tpz.zone.OPEN_SEA_ROUTE_TO_MHAURA,
                        destination = tpz.zone.MHAURA,
                        dest_dock = 1,
                        times = {
                            [1] = {
                                arrive_hour = 2,
                                arrive_minute = 40,
                                depart_hour = 4,
                                depart_minute = 0,
                            },
                            [2] = {
                                arrive_hour = 10,
                                arrive_minute = 40,
                                depart_hour = 12,
                                depart_minute = 0
                            },
                            [3] = {
                                arrive_hour = 18,
                                arrive_minute = 40,
                                depart_hour = 20,
                                depart_minute = 0
                            }
                        },
                        direction = 4,
                        animation = 0,
                        duration = 960, -- 920
                        origin_pirates = 0,
                        pirate_zone = 0,
                        pirate_chance = 0
                    }
                }
            },
            [2] = { -- Whitegate to Nashmau Dock
                settings = {
                    name = "Whitegate to Nashmau Dock",
                    doorid = 16982045,
                    vesselid = 16982046,
                    vessel_pos = {
                        x = 0,
                        y = 3.389,
                        z = 0,
                        rot = 0
                    },
                    dock_pos = {
                        x   = 20.726,
                        y   =  3.389,
                        z   = 154.231,
                        rot = 128
                    },
                    dropoff_pos = {
                        x   = 11,
                        y   = 2,
                        z   = 142,
                        rot = 64
                    },
                    arrive_anim = 20,
                    arrive_anim_time = 43,
                    takeoff_anim = 21,
                    takeoff_anim_time = 40,
                    boundary = 570,
                    anim_path = 20,
                    depart_despawn = false
                },
                schedules = {
                    [1] = {
                        origin_vessel = tpz.zone.SILVER_SEA_ROUTE_TO_AL_ZAHBI,
                        vessel_zone = tpz.zone.SILVER_SEA_ROUTE_TO_NASHMAU,
                        destination = tpz.zone.NASHMAU,
                        dest_dock = 1,
                        times = {
                            [1] = {
                                arrive_hour = 5,
                                arrive_minute = 0,
                                depart_hour = 8,
                                depart_minute = 0
                            },
                            [2] = {
                                arrive_hour = 13,
                                arrive_minute = 0,
                                depart_hour = 16,
                                depart_minute = 0
                            },
                            [3] = {
                                arrive_hour = 21,
                                arrive_minute = 0,
                                depart_hour = 0,
                                depart_minute = 0
                            }
                        },
                        direction = 0,
                        animation = 0,
                        duration = 720, -- 680
                        origin_pirates = 0,
                        pirate_zone = 0,
                        pirate_chance = 0
                    }
                }
            }
        }
    },
    -- Nashmau Boat
    [tpz.zone.NASHMAU] = {
        docks = {
            [1] = { -- Nashmau to Whitegate dock
                settings = {
                    name = "Nashmau to Whitegate Dock",
                    doorid = 16994326,
                    vesselid = 16994327,
                    vessel_pos = {
                        x = 0,
                        y = 3.389,
                        z = 0,
                        rot = 0
                    },
                    dock_pos = {
                        x   = 3.273,
                        y   =  3.389,
                        z   = -114.213,
                        rot = 0
                    },
                    dropoff_pos = {
                        x   = 17,
                        y   = 0,
                        z   = -80,
                        rot = 194
                    },
                    arrive_anim = 22,
                    arrive_anim_time = 43,
                    takeoff_anim = 23,
                    takeoff_anim_time = 43,
                    boundary = 571,
                    anim_path = 20,
                    depart_despawn = false
                },
                schedules = {
                    [1] = {
                        origin_vessel = tpz.zone.SILVER_SEA_ROUTE_TO_NASHMAU,
                        vessel_zone = tpz.zone.SILVER_SEA_ROUTE_TO_AL_ZAHBI,
                        destination = tpz.zone.AHT_URHGAN_WHITEGATE,
                        dest_dock = 2,
                        times = {
                            [1] = {
                                arrive_hour = 5,
                                arrive_minute = 0,
                                depart_hour = 8,
                                depart_minute = 0
                            },
                            [2] = {
                                arrive_hour = 13,
                                arrive_minute = 0,
                                depart_hour = 16,
                                depart_minute = 0
                            },
                            [3] = {
                                arrive_hour = 21,
                                arrive_minute = 0,
                                depart_hour = 0,
                                depart_minute = 0
                            }
                        },
                        direction = 0,
                        animation = 0,
                        duration = 720, -- 680
                        origin_pirates = 0,
                        pirate_zone = 0,
                        pirate_chance = 0
                    }
                }
            }
        }
    }
}

tpz.dockstatus =
{
    EMPTY     = 0,
    SPAWNING  = 1,
    ARRIVING  = 2,
    BOARDING  = 3,
    GATELOCK  = 4,
    RESETING  = 5,
    DEPARTING = 6
}

tpz.vesselstatus =
{
    HALTED    = 0,
    ARRIVING  = 1,
    BOARDING  = 2,
    DEPARTING = 3,
    INTRANSIT = 4
}

tpz.elevatorstatus =
{
    HALTED      = 0,
    DOWN        = 1,
    MOVING_DOWN = 2,
    UP          = 3,
    MOVING_UP   = 4
}

tpz.piratestatus =
{
    IDLE       = 0,
    PREPARING  = 1,
    ARRIVING   = 2,
    SPAWNING   = 3,
    ATTACKING  = 4,
    DESPAWNING = 5,
    DEPARTING  = 6,
    FINISHED   = 7
}

function SetupDocks(zoneId,dockZone)
    for i,dock in pairs(dockZone.docks) do
        AddDock(zoneId,i,dock.settings)
        for j,schedule in pairs(dock.schedules) do
            AddDockSchedule(zoneId,i,schedule,j)
        end
    end
end

function SetupVessel(zone)
    AddVessel(zone:getID())
end

function InitializeDockZone(zone)
    if tpz.dockzones[zone:getID()] ~= nil then
        AddDockZone(zone:getID())
        SetupDocks(zone:getID(),tpz.dockzones[zone:getID()])
    end
end
