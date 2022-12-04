sum = 0

function mapCharToCode(ch)
    if isuppercase(ch)
        return Int(ch) - 38
    else
        return Int(ch) - 96
    end
end

lines = readlines("03/input.txt");
for i in 2:length(lines)
    if i % 3 != 0
        continue
    end
    line1 = lines[i-2]
    line2 = lines[i-1]
    line3 = lines[i]

    for symbol in line1
        if contains(line2, symbol) && contains(line3, symbol)
            code = mapCharToCode(symbol)
            println(symbol * " " * string(code))
            global sum += code
            break
        end
    end
end

println("final score ", sum);