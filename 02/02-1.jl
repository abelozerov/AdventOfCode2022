# Martix: A,B,C - columns, X,Y,Z - rows
#   A B C
# X 4 1 7
# Y 8 5 2
# Z 3 9 6
const rules = [4 1 7
                8 5 2
                3 9 6]
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