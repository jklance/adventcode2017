#!/usr/bin/ruby

def getTowerMembers(filename)
    towerMembers = Array.new

    File.open(filename, "r") do |f|
        f.each_line do |inLine|
            towerMembers.push(inLine.chomp)
        end
    end

    return towerMembers
end

def deconstructMemberList(tower)
    towerStack = Hash.new

    tower.each{ |val|
        parts = val.split(' -> ')
        front = parts[0].split(' ')
        children = Array.new
        if parts.length > 1
            children = parts[1].split(', ')
        end

        towerPart = {
            :weight   => front[1],
            :children => children
        }
        
        #towerParts.push(towerPart)
        towerStack[front[0]] = towerPart
    }

    return towerStack
end


# Main
towerMembers = getTowerMembers(ARGV[0])
p towerMembers 

towerMembers = deconstructMemberList(towerMembers)
p towerMembers


