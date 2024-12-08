
function [mst, total_cost] = primsMST(graph, N)
    key = ones(1, N) * %inf;  
    parent = zeros(1, N);      
    mst = zeros(1, N);         
    key(1) = 0;                
    
    total_cost = 0;           
    
    for count = 1:N
        u = -1;
        min_key = %inf;
        
        for i = 1:N
            if mst(i) == 0 & key(i) < min_key then
                min_key = key(i);
                u = i;
            end
        end
        mst(u) = 1;
        total_cost = total_cost + key(u);  
        for v = 1:N
            if graph(u, v) > 0 & mst(v) == 0 & graph(u, v) < key(v) then
                key(v) = graph(u, v);  
                parent(v) = u;          
            end
        end
    end
    disp("Edges in MST (parent, child, weight):");
    for i = 2:N  // Starting from the second vertex (since the first one is arbitrary)
        disp([parent(i), i, graph(parent(i), i)]);
    end
endfunction


graph = [
    0, 2, 0, 6, 0; 
    2, 0, 3, 8, 5; 
    0, 3, 0, 0, 7;
    6, 8, 0, 0, 9;  
    0, 5, 7, 9, 0   
];

N = size(graph, 1);
[mst, total_cost] = primsMST(graph, N);
disp("Total cost of the Minimum Spanning Tree (MST):");
disp(total_cost);