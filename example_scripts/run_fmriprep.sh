#!/bin/bash

# List of subject IDs
subject_ids=(15 21 28 36 45 51 57 62 68 74 79 16 22 29 37 46 52 58 63 69 75 13 33 06 62)
# subject_ids=(52)

# Loop over each subject ID
for subject_id in "${subject_ids[@]}"; do
    # Run fmriprep for the current subject
    docker run -ti --rm \
        -v /home/local/PSYCH-ADS/xuqian_chen/Github/aggression/1_code/utils/license.txt:/opt/freesurfer/license.txt \
        -v /home/local/PSYCH-ADS/xuqian_chen/Projects/fmri/aggression/2_pipeline/BIDS:/data:ro \
        -v /home/local/PSYCH-ADS/xuqian_chen/YES_lab/Amber/test:/out \
        nipreps/fmriprep:latest \
        /data /out \
        participant --participant_label "${subject_id}" \
        --fs-license-file /opt/freesurfer/license.txt

done