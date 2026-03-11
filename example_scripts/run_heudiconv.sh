#!/bin/bash

# Define the base directory for DICOM files and the base output directory
dicom_dir="/home/local/PSYCH-ADS/xuqian_chen/Projects/232_neuroimaging/class_experiment_data"
base_output_dir="/home/local/PSYCH-ADS/xuqian_chen/Projects/232_neuroimaging/preprocessed/BIDS"

# List of subject IDs (replace these with your actual subject IDs)
# subject_ids=(637910 761838 525497 073558 960908 871232 857395 681026 073114 683594 323206 520509 935579 625179 706019 317188 933558 754766 431127 317612)
subject_ids=(625179)

# Loop over each subject ID
for subject_id in "${subject_ids[@]}"; do
    # Run heudiconv for the current subject
    heudiconv -d "${dicom_dir}/study_*_{subject}/*" \
              -s "${subject_id}" \
              -f heuristic.py \
              -c dcm2niix \
              -b \
              -o "${base_output_dir}"
done