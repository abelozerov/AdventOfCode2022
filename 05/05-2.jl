lines = readlines("05/input.txt");

# calculating number of stacks
numberOfStacksLineIndex = 1
line = lines[numberOfStacksLineIndex]
while true
    global line=lines[numberOfStacksLineIndex]
    !startswith(line, " 1") || break
    global numberOfStacksLineIndex+=1
end
numberOfStacks = parse(Int, split(line, ' '; keepempty=false)[end])

# filling stacks
stacks = [[] for _ in 1:numberOfStacks]

for lineIndex in reverse(1:numberOfStacksLineIndex-1)
    for stackNum in 1:numberOfStacks
        # stack 1 - 2
        # stack 2 - 6
        # stack 3 - 10
        # stack 4 - 14
        stackPos = stackNum*4 - 2
        symbol = lines[lineIndex][stackPos]
        if symbol != ' '
            stack = stacks[stackNum]
            push!(stacks[stackNum], symbol)
            #println("filling stack ", stackNum, " with ", symbol)
        end
    end
end

# parsing and executing commands
for lineIndex in numberOfStacksLineIndex+2:length(lines)
    local line = lines[lineIndex]
    parsedNums = map(i -> parse(Int, i), split(line, r"[^\d+]"; keepempty=false))
    numBlocksToMove = parsedNums[1]
    stackFrom = parsedNums[2]
    stackTo = parsedNums[3]

    blocksToMove = []
    for i in 1:numBlocksToMove
        item = pop!(stacks[stackFrom])
        push!(blocksToMove, item)
    end
    for i in 1:numBlocksToMove
        item = pop!(blocksToMove)
        push!(stacks[stackTo], item)
    end
end

println("Done")
final_line = ""
for i in 1:numberOfStacks
    item = pop!(stacks[i])
    global final_line *= item
end
println(final_line)