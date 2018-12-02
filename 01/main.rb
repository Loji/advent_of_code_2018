result = 0

resultForRepetition = 0
resultHash = Hash.new()
resultRepeated = nil

File.foreach("input").with_index do |line, line_num|
    result += line.to_i
end

while resultRepeated == nil
    File.foreach("input").with_index do |line, line_num|
        resultForRepetition += line.to_i
        if resultHash.key?(resultForRepetition)
            resultRepeated = resultForRepetition
            break
        else
            resultHash[resultForRepetition] = true
        end
    end
end

puts result
puts resultRepeated
