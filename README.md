# fMRI Training

A tutorial covering fMRI data processing, from raw DICOM files to preprocessed outputs.
- Developed from Yibei Chen's workshop @ YES Lab.

## Overview

This repository contains Jupyter notebooks and example scripts for learning the fMRI preprocessing pipeline, covering two main topics:

1. **DICOM to BIDS conversion** using [Heudiconv](https://heudiconv.readthedocs.io/)
2. **fMRI preprocessing** using [fMRIPrep](https://fmriprep.org/)

## Repository Structure

```
fmri_training/
├── notebooks/
│   ├── 1_dicom2bids.ipynb   # DICOM format, BIDS structure, and Heudiconv usage
│   └── 2_fmriprep.ipynb     # fMRIPrep installation, usage, and outputs
├── example_scripts/
│   ├── heuristic.py         # Example Heudiconv heuristic file
│   ├── run_heudiconv.sh     # Batch script to run Heudiconv across subjects
│   └── run_fmriprep.sh      # Batch script to run fMRIPrep via Docker
├── data/
│   └── example_dicom/       # Example DICOM files for practice
└── fmriprep_tutorial.ipynb  # Full pipeline with explainations, still under construction
```

## Notebooks

### 1. DICOM to BIDS (`notebooks/1_dicom2bids.ipynb`)

Covers:
- What DICOM files are and how they are structured (Patient / Study / Series hierarchy)
- How to inspect DICOM image data and metadata using `pydicom`
- What BIDS is and why it matters for neuroimaging
- How to write a `heuristic.py` file for Heudiconv
- How to run Heudiconv to convert DICOMs to BIDS format

**Example Heudiconv command:**
```bash
heudiconv -d /path/to/raw_data/sub-{subject}/PA0/ST0/SE*/* \
          -s 01 \
          -f heuristic.py \
          -c dcm2niix \
          -b \
          -o /path/to/output/BIDS
```

### 2. fMRIPrep (`notebooks/2_fmriprep.ipynb`)

Covers:
- What fMRIPrep is and its benefits (BIDS compatibility, reproducibility, QC reports)
- Installation via Docker (recommended) or manual Python environment
- Running fMRIPrep on a participant
- Understanding fMRIPrep outputs (preprocessed fMRI data, transformation matrices, brain masks, HTML reports)

**Example fMRIPrep command (Docker):**
```bash
docker run -ti --rm \
    -v /path/to/BIDS:/data:ro \
    -v /path/to/output:/out \
    nipreps/fmriprep:latest \
    /data /out participant \
    --participant_label sub-01 \
    --fs-license-file /out/license.txt
```

## Prerequisites

- Python 3.10+
- [pydicom](https://github.com/pydicom/pydicom)
- [Heudiconv](https://heudiconv.readthedocs.io/)
- [Docker](https://www.docker.com/) (for running fMRIPrep)
- A valid [FreeSurfer license](https://surfer.nmr.mgh.harvard.edu/registration.html) (required by fMRIPrep)

## Getting Started

1. Clone this repository
2. Work through `notebooks/1_dicom2bids.ipynb` using the provided example DICOMs in `data/example_dicom/`
3. Once you have BIDS-formatted data, proceed to `notebooks/2_fmriprep.ipynb`
4. Adapt the batch scripts in `example_scripts/` for running on your own dataset
5. More explaination can be found at `fmriprep_tutorial.ipynb` (this file is supposed to be the final version of fmri tutorial covering the above notebooks, still working in progress)
