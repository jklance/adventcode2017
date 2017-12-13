#!/usr/bin/ruby

filename = ARGV[0]
checksum = 0

File.open(filename, "r") do |f|
    f.each_line do |inItem|
        puts inItem
        itemArr = inItem.split(' ')
        upper = lower = 1

        for i in 0..itemArr.length - 2
            for j in (i + 1)..itemArr.length - 1
                u = itemArr[j].to_i
                l = itemArr[i].to_i

                if itemArr[i].to_i > itemArr[j].to_i
                    u = itemArr[i].to_i
                    l = itemArr[j].to_i
                end

                if u % l == 0
                    upper = u
                    lower = l
                end
            end
        end

        quotient = upper / lower
        puts "#{upper} / #{lower} = #{quotient}"
        checksum += quotient
    end
    puts checksum
end
