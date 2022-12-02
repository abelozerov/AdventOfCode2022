most_calories=0
calories_sum=0

for line in eachline("01/input.txt")
    lineAsNum = tryparse(Int, line)
    if (lineAsNum === nothing)
        println(calories_sum)
        if (calories_sum > most_calories)
            global most_calories = calories_sum
        end
        global calories_sum = 0
    else
        global calories_sum += lineAsNum
    end
end

println("most calories:", most_calories)