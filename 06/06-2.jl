countCharsRead=0

list = []
function pushToPrevCharsList(char)
    push!(list, char)
    if length(list) > 14
        popfirst!(list)
    end
end

function isCodeFound()
    return length(list) == 14 && length(unique(list)) == 14
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