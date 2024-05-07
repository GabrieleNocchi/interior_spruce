awk '
{
    count[$1]++
}

END {
    unique_count = 0
    non_unique_count = 0

    for (value in count) {
        if (count[value] == 1) {
            unique_count++
        } else {
            non_unique_count++
        }
    }

    print "Number of unique $1 values appearing only once:", unique_count
    print "Number of non-unique $1 values appearing more than once:", non_unique_count
}' final_selection_2.txt
