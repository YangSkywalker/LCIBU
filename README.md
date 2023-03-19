# LCIBU
The MatLab code for LCIBU

1、run step
unzip LCIBU and select the LCIBU folder as the working path of matlab

2、file description
LCIBU.m -- function file （our proposed method）
               -- LCIBU can create appropriate Universum for the case of class imbalance 

UMvDA.m -- function file  （our proposed method）
                  -- UMvDA combines Universum with MvDA to extract features from multi-view data

FIBU.m, CIBU.m -- the existing methods of generating Universum 

Fig1.m, Fig2.m, Fig3.m, Fig4.m,-- correspond to Fig1, Fig2, Fig3, Fig4 in our manuscript, and contain the code to construct artifical datasets (you can run these four files directly)

DistMatrix.m, FindNNInd.m, GetEachClass.m -- auxiliary files

MFD.mat, 100Leaves.mat -- real datasets

3、author email： yxf9011@163.com
