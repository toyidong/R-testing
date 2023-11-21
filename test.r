
number_of_site <- 2
subjects <- 48
blocksize <- 12
T <- 3
C <- 1
number_of_blocks <- subjects/blocksize

# Set seed for reproducibility (optional)
set.seed(123)

# Create an empty list to store final results
sites <- list()

for(site in 1:number_of_site){

    # Create site name for each site
    site_name <- ifelse(site == 1, "AAA", "BBB")

    # Create an empty list to store blocks
    blocks <- list()

    # for loop to append all randomized vectors to blocks list
    for(block in 1:number_of_blocks ){
        # Create a vector of element
        element <- c(rep("T",blocksize*T/(T+C)), rep("C", blocksize*C/(T+C)))

        # randomize the element vector
        shuffled_numbers <- sample(element, replace=FALSE)
        # append the randomized vector to blocks list
        blocks <- append(blocks,list(shuffled_numbers))
    }

    # after all randomized vector has been appended into blocks list
    # concatenate site_name, sequence number of each element, and element to one string
    for(i in seq_along(blocks)){ # loop through the blocks to get each randomized vector
        for(j in seq_along(blocks[[i]])) { # loop through the vector to get each element
            # concatenate by paste0
            # append concatenated result to sites list
            sites <- append(sites, paste0(site_name, (i-1)*blocksize + j, blocks[[i]][j]))
        }
    }
}

# after all results appended to sites list, print out results
print(sites)


