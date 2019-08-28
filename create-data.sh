#!/bin/bash
rm -rf data
mkdir data
num_dirs=10
dir_size=1000
k=0
for i in $(seq 0 $((num_dirs-1)))
do
    is=$(printf "%01d" $i)
    mkdir data/$is
    for j in $(seq 0 $((dir_size-1)))
    do
        ks=$(printf "%04d" $k)
        echo $ks
        msg=$(echo -n $ks | sha1sum | awk '{print $1}')
        echo $msg > data/$is/$ks
        ((k++))
    done
done
