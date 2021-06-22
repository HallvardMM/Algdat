mutable struct NodeDoublyLinked
    prev::Union{NodeDoublyLinked, Nothing} # Er enten forrige node eller nothing
    next::Union{NodeDoublyLinked, Nothing} # Er enten neste node eller nothing
    value::Int # Verdien til noden
end

function createLinkedListDoublyLinked(length)
    # Create the list from the last element in the chain
    # This is so the returned element will be the first in the chain
    current = nothing
    beforeCurrent = nothing

    for i in 1:length
        # only fill out the next field because prev will be filled out later
        current = NodeDoublyLinked(nothing, beforeCurrent, rand(-100:100))
        # link up the node before this node to this node
        if beforeCurrent != nothing
            beforeCurrent.prev = current
        end
        beforeCurrent = current
    end
    return current
end

function maxofdoublelinkedlist(linkedlist)
    x=linkedlist
    y=linkedlist
    output=linkedlist.value
    while x.next != nothing
        x=x.next
        if output<x.value
            output=x.value
        end
    end
    while y.prev != nothing
        y=y.prev
        if output<y.value
            output=y.value
        end
    end
    return output
end

test=createLinkedListDoublyLinked(3)
print(test)
print(maxofdoublelinkedlist(test))