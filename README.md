# MRI_QC_GUI v1
#### a simple visual check for nii files (it actually calls xjview function)

## how to use:
### 1. make a score varible (see score.mat as an example)
The first column is the subid (same with the directory)

The second column is the qc score. 0,1,2 (This will generate after you click confirm)

### 2. specify the data directory.
It assumes you save the mask.nii/spmT_0001.nii file in such pattern
data_path (you specified in the box)\subid (you specified in the score varible\ mask.nii or spmT_0001.nii

### 3. add xjview in matlab path

### 4. set start number and click start

### 5. view the image in the xjview gui and select the score (0,1,2)

### 6. click confirm, the score will be saved automatically

The original GUI was developed in 2016.
The GUI will be improved in the future if I have a chance. 

Zhipeng
