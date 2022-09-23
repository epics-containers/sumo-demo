#!/bin/bash
cd $(dirname $0)

sumo db list
sumo db show SSCAN

# I've made some intermediate builds here that are not stricly required 
# for the container layering we could use the base2 and pmac build tags only
sumo build new --buildtag base    BASE:R7-0-6-1
sumo build new --buildtag base2   BASE:R7-0-6-1 SEQ:R2-2-9 DEVIOCSTATS:R3-1-16 
sumo build new --buildtag modules BASE:R7-0-6-1 ASYN:R4-42 AUTOSAVE:R5-10-2 BUSY:R1-7-2 CALC:R3-7-4
sumo build new --buildtag pmac    BASE:R7-0-6-1 ASYN:R4-42 AUTOSAVE:R5-10-2 BUSY:R1-7-2 CALC:R3-7-4 SSCAN:R2-11-5 PMAC:R2-6-0b2 MOTOR:R7-2-3b1

sumo build use PMAC:R2-6-0b2 -o ioc/configure/RELEASE
