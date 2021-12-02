#!/usr/bin/awk -f

BEGIN {
    sum = 0;
    last = 999
}

{
    if(last < $0)
        ++sum;
    last = $0
}

END {
    print sum
}
