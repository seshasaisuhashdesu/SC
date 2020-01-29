root = unname(V(graph1)['Arad'])
goal = unname(V(graph1)['Hirsova'])

V(graph1)[c('Arad','Hirsova')]$color = 'Yellow'

open = c(root)
closed = c()
visited = cbind(V(graph1),rep(0,length(V(graph1))))
visited[1,2] = 1
current = root

max_depth = 3

depth = max_depth
while(depth > 0){
  if (current == goal) {
    break()
  }
  
  
  open = open[open!=current]
  
  if(is.null(closed))
  {  closed = c(current) }else
  {  closed = append(closed,(current))}
  
  adj_v = unname(neighbors(graph1, current))
  
  for(v in adj_v){
    if(visited[v,2]==1){
      adj_v = adj_v[adj_v != v]}
    
  }
  
  
  open  = c( open,adj_v)
  
  # if(is.null(closed))
  # {  closed = c(open[1]) }else
  # {  closed = append(closed,open[1])}
  #     
  #open = open[2:length(open)]
  
  
  current = open[1]
  visited[current,2] = 1
  
  
  V(graph1)[c(current)]$color = 'pink'
  if(length(open)==0)
  {echo('Failure')}
  depth = depth - 1 
}

# DFS
while (length(open) != 0) {
  if (current == goal) {
#    V(graph1)[c(current)]$color = 'pink'
    V(graph1)[c(current)]$color = 'yellow'
    closed = append(closed,(current))
    break()
  }
  
  
  open = open[open!=current]
  
  if(is.null(closed))
  {  closed = c(current) }else
  {  closed = append(closed,(current))}
  
  adj_v = unname(neighbors(graph1, current))
  
  for(v in adj_v){
    if(visited[v,2]==1){
      adj_v = adj_v[adj_v != v]}
    
  }
  
  
  open  = c(adj_v, open)
  
  # if(is.null(closed))
  # {  closed = c(open[1]) }else
  # {  closed = append(closed,open[1])}
  #     
  #open = open[2:length(open)]
  
  
  current = open[1]
  visited[current,2] = 1
  
  
  V(graph1)[c(current)]$color = 'pink'
  if(length(open)==0)
  {echo('Failure')}
}
plot(graph1)
V(graph1)[closed]
E(graph1)[closed]
sum(E(graph1)[closed]$weight)