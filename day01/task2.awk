#!/usr/bin/awk -f

BEGIN {
    sum = 0;
    last = 999;
    laster = 999;
    lastest = 999;
}

{
    if(lastest < $0)
        ++sum;
    lastest = laster;
    laster = last;
    last = $0;
}

END {
    print sum;
}
