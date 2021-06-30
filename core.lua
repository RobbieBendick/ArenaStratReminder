local frame = CreateFrame("FRAME", "ArenaStratReminder")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
frame:RegisterEvent("CHAT_MSG_BG_SYSTEM_NEUTRAL")


PlayerClass = UnitClass("Player")
PartyOneClass = UnitClass("Party1")
PartyTwoClass = UnitClass("Party2")
ArenaOneClass = UnitClass("Arena1")
ArenaTwoClass = UnitClass("Arena2")
ArenaThreeClass = UnitClass("Arena3")
local startingRoom = false
local inArenaMatch = false
local message_sent = false
local r = "Rogue"
local m = "Mage"
local p = "Priest"
local d = "Druid"
local lock = "Warlock"
local war = "Warrior"
local s = "Shaman"
local h = "Hunter"
local pala = "Paladin"



local function eventHandler(self, event, ...)

    local arenas = {
        "Ruins of Lordaeron",
        "Nagrand Arena",
        "Blade's Edge Arena"
    }
    -- track when you get into an arena
    if event == "ZONE_CHANGED_NEW_AREA" then
        for 1,#arenas do
            if GetZoneText() == arenas[i] then 
                startingRoom = true
                message_sent = false
            else inArenaMatch = false
        end
    end 
    -- track when arena gates open
    if event == "CHAT_MSG_BG_SYSTEM_NEUTRAL" then
        arg1 = strlower(arg1)
        if arg1 == "the arena battle has begun!" and startingRoom then
            --ARENA STARTED

            local arena_number_one = ArenaOneClass
            local arena_number_one = ArenaTwoClass
            local arena_number_three = ArenaThreeClass
            local enemy_arena_team = { arena_number_one, arena_number_two, arena_number_three }
            local arena_team = { PlayerClass, PartyOneClass, PartyTwoClass }
            local A_T_1 = arena_team[1]
            local A_T_2 = arena_team[2]
            local A_T_3 = arena_team[3]
            local E_T_1 = enemy_arena_team[1]
            local E_T_2 = enemy_arena_team[2]
            local E_T_3 = enemy_arena_team[3]
            local faction, _ = UnitFactionGroup("Arena1")
            local function constructFriendlyComp(friendlyClass1, friendlyClass2, friendlyClass3, asAllyVsHordeStrat, asAllyVsAllyStrat)
                if not message_sent then
                    local message = ""
                    if A_T_1 == friendlyClass1 and A_T_2 == friendlyClass2 and A_T_3 == friendlyClass3 then
                        if faction == "Horde" then
                            message = asAllyVsHordeStrat
                        else message = asAllyVsAllyStrat
                        end
                        if message ~= "" then
                            for i=1,2 do
                                print(message)
                                message_sent = true
                            end
                        end
                    end
                end
            end   
            --sort tables alphabetically
            table.sort(enemy_arena_team)
            table.sort(arena_team)

            startingRoom = false
            inArenaMatch = true

            -- VS RMP
            if E_T_1 == m and E_T_2 == p and E_T_3 == r then
                -- rlp vs rmp
                constructFriendlyComp(p, r, lock, "Since priest is horde, possible to open priest with good opener, otherwise kill rogue", "Blind rogue and go priest or blind priest and go rogue")
                -- rld vs rmp
                constructFriendlyComp(d, r, lock, "hordestrat", "allystrat")
                -- wld vs rmp
                constructFriendlyComp(d, lock, war, "hordestrat", "allystrat")
                -- hld vs rmp
                constructFriendlyComp(d, h, lock, "hordestrat", "allystrat")
                -- rmp vs rmp
                constructFriendlyComp(m, p, r, "hordestrat", "allystrat")
                -- rmd vs rmp
                constructFriendlyComp(d, m, r, "hordestrat", "allystrat")
                -- beastcleave vs rmp
                constructFriendlyComp(d, h, s, "hordestrat", "allystrat")
                -- mld vs rmp
                constructFriendlyComp(d, m, lock, "hordestrat", "allystrat")
                -- wmd vs rmp
                constructFriendlyComp(d, m, war, "hordestrat", "allystrat")
            end

            -- VS WLD
            if E_T_1 == d and E_T_2 == lock and E_T_3 == war then
                -- rlp vs wld
                constructFriendlyComp(p, r, lock, "hordestrat", "allystrat")
                -- rld vs wld
                constructFriendlyComp(d, r, lock, "hordestrat", "allystrat")
                -- wld vs wld
                constructFriendlyComp(d, lock, war, "hordestrat", "allystrat")
                -- hld vs wld
                constructFriendlyComp(d, h, lock, "hordestrat", "allystrat")
                -- rmp vs wld
                constructFriendlyComp(m, p, r, "hordestrat", "allystrat")
                -- rmd vs wld
                constructFriendlyComp(d, m, r, "hordestrat", "allystrat")
                -- beastcleave vs wld
                constructFriendlyComp(d, h, s, "hordestrat", "allystrat")
                -- mld vs wld
                constructFriendlyComp(d, m, lock, "hordestrat", "allystrat")
                -- wmd vs wld
                constructFriendlyComp(d, m, war, "hordestrat", "allystrat")
                
            end

            -- VS RLD
            if E_T_1 == d and E_T_2 == r and E_T_3 == lock then
                -- rlp vs rld
                constructFriendlyComp(p, r, lock, "hordestrat", "allystrat")
                -- rld vs rld
                constructFriendlyComp(d, r, lock, "hordestrat", "allystrat")
                -- wld vs rld
                constructFriendlyComp(d, lock, war, "hordestrat", "allystrat")
                -- hld vs rld
                constructFriendlyComp(d, h, lock, "hordestrat", "allystrat")
                -- rmp vs rld
                constructFriendlyComp(m, p, r, "hordestrat", "allystrat")
                -- rmd vs rld
                constructFriendlyComp(d, m, r, "hordestrat", "allystrat")
                -- beastcleave vs rld
                constructFriendlyComp(d, h, s, "hordestrat", "allystrat")
                -- mld vs rld
                constructFriendlyComp(d, m, lock, "hordestrat", "allystrat")
                -- wmd vs rld
                constructFriendlyComp(d, m, war, "hordestrat", "allystrat")
            end

            -- VS RLP
            if E_T_1 == p and E_T_2 == r and E_T_3 == lock then
                -- rlp vs rlp
                constructFriendlyComp(p, r, lock, "hordestrat", "allystrat")
                -- rld vs rlp
                constructFriendlyComp(d, r, lock, "hordestrat", "allystrat")
                -- wld vs rlp
                constructFriendlyComp(d, lock, war, "hordestrat", "allystrat")
                -- hld vs rlp
                constructFriendlyComp(d, h, lock, "hordestrat", "allystrat")
                -- rmp vs rlp
                constructFriendlyComp(m, p, r, "hordestrat", "allystrat")
                -- rmd vs rlp
                constructFriendlyComp(d, m, r, "hordestrat", "allystrat")
                -- beastcleave vs rlp
                constructFriendlyComp(d, h, s, "hordestrat", "allystrat")
                -- mld vs rlp
                constructFriendlyComp(d, m, lock, "hordestrat", "allystrat")
                -- wmd vs rlp
                constructFriendlyComp(d, m, war, "hordestrat", "allystrat")
            end

            -- VS maybe/probably double healer? (druid + priest/pala + hunt/war)
            if ( E_T_1 == d and E_T_2 == (p or pala) and E_T_3 == (h or war) ) then
                -- rlp vs dbl healer
                constructFriendlyComp(p, r, lock, "hordestrat", "allystrat")
                -- rld vs dbl healer
                constructFriendlyComp(d, r, lock, "hordestrat", "allystrat")
                -- wld vs dbl healer
                constructFriendlyComp(d, lock, war, "hordestrat", "allystrat")
                -- hld vs dbl healer
                constructFriendlyComp(d, h, lock, "hordestrat", "allystrat")
                -- rmp vs dbl healer
                constructFriendlyComp(m, p, r, "hordestrat", "allystrat")
                -- rmd vs dbl healer
                constructFriendlyComp(d, m, r, "hordestrat", "allystrat")
                -- beastcleave vs dbl healer
                constructFriendlyComp(d, h, s, "hordestrat", "allystrat")
                -- mld vs dbl healer
                constructFriendlyComp(d, m, lock, "hordestrat", "allystrat")
                -- wmd vs dbl healer
                constructFriendlyComp(d, m, war, "hordestrat", "allystrat")
            end

            -- VS WMD
            if E_T_1 == d and E_T_2 == m and E_T_3 == war then
                -- rlp vs wmd
                constructFriendlyComp(p, r, lock, "hordestrat", "allystrat")
                -- rld vs wmd
                constructFriendlyComp(d, r, lock, "hordestrat", "allystrat")
                -- wld vs wmd
                constructFriendlyComp(d, lock, war, "hordestrat", "allystrat")
                -- hld vs wmd
                constructFriendlyComp(d, h, lock, "hordestrat", "allystrat")
                -- rmp vs wmd
                constructFriendlyComp(m, p, r, "hordestrat", "allystrat")
                -- rmd vs wmd
                constructFriendlyComp(d, m, r, "hordestrat", "allystrat")
                -- beastcleave vs wmd
                constructFriendlyComp(d, h, s, "hordestrat", "allystrat")
                -- mld vs wmd
                constructFriendlyComp(d, m, lock, "hordestrat", "allystrat")
                -- wmd vs wmd
                constructFriendlyComp(d, m, war, "hordestrat", "allystrat")
            end
        end
    end
end
frame:SetScript("OnEvent", eventHandler)