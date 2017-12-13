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

    puts "#{corners['ul']} -- #{corners['ur']}"
    puts "#{corners['bl']} -- #{corners['br']}"

    return corners
end

def getCoordsBottom(corners, square)
    y = corners["side"] - 1
    x = square - corners["bl"]

    coord = {"x" => x, "y" => y}
    return coord
end

def getCoordsTop(corners, square)
    y = 0
    x = corners["ul"] - square

    coord = {"x" => x, "y" => y}
    return coord
end

def getCoordsLeft(corners, square)
    y = square - corners["ul"]
    x = 0

    coord = {"x" => x, "y" => y}
    return coord
end

def getCoordsRight(corners, square)
    y = corners["ur"] - square
    x = corners["side"] - 1

    coord = {"x" => x, "y" => y}
    return coord
end

def findDataLocation(square, corners)
    coord = {}

    if square > corners["bl"]
        puts "bottom"
        coord = getCoordsBottom(corners, square)
    elsif square > corners["ul"]
        puts "left"
        coord = getCoordsLeft(corners, square)
    elsif square > corners["ur"]
        puts "top"
        coord = getCoordsTop(corners, square)
    else 
        puts "right"
        coord = getCoordsRight(corners, square)
    end

    puts "Coord: #{coord['x']}, #{coord['y']}"
    return coord
end

def getDataDistance(dataCoords, corners)
    center = (corners["side"] - 1) / 2

    distance = (dataCoords["x"] - center).abs + (dataCoords["y"] - center).abs
    return distance
end


corners = getCorners(ARGV[0].to_i)
dataCoords = findDataLocation(ARGV[0].to_i, corners)
distance = getDataDistance(dataCoords, corners)
puts distance


