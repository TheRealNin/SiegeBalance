
local kBlipInfo = debug.getupvaluex(GUIMinimap.Initialize, "kBlipInfo")
local kBlipColorType = debug.getupvaluex(GUIMinimap.Initialize, "kBlipColorType")
local kBlipSizeType = debug.getupvaluex(GUIMinimap.Initialize, "kBlipSizeType")

kBlipInfo[kMinimapBlipType.Contamination] = { kBlipColorType.Team, kBlipSizeType.Normal, 2 }

debug.setupvaluex( GUIMinimap.Initialize, "kBlipInfo", kBlipInfo, true)
