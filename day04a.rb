#!/usr/bin/ruby

filename = ARGV[0]
validCount = 0

File.open(filename, "r") do |f|
    f.each_line do |inLine|
        wordMap = Hash.new
        wordArr = inLine.split(' ')
        validLine = true 

        wordArr.each do |word|
            if wordMap.key?(word) then
                wordMap[word] += 1
                validLine = false
            else
                wordMap[word] = 0
            end
        end
    
        if validLine then
            validCount += 1
        end
    end
end

puts validCount
