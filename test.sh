#!/bin/bash
> output.txt

THREADTYPES=("Platform" "Virtual")
STATEARRAYS=(5 100)
MODELS=("Null" "Synchronized")
THREADS=(1 8 40)

for model in "${MODELS[@]}"; do
    for statearray in "${STATEARRAYS[@]}"; do
        for threadtype in "${THREADTYPES[@]}"; do 
            for thread in "${THREADS[@]}"; do
                echo "Running configuration: $threadtype $statearray $model $thread" >> output.txt
                { time timeout 3600 java UnsafeMemory "$threadtype" "$statearray" "$model" "$thread" 100000000; } 2>> output.txt
                echo -e "\n-------------------\n" >> output.txt
            done
        done
    done
done