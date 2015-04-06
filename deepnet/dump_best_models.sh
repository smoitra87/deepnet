#!/bin/sh

start=$1
end=$2

for folder in `seq ${start} ${end}` ; do
    for exp_path in `find results/results_${folder}000/ -maxdepth 1 -type d -name "exp*" -print` ; do
        expid=`basename ${exp_path}`
        output_dir=results/results_${folder}000/${expid}/imperr_best
        
        [ ! -d ${output_dir} ] && mkdir -p ${output_dir}

        echo python choose_best_model2.py \
        --globstr results/results_${folder}000/likelihoods/${expid}_'*'_pll.pkl \
        --output_dir ${output_dir} \
        --model_dir results/results_${folder}000/${expid}/dbm_models
        python choose_best_model2.py \
        --globstr results/results_${folder}000/likelihoods/${expid}_'*'_pll.pkl \
        --output_dir ${output_dir} \
        --model_dir results/results_${folder}000/${expid}/dbm_models
    done
done
