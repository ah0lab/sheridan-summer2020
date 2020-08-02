#!/bin/bash 
############################
# Concatentates all sql files 
# into a single script file 
# for submission
############################

if [ ! -d build/ ];then
    mkdir build
fi

out=build/Group_Project.sql

cat >$out <<HEADER
-------------------------------
-- DBAS32100 - GROUP ASSIGNMENT
--
--  ------------
--  Name        : Benjamin Ahola
--  Student ID  : 991361645
--  -------------
--  Name        :
--  Student ID  : 
--  -------------
-------------------------------

------------
-- PART A --
------------

HEADER


for file in sql/part_a/*.sql; do
    echo >> $out
    cat $file >> $out
    echo >> $out
done
cat >>$out <<HEADER

------------
-- PART B --
------------

HEADER
for file in sql/part_b/*.sql; do
    echo >> $out
    cat $file >> $out
    echo >> $out
done