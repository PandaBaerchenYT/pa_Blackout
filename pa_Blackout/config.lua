Config = {}

Config.Debug = true -- Change Debug (For Developers)

Config.PowerBlip = false -- Change Blips of the Powerbox Blip (false = off / true = on)

Config.Marker = { -- Table off all Marker Items
    Type = 20, -- Marker Type (https://docs.fivem.net/docs/game-references/markers/)
    Pos = vector3(651.78, 101.19, 80.73), -- Position of Marker to Hack
    Scale = vector3(0.8, 0.8, 0.8), -- Scale of the Marker (default = 255, 255, 255 (White))
    RGB = {r= 255, g= 255, b= 255}, -- Color of the Marker 0- 255
    Alpha = 255, -- Transparency of the Marker 0 - 255
    Bobbing = false, -- Bobbing On/Off
    FaceCamera = false -- Face to Camera On/Off
}

Config.Input = 38 -- Fivem Key Input (https://docs.fivem.net/docs/game-references/controls/)
Config.Time = 1 -- TIme in MInutes