#!/bin/bash
cd /scratch/hgv27681/work/pmac/sumo/

sumo db list
sumo db show SSCAN

sumo build new --buildtag base    BASE:R7-0-6-1 SEQ:R2-2-9
sumo build new --buildtag base2   BASE:R7-0-6-1 SEQ:R2-2-9 DEVIOCSTATS:R3-1-16 
sumo build new --buildtag modules BASE:R7-0-6-1 ASYN:R4-42 AUTOSAVE:R5-10-2 BUSY:R1-7-2 CALC:R3-7-4
sumo build new --buildtag pmac    BASE:R7-0-6-1 ASYN:R4-42 AUTOSAVE:R5-10-2 BUSY:R1-7-2 CALC:R3-7-4 SSCAN:R2-11-5 PMAC:R2-6-0b2 MOTOR:R7-2-3b1
