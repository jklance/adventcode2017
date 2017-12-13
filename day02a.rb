#!/usr/bin/ruby

filename = ARGV[0]
checksum = 0

File.open(filename, "r") do |f|
    f.each_line do |inItem|
        puts inItem
        itemArr = inItem.split(' ')
        puts itemArr[1]
        min = max = itemArr[0].to_i;

        itemArr.each{ |cell| 
            cell = cell.to_i
            
            if cell < min
                min = cell
            end

            if cell > max
                max = cell
            end
        }
        diff = max - min
        puts "#{max} - #{min} = #{diff}"
        checksum += diff
    end
    puts checksum
end
