# Martix: A,B,C - columns, X,Y,Z - rows
#   A B C
# X 3 1 2
# Y 4 5 6
# Z 8 9 7
const rules = [3 1 2
                4 5 6
                8 9 7]
const variantsOpp = ['A','B','C']
const variantsPlayer = ['X','Y','Z']
sum = 0

for line in eachline("02/input.txt")
    varOpp = line[1];
    varPlayer = line[3];
    indexOpp = indexin(varOpp, variantsOpp)[1];
    indexPlayer = indexin(varPlayer, variantsPlayer)[1];
    score = rules[indexPlayer, indexOpp]

    println(varOpp,varPlayer,score);
    global sum += score
end

println("final score", sum);