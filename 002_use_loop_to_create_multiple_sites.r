
############################################################################################
# Use for loop to create multiple lists with different names
# 
# Option 1: define names in a list, then iterate through the names list for each site
# Option 2: more realistic case, read names from CSV, Excel file, or read from databases
#           there are R packages available to read Excel file, connect to databases
############################################################################################

################ Example for Option 1 ################

# Create a list with arbitrary number of names, e.g. 6 names
names <- list("AAA", "BBB", "CCC", "XXX", "YYY", "ZZZ")

# Iterate through the list to get every name, use each name as a site_name
# Use length(list) for iteration times
for(i in 1:length(names)){
    site_name <- names[i]  # i-th name in names list, use this name as site_name

    ######################################################################### 
    # the above for loop is corresponding to the first loop in last presentation, which is to create site_name
    # then copy the code from last time presentation, below the site_name
    # because those code are to create blocks, with site_name just created
    # refer to Example for Option 2, code truncated for simplicity

} # end of Example for Option 1 #####


################ Example for Option 2 ################

# Get CSV file name and path, replace "your_file.csv" with the actual CSV file path
csv_file <- "your_file.csv"

# Read data from the CSV file, data is a dataframe
# think dataframe as a table or excel sheet, with rows and columns, df[i,j] means i-th row and j-th column in dataframe
data <- read.csv(csv_file)

# Let's say the 2nd column in CSV is Names column, each row in that column is a Name
# get data from 2nd column, leave row number as blank so that all rows in 2nd column will be retrieved
column_data <- data[ ,2]

# Now we need to know how many rows in this column, use nrow(dataframe) function to get row number in dataframe
# because your code do not know exact number of rows in that CSV file, 
# use for(i in 1:num_rows) to iterate through column_data, 
# in this way, when you want to read from another CSV file with different number of rows, your code can process as well
num_rows <- nrow(data)

# Iterate through column_data, each name will be the name for one site
for(i in 1:num_rows){
    site_name <- column_data[i]  # i-th row in column_data, use that value as site_name

    ######################################################################### 
    # the above for loop is corresponding to the first loop in last presentation, which is to create site_name
    # then copy the code from last time presentation, below the site_name
    # because those code are to create blocks, with site_name just created
    
    # Create an empty list to store blocks
    blocks <- list()

    # for loop to append all randomized vectors to blocks list
    for(block in 1:number_of_blocks ){  # second for loop: loop from 1 to number_of_blocks, is to loop through each block
        # Create a vector of element
        element <- c(rep("T",blocksize*T/(T+C)), rep("C", blocksize*C/(T+C)))

        # randomize the element vector
        shuffled_numbers <- sample(element, replace=FALSE) 
        # append the randomized vector to blocks list, continue to the start of second loop
        blocks <- append(blocks,list(shuffled_numbers))
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
    df <- data.frame(x = unlist(sites), stringsAsFactors = FALSE)

    # Save the data frame to a CSV file
    write.csv(df, file = "result.csv", row.names = FALSE)

