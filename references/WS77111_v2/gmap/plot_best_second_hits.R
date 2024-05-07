awk '
  {
    key = $12
    if ($11 > max[key]) {
      max[key] = $11
      line[key] = $0
    }
  }
  END {
    for (k in line) {
      print line[k]
    }
  }
' multiple_mapped_cDNA.txt > forR_best_hit.txt


awk '
  {
    key = $12
    if ($11 > max[key]) {
      second_max[key] = max[key]
      max[key] = $11
    } else if ($11 > second_max[key] || second_max[key] == "" && $11 != max[key]) {
      second_max[key] = $11
    }
    line[key] = $0
  }
  END {
    for (k in line) {
      if (line[k] != "" && second_max[k] != "") {
        print line[k]
      }
    }
  }
' multiple_mapped_cDNA.txt > forR_second_best.txt
