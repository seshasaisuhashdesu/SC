
co_sites = c()
mut_sites = c()
co_prob = 0.6
mut_prob = 0.1

population = c(13,24,8,19,18,7,23,25)

max_range = 28
min_range = 0
n = 5
get_x_value <- function(x){
  return(min_range + (max_range-min_range)/((2^n)-1 ) * x)
}

obj_function <- function(x_value){
  return(x_value^2)
}

get_pi_value <- function(Fx){
  return(Fx/sum(Fx))
}


selected_chromosomes <- function(cum_Pi, r){
  
  chrom_no = c()
  for(element in r){
    i = 1
    chrom = NULL
    for(p_element in cum_Pi){
      
      if(element > p_element){
        chrom = i + 1
      }
      i = i + 1
    }
    chrom_no = append(chrom_no, chrom)
  }
  
  return(chrom_no)
}

get_binary <- function(x){
  result = c()
  for(each in x){
    result = append(result,substring(paste(as.integer(rev(intToBits(each))),collapse=""), 32-n+1, 32))  
  }
  return(result)
}

#Selection
x_value = get_x_value(population)
fx = obj_function(x_value)
Fx = fx
average_fitness = mean(Fx)
Pi = get_pi_value(Fx)
cum_Pi = cumsum(Pi)
r_selection = runif(length(population))
selected = selected_chromosomes(cum_Pi,r_selection)
#CrossOver
r_co = runif(length(population)/2)
binary_pop = get_binary(population[selected])
#Mutation