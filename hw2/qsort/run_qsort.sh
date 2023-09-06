#!/bin/bash

executable=./qsort_futex
total_h_values=100
iterations_per_h=100

output_dir=qsort_test
if [ ! -d "$output_dir" ]; then
    mkdir "$output_dir"
fi
output_file="${output_dir}/qsort_ft_h.txt"

if [ -f "$output_file" ]; then
    rm "$output_file"
    echo "Existing $output_file deleted."
fi

for ((h=1; h<=$total_h_values; h++)); do
    echo "Running with -h$h"
    total_printf_value=0


    for ((i=1; i<=$iterations_per_h; i++)); do
        printf_value=$($executable -tv -f100 -h$h -n10000 | tail -n 1)
        total_printf_value=$(echo "$total_printf_value + $printf_value" | bc)
    done

    average_printf_value=$(echo "scale=5; $total_printf_value / $iterations_per_h" | bc)
    echo "$average_printf_value" >> "$output_file"
done