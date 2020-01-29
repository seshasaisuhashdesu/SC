#install.packages("igraph")
library("igraph")
graph_1 <- graph( edges=c('A','S','A','T','A','Z','S','F','S','R','S','O','T','L','Z','O','F','B','R','P','R','C','L','M','B','G','B','U','P','B','C','P','M','D','U','H','D','C','H','E','H','V','V','I','I','N'), directed=F)
#graph_1 <- graph( edges=c('1','2','1','3','2','4','2','5'), directed=F)

#graph_1
#dfs(graph_1, 'A')
#bfs(graph_1, 'A')
#E(graph_1)[1]$weight <- 25
#E(graph_1)$weight <- 1
#V(graph_1)$color <- 'orange'
#V(graph_1)['A']$color <- 'yellow'
#V(graph_1)['B']$color <- 'red'
#plot(graph_1)
#v = adjacent_vertices(graph_1,"A")
#print(v)
#options(visited =list())

goal <- V(graph_1)['S']
start <- V(graph_1)['N']
get_adj_vertices <- function(graph, node,goal){
  
  adjacent_vertices_list = adjacent_vertices(graph,node)
  tmp <- get('visited',.GlobalEnv)
  tmp[[length(visited)+1]] <- node
  assign("visited",tmp, .GlobalEnv)
  
  for(i in seq(1,length(adjacent_vertices_list[[1]]),by=1)){
    if(goal == adjacent_vertices_list[[1]][i]){
      return(0)
    }
    if(!(adjacent_vertices_list[[1]][i] %in% visited)){
      #visited[[length(visited)+1]] <- adjacent_vertices_list[[1]][i]
      #print(visited)
      goal_reach_flag = get_adj_vertices(graph,adjacent_vertices_list[[1]][i],goal)
      if(goal_reach_flag == 0)
        {return(0)}
    }
  }
  return(1)
}

visited <- list()
get_adj_vertices(graph_1,start,goal)
visited[[length(visited)+1]] <- goal
V(graph_1)[unlist(visited)]$color="pink"
plot(graph_1)