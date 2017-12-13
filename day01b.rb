#!/usr/bin/ruby

inputArr = ARGV

inputArr.each { |inItem| 
    itemArr = inItem.scan /\d/
    sum = 0;
    distance = itemArr.length / 2

    itemArr.each_with_index{ |v,i| 
        i = i.to_i
        
        comp = i + distance 
        if i + distance >= itemArr.length 
            comp = i - distance 
        end

        if itemArr[i] == itemArr[comp] 
            sum += itemArr[i].to_i
        end 
    }

    puts sum
}

