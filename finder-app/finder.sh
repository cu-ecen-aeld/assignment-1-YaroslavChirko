#/bin/sh

if [ $# -lt 2 ]
then
	echo "Expected 2 arguments but $# was provided instead."
	exit 1
fi

filesdir=$1
searchstr=$2

if [ ! -d $filesdir ]
then
	echo "No file for $filesdir found, perhaps it doesn\'t exist\nor a typo is present"
	exit 1
fi

# First we should get all of the files in current and all subdirectories recursively.
# We don't need directories thus we use -type f option.
# Output is in full path format since we'll need it for search later.
files=$(find $filesdir -type f)

# Now we read from the variable and pass it to the word count, we only care about line count (though words will do as well in this particular situation.
num_of_files=$(cat $files |  wc -l)

# Here we conduct the search and increment the num_of_lines variable to keep the count.
num_of_lines=0
for file in $files
do
	$((num_of_lines+=$(cat $file | grep $searchstr | wc -w)))
done

echo "The number of files are $num_of_files and the number of matching lines are $num_of_lines"



