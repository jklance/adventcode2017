#!/usr/bin/ruby

def getCorners(square) 
    side = Math.sqrt(square).to_i
    if side != Math.sqrt(square) 
        side += 1
    end

    if side % 2 == 0 
        side += 1
    end
    
    corners = {}
    
    corners["br"] = side * side
    corners["bl"] = (side * side) - side + 1
    corners["ul"] = corners["bl"] - side + 1
    corners["ur"] = corners["ul"] - side + 1
    corners["side"] = side

    return corners
end

def createEmptyArray(target, corners)
    gridArr = Array.new
    for i in 1..corners["side"]
        gridArr.push(Array.new(corners["side"], 0))
    end
    
    return gridArr
end

def calculateCell(tx, ty, grid)
    sum = 0
    if (grid[ty][tx] == 0)
        for x in (tx - 1)..(tx + 1)
            for y in (ty - 1)..(ty + 1)
                if x >= 0 and y >= 0 and x < grid.length and y < grid.length 
                    #puts "#{x}, #{y}: #{grid[y][x]}"
                    sum += grid[y][x]
                end
            end
        end
    else 
        sum = grid[ty][tx]
    end
    return sum
end

def fillGrid(target, grid)
    xStart = yStart = midPoint = (grid.length) / 2
    grid[yStart][xStart] = 1

    span = 1
    count = 1
    sum = 0

    while count < target and sum < target 
        if xStart <= midPoint
            xEnd = xStart + span
            puts "X-- #{xStart}->#{xEnd}"
            for x in xStart..xEnd
                sum = calculateCell(x, yStart, grid)
                grid[yStart][x] = sum
                puts "#{x}, #{yStart}: #{grid[yStart][x]}"
                if sum >= target then 
                    break
                end
            end
        else
            xEnd = xStart - span
            puts "X-- #{xStart}->#{xEnd}"
            for x in xStart.downto(xEnd)
                sum = calculateCell(x, yStart, grid)
                grid[yStart][x] = sum
                puts "#{x}, #{yStart}: #{grid[yStart][x]}"
                if sum >= target 
                    break
                end
            end
        end
        xStart = xEnd

        if sum >= target
            break
        end
        if yStart >= midPoint
            yEnd = yStart - span
            puts "Y-- #{yStart}->#{yEnd}"
            for y in yStart.downto(yEnd)
                sum = calculateCell(xStart, y, grid)
                grid[y][xStart] = sum
                puts "#{xStart}, #{y}: #{grid[y][xStart]}"
                if sum >= target 
                    break
                end
            end
        else
            yEnd = yStart + span
            puts "Y-- #{yStart}->#{yEnd}"
            for y in yStart..yEnd
                sum = calculateCell(xStart, y, grid)
                grid[y][xStart] = sum
                puts "#{xStart}, #{y}: #{grid[y][xStart]}"
                if sum >= target 
                    break
                end
            end
        end

        yStart = yEnd

        span += 1
        count += 1
    end
    return grid
end

target = ARGV[0].to_i

corners = getCorners(target)
grid = createEmptyArray(target, corners)
p grid

result = fillGrid(target, grid)

