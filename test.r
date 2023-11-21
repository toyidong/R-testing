
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

for(site in 1:number_of_site){  # first for loop: loop from 1 to number_of_site, is to loop through each site

    # Create site name for each site
    site_name <- ifelse(site == 1, "AAA", "BBB")

    # Create an empty list to store blocks
    blocks <- list()

    # for loop to append all randomized vectors to blocks list
    for(block in 1:number_of_blocks ){  # second for loop: loop from 1 to number_of_blocks, is to loop through each block
        # Create a vector of element
        element <- c(rep("T",blocksize*T/(T+C)), rep("C", blocksize*C/(T+C)))
        
###################################################################################
# element is a vector: 
# can think it as 1-D matrix/array, size is 12, 
# e.g. ["T", "T", .... "C", "T"]
###################################################################################
        # randomize the element vector
        shuffled_numbers <- sample(element, replace=FALSE) 
        # append the randomized vector to blocks list, continue to the start of second loop
        blocks <- append(blocks,list(shuffled_numbers))
        
###################################################################################
# blocks is a list of vector: 
# can think it as 2-D matrix/array, size is 4*12, 
# 4 vectors, each vector has size of 12, the size of blocks is 4*12
# e.g. [
#        ["T", "T", .... "C", "T"],
#        ["T", "C", .... "C", "T"],
#        ["C", "T", .... "C", "T"],
#        ["C", "T", .... "T", "T"]
#      ]
###################################################################################
    }  
    # end of second loop, each block is a vector, now all block vectors added to blocks list

    # Process string name: after blocks list has all vectors, paste string together to get name
    # because blocks list is a 2-D array, need two for-loop to get each element
    # the outer loop (first loop) is to get each block 
    # the inner loop (second loop) is to get each element in block vector
    for (i in seq_along(blocks)) {
          for (j in seq_along(blocks[[i]])) {
                sites<-append(sites,paste0(site_name,(i-1)*blocksize+j, blocks[[i]][j]))
          }
    }

    # after process all elements in blocks, continue to the start of first loop for next site
} # end of first loop, now all blocks processed and added to sites

# Convert the list to a data frame
df <- data.frame(Strings = unlist(sites), stringsAsFactors = FALSE)

# Save the data frame to a CSV file
write.csv(df, file = "result.csv", row.names = FALSE)

