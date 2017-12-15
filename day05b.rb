#!/usr/bin/ruby

filename = ARGV[0]
steps = 0
instructions = Array.new

File.open(filename, "r") do |f|
    f.each_line do |inLine|
        instructions.push(inLine.to_i) 
    end

    puts instructions.length

    currStep = nextStep = 0

    while true do 
        steps += 1
        currStep = nextStep
#        puts "Step #{steps}: [#{currStep}]->#{instructions[currStep]}"
        nextStep = currStep + instructions[currStep]

        if instructions[currStep] >= 3
            instructions[currStep] -= 1
        else 
            instructions[currStep] += 1
        end
        
        if nextStep >= instructions.length 
            break
        end
    end

    puts steps
end

