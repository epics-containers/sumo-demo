#!/bin/bash
cd $(dirname $0)

sumo db list
sumo db show SSCAN

To 
get these you could use this container:

podman run -it ghcr.io/epics-containers/ioc-pmac-linux-developer:dev

# I've made some intermediate builds here that are not stricly required 
# for the container 2-level layering we could use the base2 and pmac2 build tags only
sumo build new --buildtag base    EPICS_BASE:R7-0-6-1
sumo build new --buildtag base2   EPICS_BASE:R7-0-6-1 SEQ:R2-2-9 DEVIOCSTATS:R3-1-16 
sumo build new --buildtag modules EPICS_BASE:R7-0-6-1 ASYN:R4-42 AUTOSAVE:R5-10-2 BUSY:R1-7-2 CALC:R3-7-4
sumo build new --buildtag pmac    EPICS_BASE:R7-0-6-1 ASYN:R4-42 BUSY:R1-7-2 CALC:R3-7-4 PMAC:R2-6-0b2 MOTOR:R7-2-3b1 IPAC:R2-16
sumo build new --buildtag pmac2   EPICS_BASE:R7-0-6-1 ASYN:R4-42 BUSY:R1-7-2 CALC:R3-7-4 AUTOSAVE:R5-10-2 SEQ:R2-2-9 DEVIOCSTATS:R3-1-16 PMAC:R2-6-0b2 MOTOR:R7-2-3b1 IPAC:R2-16


# now make the IOC RELEASE file - note that the modules requested will select build pmac2
sumo build use PMAC:R2-6-0b2 AUTOSAVE:R5-10-2 DEVIOCSTATS:R3-1-16 -o ioc/configure/RELEASE
cd ioc
make





# TODO trouble building  SSCAN:R2-11-5 (is this really needed by MOTOR/PMAC? - they build without it)