#!/usr/bin/lua
--[[
        Team #1 Lua Project: Returning Top 3 players from top lists of NBA
--]]

local statsData = {}
local index = 1
local FORMAT = '%2d: %-20s %.f'

-- Input File callback Function
function Entry(b) 
    statsData[index] = b
    --PrintAllData(statsData[index])
    index = index + 1
end


function PrintAllData(xData)
    print(xData.category .. ':')
    for ii = 1, #xData do
       local line = string.format(FORMAT, xData[ii].rank, xData[ii].player, xData[ii].score)
       print(line)
    end
    print()
end

function printTop3(top3)
    for ii = 1, #top3.plyr do
        local line = string.format(FORMAT, ii, top3.plyr[ii], top3.scr[ii])
        print(line)
    end
    print()
end


function getTop3Players(category)
    return category[1].player, category[2].player, category[3].player
end

function getTop3Scores(category)
    return  category[1].score, category[2].score, category[3].score
end


-- Main Execution --

dofile("NBA_Stats.txt")     --read file

local top3 = {plyr = {}, scr = {}}

for k,v in pairs(statsData) do
    local category = statsData[k]   --loop this to get all stats data
    top3.plyr[1], top3.plyr[2], top3.plyr[3] = getTop3Players(category)
    top3.scr[1], top3.scr[2], top3.scr[3] = getTop3Scores(category)
    print(category.category .. ':')
    printTop3(top3)
end





