#!/usr/bin/ruby

inputArr = ARGV

inputArr.each { |inItem| 
    itemArr = inItem.scan /\d/
    itemArr.push(itemArr[0])
    sum = 0;

    itemArr.each_with_index{ |v,i| 
        i = i.to_i
        if itemArr[i] == itemArr[i + 1] 
            sum += itemArr[i].to_i
        end 
    }

    puts sum
}

