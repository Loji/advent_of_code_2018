

foundTwo = 0
foundThree = 0

File.foreach("input").with_index do |line, line_num|
    lineHasTwo = false
    lineHasThree = false

    line.split("").each do |char|
        if line.count(char) == 2
            lineHasTwo = true
        end

        if line.count(char) == 3
            lineHasThree = true
        end
    end

    foundTwo += lineHasTwo ? 1 : 0
    foundThree += lineHasThree ? 1 : 0
end

$lines = File.readlines("input")
$goodLines = []

def findSimilar(comparedLine, ignoreKey)

    $lines.each.with_index do |line, key|
        if ignoreKey == key
            next
        end

        hasError = false
        isGoodLine = true
        line.split('').each.with_index do |letter, key|
            if letter != comparedLine[key]
                if hasError
                    isGoodLine = false
                    break
                else
                    hasError = true
                end
            end
        end

        if isGoodLine
            $goodLines.push(line)
        end
    end
end

$lines.each.with_index do |line, key|
    findSimilar(line, key)
end

puts $goodLines
puts (foundThree * foundTwo)
