#!/usr/bin/lua


local categories = {}

function Entry(b) categories[b.category] = true end
dofile("NBA_Stats.txt")

for name in pairs(categories) do print(name) end

