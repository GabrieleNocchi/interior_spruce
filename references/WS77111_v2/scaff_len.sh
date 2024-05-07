awk -v scaffold="Pg-03r170320s1674825" '
    BEGIN {
        RS=">"
        FS="\n"
        ORS=""
    }
    $1 ~ scaffold {
        sequence = $2
        gsub("\n", "", sequence)
        print "Length of scaffold " scaffold " is " length(sequence) " bases.\n"
    }
' WS77111-v2_1000plus_LGs.fa 
