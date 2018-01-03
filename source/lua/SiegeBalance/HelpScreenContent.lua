
local helpScreenImages = 
{
    rifle               = PrecacheAsset("ui/helpScreen/icons/rifle.dds"),
    rifleButt           = PrecacheAsset("ui/helpScreen/icons/rifle_butt.dds"),
    pistol              = PrecacheAsset("ui/helpScreen/icons/pistol.dds"),
    axe                 = PrecacheAsset("ui/helpScreen/icons/axe.dds"),
    welder              = PrecacheAsset("ui/helpScreen/icons/welder.dds"),
    shotgun             = PrecacheAsset("ui/helpScreen/icons/shotgun.dds"),
    mines               = PrecacheAsset("ui/helpScreen/icons/mine.dds"),
    flamethrower        = PrecacheAsset("ui/helpScreen/icons/flamethrower.dds"),
    grenadeLauncher     = PrecacheAsset("ui/helpScreen/icons/grenade_launcher.dds"),
    machineGun          = PrecacheAsset("ui/helpScreen/icons/machine_gun.dds"),
    clusterGrenade      = PrecacheAsset("ui/helpScreen/icons/grenade_cluster.dds"),
    pulseGrenade        = PrecacheAsset("ui/helpScreen/icons/grenade_pulse.dds"),
    gasGrenade          = PrecacheAsset("ui/helpScreen/icons/grenade_gas.dds"),
    minigun             = PrecacheAsset("ui/helpScreen/icons/mini_gun.dds"),
    railgun             = PrecacheAsset("ui/helpScreen/icons/rail_gun.dds"),
    exoThrusters        = PrecacheAsset("ui/helpScreen/icons/thrusters.dds"),
    exoEject            = PrecacheAsset("ui/helpScreen/icons/exo_eject.dds"),
    eggStomp            = PrecacheAsset("ui/helpScreen/icons/egg_stomp.dds"),
    jetpack             = PrecacheAsset("ui/helpScreen/icons/jetpack.dds"),
    bite                = PrecacheAsset("ui/helpScreen/icons/bite.dds"),
    parasite            = PrecacheAsset("ui/helpScreen/icons/parasite.dds"),
    leap                = PrecacheAsset("ui/helpScreen/icons/leap.dds"),
    xenocide            = PrecacheAsset("ui/helpScreen/icons/xenocide.dds"),
    healSpray           = PrecacheAsset("ui/helpScreen/icons/heal_spray.dds"),
    spit                = PrecacheAsset("ui/helpScreen/icons/spit.dds"),
    gorgeStructures     = PrecacheAsset("ui/helpScreen/icons/gorge_structures.dds"),
    bileBomb            = PrecacheAsset("ui/helpScreen/icons/bile_bomb.dds"),
    baitBall            = PrecacheAsset("ui/helpScreen/icons/bait_ball.dds"),
    lerkBite            = PrecacheAsset("ui/helpScreen/icons/lerk_bite.dds"),
    spikes              = PrecacheAsset("ui/helpScreen/icons/spikes.dds"),
    umbra               = PrecacheAsset("ui/helpScreen/icons/umbra.dds"),
    spores              = PrecacheAsset("ui/helpScreen/icons/spores.dds"),
    swipe               = PrecacheAsset("ui/helpScreen/icons/swipe.dds"),
    blink               = PrecacheAsset("ui/helpScreen/icons/blink.dds"),
    advancedMetabolize  = PrecacheAsset("ui/helpScreen/icons/advanced_metabolize.dds"),
    metabolize          = PrecacheAsset("ui/helpScreen/icons/metabolize.dds"),
    stab                = PrecacheAsset("ui/helpScreen/icons/stab.dds"),
    gore                = PrecacheAsset("ui/helpScreen/icons/gore.dds"),
    charge              = PrecacheAsset("ui/helpScreen/icons/charge.dds"),
    boneShield          = PrecacheAsset("ui/helpScreen/icons/bone_shield.dds"),
    stomp               = PrecacheAsset("ui/helpScreen/icons/stomp.dds"),
    welcome             = PrecacheAsset("materials/editor/unknown_billboard.dds"),
}
function HelpScreen_InitializeContent()
    -- Siege Intro
     HelpScreen_AddContent({
        name = "Siege_Intro",
        title = "Welcome to\n    Siege++!",
        description = "Aliens have until the siege doors open to defeat the Marines. Once the doors open, the hives become ARC-able!",
        imagePath = helpScreenImages.welcome,
        actions = {},
        classNames = {"Player"},
        theme = "marine",
        useLocale = false,
        })
    -- Alien Buffs
     HelpScreen_AddContent({
        name = "Alien_Buff4",
        title = "Aliens Buffed",
        description = "All alien HP increased by 25% (except fade who gets +15%). Aliens evolve faster, and don't need to be misted. Crags heal faster the longer it's been since you took damage, but don't work off of infestation.",
        imagePath = helpScreenImages.leap,
        actions = {},
        classNames = {"Player"},
        theme = "alien",
        useLocale = false,
        })
    -- Onos Buffs
     HelpScreen_AddContent({
        name = "Onos_Buff2",
        title = "Onos",
        description = "Boneshield is unlimited and blocks a larger 'cone' around your head.",
        imagePath = helpScreenImages.charge,
        actions = {},
        classNames = {"Player"},
        theme = "alien",
        useLocale = false,
        })
        -- Fade Acid Rocket
     HelpScreen_AddContent({
        name = "Acid_Rocket",
        title = "Acid Rocket",
        description = "Fuck stab. We've replaced it with acid rockets. This however makes Fade's health regen from metabolize about half as effective.",
        imagePath = helpScreenImages.stab,
        actions = {},
        classNames = {"Player"},
        theme = "alien",
        useLocale = false,
        })
        
    -- Spider Gorge
    HelpScreen_AddContent({
        name = "Gorge_Changed",
        title = "Spider Gorge.",
        description = "Gorges can now walk on walls. The new webby feet take longer to build tunnels though :(",
        imagePath = helpScreenImages.spit,
        actions = {},
        classNames = {"Player"},
        theme = "alien",
        useLocale = true,
        })
    -- Jetpack
    HelpScreen_AddContent({
        name = "Jetpack_Fuel",
        title = "Jetpack fuel",
        description = "Jetpacks now have 25% additional fuel and the weight of your items affects your acceleration and manuveability instead of fuel use.",
        imagePath = helpScreenImages.jetpack,
        actions = {},
        classNames = {"Player"},
        theme = "marine",
        useLocale = true,
        })
        
    -- Armories
    HelpScreen_AddContent({
        name = "Marine_Structures",
        title = "Marine Buildings",
        description = "Armories now regenerate armor. Phase gates now have red and blue 'channels'. Sentries take no supply. Marine commanders can drop un-researched weapons. GL and FT require research. ",
        imagePath = helpScreenImages.welder,
        actions = {},
        classNames = {"Player"},
        theme = "marine",
        useLocale = true,
        })
end
