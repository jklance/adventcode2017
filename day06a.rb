#!/usr/bin/ruby

def getMemoryDump(filename)
    memoryDump = Array.new

    File.open(filename, "r") do |f|
        f.each_line do |inLine|
            memoryDump = inLine.split(' ')
        end
    end

    memoryDump.each_with_index { |val,index|
        memoryDump[index] = val.to_i
    }

    return memoryDump
end

def countCycles(currState)
    history = Array.new
    cycles = 0

    while true do
        cycles += 1
        currState = redistributeWealth(currState)

        if checkForMatch(currState, history) then
            break;
        end
        history.push(currState.dup)
    end

    return cycles
end

def checkForMatch(current, history)
    i = 0
    match = false

    if history.length > 0 and history.include?(current) 
        match = true
    end

#    p history
#    p current

    return match
end

def redistributeWealth(memory)
    biggestIndex = memory.index(memory.max)
    count = memory[biggestIndex]
    memory[biggestIndex] = 0

    while count > 0
        biggestIndex += 1
        if biggestIndex >= memory.length then 
            biggestIndex = 0
        end
        memory[biggestIndex] += 1
        count -= 1
    end

    return memory
end

# Main
memoryDump = getMemoryDump(ARGV[0])

cycles = countCycles(memoryDump)
puts cycles
