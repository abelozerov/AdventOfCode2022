sum = 0

for line in eachline("04/input.txt")
    ranges = split(line, ',')
    range1 = map(r -> parse(Int,r), split(ranges[1], '-'))
    range2 = map(r -> parse(Int,r), split(ranges[2], '-'))
    if (range1[1] <= range2[1] && range1[2] >= range2[2]) || (range1[1] >= range2[1] && range1[2] <= range2[2])
        println(range1, " ", range2)
        global sum+=1
    end
end

println("final score ", sum);