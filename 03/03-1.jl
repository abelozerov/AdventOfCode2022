sum = 0

function mapCharToCode(ch)
    if isuppercase(ch)
        return Int(ch) - 38
    else
        return Int(ch) - 96
    end
end

for line in eachline("03/input.txt")
    len = length(line);

    firstCompartment = line[1:Int(len/2)];
    secondCompartment = line[Int(len/2)+1:end];
    print(line * " " * firstCompartment * " " * secondCompartment * ": ");

    for symbol in firstCompartment
        if contains(secondCompartment, symbol)
            code = mapCharToCode(symbol)
            println(symbol * " " * string(code))
            global sum += code
            break
        end
    end
end

println("final score ", sum);