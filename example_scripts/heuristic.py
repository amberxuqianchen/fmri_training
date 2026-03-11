import os

def create_key(template, outtype=('nii.gz',), annotation_classes=None):
    """
    This function is used to create a key that specifies the output path and file format for a particular scan type.
    """
    if template is None or not template:
        raise ValueError('Template must be a valid format string')
    return template, outtype, annotation_classes

def infotodict(seqinfo):
    """
    This function takes the sequence information (seqinfo) as input and returns a dictionary that maps scan types to the corresponding series IDs in the input DICOM files.
    """
    # Anatomical
    t1w = create_key('sub-{subject}/anat/sub-{subject}_T1w')

    # Functional
    func = create_key('sub-{subject}/func/sub-{subject}_task-mytask_run-{item:02d}_bold')

    info = {t1w: [], func: []}

    for s in seqinfo:
        series_desc = s.series_description.lower()
        
        # Identify the anatomical scan
        if 'fspgr' in series_desc or 't1' in series_desc:
            info[t1w].append(s.series_id)
        # Identify the functional scans
        elif 'run' in series_desc:
            info[func].append(s.series_id)
        # Add more conditions to identify other types of scans, if necessary

    return info
