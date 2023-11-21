
number_of_site <- 2
subjects <- 48
blocksize <- 12
T <- 3
C <- 1
number_of_blocks <- subjects/blocksize

# Set seed for reproducibility (optional)
set.seed(123)

# Create an empty list to store blocks
sites <- list()

for(site in 1:number_of_site){
    site_name <- ifelse(site == 1, "AAA", "BBB")
    blocks <- list()

    for(block in 1:number_of_blocks ){
    element <- c(rep("T",blocksize*T/(T+C)), rep("C", blocksize*C/(T+C)))

    shuffled_numbers <- sample(element, replace=FALSE)
    blocks <- append(blocks,list(shuffled_numbers))
    }

    for(i in seq_along(blocks)){
        for(j in seq_along(blocks[[i]])) {
        sites <- append(sites, paste0(site_name, (i-1)*blocksize + j, blocks[[i]][j]))
        }
    }
}



print(sites)


