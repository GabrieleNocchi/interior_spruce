awk '
    BEGIN {
        while ((getline < "list.txt") > 0) {
            scaffolds[$1] = 1
        }
        close("list.txt")
        RS=">"
        FS="\n"
        ORS=""
    }
    {
        for (scaffold in scaffolds) {
            if (index($1, scaffold) != 0) {
                sequence = $2
                gsub("\n", "", sequence)
                print $1 "\t" length(sequence) "\n"
                break
            }
        }
    }
' WS77111-v2_1000plus_LGs.fa

