#!/bin/bash

function main()
{
    echo "patch testing"
}


function f1()
{
    IDIR="dataset/"
    ODIR="out/"

    rm -rf $ODIR
    mkdir $ODIR

    for FOLDER in $(ls $IDIR)
    do
        echo $FOLDER
        for FILE in $(ls $IDIR$FOLDER)
        do
            if #[ $FILE == CROMU_00042 ] ||
            [ $FILE == KPRCA_00042 ] #|| [ $FILE == CROMU_00043 ] ||
            #[ $FILE == NRFIN_00004 ] || [ $FILE == EAGLE_00005 ] || [ $FILE == NRFIN_00007 ] || [ $FILE == KPRCA_00007 ]
            then
                echo $FILE
                python patch_master.py single $IDIR$FOLDER"/"$FILE stackretencryption $ODIR$FILE"_"$FOLDER"_stackretencryption"
            fi
        done
    done
}

function f2()
{
    IDIR="cgc_binaries/"
    ODIR="out_sre/"

    rm -rf $ODIR
    mkdir $ODIR

    for FILE in $(ls $IDIR) ; do
        python patch_master.py single $IDIR$FILE stackretencryption  $ODIR$FILE"_stackretencryption"
    done
}


#----------------------------------------

main

