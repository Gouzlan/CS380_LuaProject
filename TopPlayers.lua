#!/usr/bin/lua



function Entry(b) 
    local record = b
    PrintRecord(record)
end

function PrintRecord(b)
    print(b.category .. ':')
    for ii = 1, #b do
       io.write(b[ii].rank .. ' ')
       io.write(b[ii].player .. ' ')
       print(b[ii].score)
    end
    print()
end

dofile("NBA_Stats.txt")

