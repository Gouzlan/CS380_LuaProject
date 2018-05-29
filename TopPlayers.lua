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
-- Lua interpreter: https://www.lua.org/download.html
-- Download and install lua 
--
-- Installing Lua For:
--   * LINUX: Issue the following command in the terminal:
--     $ curl -R -O http://www.lua.org/ftp/lua-5.3.4.tar.gz
--     $ tar zxf lua-5.3.4.tar.gz
--     $ cd lua-5.3.4
--     $ make linux test
--   * Windows: Follow the online guide linked below
--      http://lua-users.org/wiki/BuildingLuaInWindowsForNewbies
--   
-- Code: https://github.com/Gouzlan/CS380_LuaProject.git
-- To RUN: issue the following terminal command:
--      $ lua TopPlayers.lua
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

-- Sort the table by the keys
function pairsByKeys(dataTable)
  local data = {}
  for number in pairs(dataTable) do
    table.insert(data, number)
  end
  table.sort(data)
  local i = 0      -- iterator variable
  local iter = function()   -- iterator function
    i = i + 1
    if data[i] == nil then
      return nil
    else
      return data[i], dataTable[data[i]]
    end
  end
  return iter
end

-- Take the data from the file and convert it into a table that we can print pretty
function toKeyValueTable(dataTable)
  local data = {}
  for key in pairs(dataTable) do
      local category = dataTable[key]
      local top3 = {plyr = {}, scor = {}}
      top3.plyr[1], top3.plyr[2], top3.plyr[3] = getTop3Players(category)
      top3.scor[1], top3.scor[2], top3.scor[3] = getTop3Scores(category)
      data[category.category] = top3
  end
  return data
end

-- Main Execution --
dofile("NBA_Stats_input.txt")

-- Each category in statsData returns the top3 players and scores and prints it.
for key, value in pairsByKeys(toKeyValueTable(statsData)) do
  print(key .. ':')
  printTop3(value)
end
