global calories = Vector{Int}(undef, 0)
calories_sum=0

for line in eachline("01/input.txt")
    lineAsNum = tryparse(Int, line)
    if (lineAsNum === nothing)
        push!(calories, calories_sum)
        global calories_sum = 0
    else
        global calories_sum += lineAsNum
    end
end

sort!(calories, rev=true);
top_3_calories = calories[1] + calories[2] + calories[3];

println("calories", calories);
println("top_3_calories:", top_3_calories)