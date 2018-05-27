#!/usr/bin/lua
--
-- Team #1 Lua Project: Returning Top 3 players from top lists of NBA
--  Names  : Andrew Olaveson, Joshua Rodriguez, 
--            Ronald Lencevicius, Christopher Kilian
--  Due    : 05-29-2018
--  Course : cs40801-sp18
--
--  Description: Takes in a top score chart of all time for the NBA, including
--    different categories, and outputs the top 3 of each category.
--

statsData = {}            -- Holds all data read in from textfile
index = 1
FORMAT = '%2d: %-20s %.f'


-- Input File callback Function
function Entry(b) 
    statsData[index] = b
    index = index + 1
end

-- Prints out all of the data gathered from the text file
function PrintAllData(xData)
    print(xData.category .. ':')
    for ii = 1, #xData do
       local line = string.format(FORMAT, xData[ii].rank, xData[ii].player, xData[ii].score)
       print(line)
    end
    print()
end

-- Print function to print out a top3 list from a specific category
function printTop3(top3)
    for ii = 1, #top3.plyr do
        local line = string.format(FORMAT, ii, top3.plyr[ii], top3.scor[ii])
        print(line)
    end
    print()
end

-- Returns top 3 players in a given category
function getTop3Players(category)
    return category[1].player, category[2].player, category[3].player
end

-- Returns top 3 scores in a given category
function getTop3Scores(category)
    return  category[1].score, category[2].score, category[3].score
end


-- Main Execution --
dofile("NBA_Stats.txt")

-- Each category in statsData returns the top3 players and scores and prints it.
top3 = {plyr = {}, scor = {}}
for k,v in pairs(statsData) do
    local category = statsData[k]
    top3.plyr[1], top3.plyr[2], top3.plyr[3] = getTop3Players(category)
    top3.scor[1], top3.scor[2], top3.scor[3] = getTop3Scores(category)
    print(category.category .. ':')
    printTop3(top3)
end





