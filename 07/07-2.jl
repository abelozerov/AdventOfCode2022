mutable struct TreeNode
    name::String
    size::Union{Int, Nothing}
    parent::Union{TreeNode, Nothing}
    children::Vector{TreeNode}
end

rootNode = TreeNode("/", nothing, nothing, [])
currentNode = rootNode

function getChild(parentNode::TreeNode, childName::AbstractString)
    return filter(n -> n.name == childName, parentNode.children)[1]
end

function addChild!(parentNode::TreeNode,  childName::AbstractString, size::Union{Int, Nothing})
    println("adding child ", childName, " size ", size)
    push!(parentNode.children, TreeNode(childName, size, parentNode, []))
end

function traverseTree(f, parentNode::TreeNode)
    f(parentNode)
    for child in parentNode.children
        traverseTree(f, child)
    end
end

function isDir(node::TreeNode)
    return length(node.children) > 0
end

function calculateDirSize(node::TreeNode)
    if length(node.children) == 0
        #println("node ", node.name, " size ", node.size)
        return node.size === nothing ? 0 : node.size
    end
    return sum(map(c -> calculateDirSize(c), node.children))
end



command = ""
argument = ""
for line in eachline("07/input.txt")
    lineParts = split(line, ' ')
    if lineParts[1] == "\$"
        # Command
        global command = lineParts[2]
        global argument = length(lineParts)>2 ? lineParts[3] : ""

        #println("command ", command, " argument ", argument)

        if command == "cd"
            if argument == "/"
                global currentNode = rootNode
            elseif argument == ".."
                global currentNode = currentNode.parent
            else
                child = getChild(currentNode, argument)
                global currentNode = child
            end
        elseif command == "ls"
            # just continue and parse output then
        end
    else
        # Command output
        if command == "ls"
            sizeOrDir = lineParts[1]
            fileOrDirName = lineParts[2]
            if sizeOrDir == "dir"
                addChild!(currentNode, fileOrDirName, nothing)
            else
                addChild!(currentNode, fileOrDirName, parse(Int, sizeOrDir))
            end
        end
    end
end

diskSpaceTotal = 70000000
diskSpaceNeedsToBeUnused = 30000000

totalSize = calculateDirSize(rootNode)
println("totalSize ", totalSize)

diskSpaceUnused = diskSpaceTotal-totalSize
diskSpaceToFree = diskSpaceNeedsToBeUnused-diskSpaceUnused
println("diskSpaceToFree ", diskSpaceToFree)

nodesSizes = []
traverseTree(n -> isDir(n) && push!(nodesSizes, calculateDirSize(n)), rootNode)
nodesSizesFiltered = filter(s -> s>=diskSpaceToFree, nodesSizes)

println("nodesSizesFiltered ", nodesSizesFiltered)
println("min nodesSizesFiltered ", sort(nodesSizesFiltered))