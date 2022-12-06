countCharsRead=0

list = []
function pushToPrevCharsList(char)
    push!(list, char)
    if length(list) > 4
        popfirst!(list)
    end
end

function isCodeFound()
    return length(list) == 4 && length(unique(list)) == 4
end

open("06/input.txt", "r") do f
    while !eof(f)
        global countCharsRead+=1
        char = read(f, Char)
        pushToPrevCharsList(char)
        if isCodeFound()
            break
        end
        print(char)
    end
end

println("code found at ", countCharsRead)