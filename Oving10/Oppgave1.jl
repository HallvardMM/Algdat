using DataStructures: PriorityQueue, enqueue!, dequeue!

mutable struct Node
    name::String # used to distinguish nodes when debugging
    d::Union{Float64, Nothing} # d for distance
    p::Union{Node, Nothing} # p for predecessor
end
Node(name) = Node(name, nothing, nothing) # constructor used for naming nodes

mutable struct Graph
    V::Array{Node} # V for Vertices
    Adj::Dict{Node, Node} # Adj for Adjacency
end

function initialize!(G, s)
    for vertex in G.V
        vertex.d = -Inf
        vertex.p=Nothing
    end
    s.d=Inf
end


function update!(u, v, w)
    if v.d < u.d+w
        v.d = u.d+w
        v.p = u
    end
end


function general_dijkstra!(G, w, s, reverse=false)
    initialize!(G,s)
    S=[]
    if reverse
        Q = PriorityQueue(Base.Order.Reverse)
    else
        Q = PriorityQueue(Base.Order.Forward)
    end
    Q = PriorityQueue(u => u.d for u in G.V)
    while !(length(Q)==0)
        u=dequeue!(Q)
        push!(S,u)
        for v in G.Adj[u]
    		update!(u,v,w)
        end
    end
end

"""
Implementasjonen din kompilerte, men var ikke korrekt.
Har du husket å oppdatere prioritetskøen?
Burde gitt:
G.V = [A(0.0, -), B(30.0, A(0.0, -)), C(20.0, A(0.0, -)), D(Inf, -), ]
G.Adj = {
    D(Inf, -) => [B(30.0, A(0.0, -)), C(20.0, A(0.0, -)), ]
    A(0.0, -) => [B(30.0, A(0.0, -)), C(20.0, A(0.0, -)), ]
    B(30.0, A(0.0, -)) => [C(20.0, A(0.0, -)), D(Inf, -), ]
    C(20.0, A(0.0, -)) => [D(Inf, -), ]
}
men ga:
G.V = [A(0.0, -), B(30.0, A(0.0, -)), C(20.0, A(0.0, -)), D(40.0, C(20.0, A(0.0, -))), ]
G.Adj = {
    B(30.0, A(0.0, -)) => [C(20.0, A(0.0, -)), D(40.0, C(20.0, A(0.0, -))), ]
    A(0.0, -) => [B(30.0, A(0.0, -)), C(20.0, A(0.0, -)), ]
    C(20.0, A(0.0, -)) => [D(40.0, C(20.0, A(0.0, -))), ]
    D(40.0, C(20.0, A(0.0, -))) => [B(30.0, A(0.0, -)), C(20.0, A(0.0, -)), ]
}
med startnode:
A(0.0, -)
"""