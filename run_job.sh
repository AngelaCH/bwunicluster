#!/bin/bash
# Description:	Run script.
# 		This script is executed on a cluster node.
# 		You should setup and start the application you want to run on the cluster.
# Author:	Name Surname <TODO@psychologie.uni-freiburg.de>
# Date:		2014-MM-DD


# useful environment variables
#  MOAB_CLASS		Class name
#  MOAB_GROUP		Group name
#  MOAB_JOBID		Job ID
#  MOAB_JOBNAME		Job name
#  MOAB_NODECOUNT	Number of nodes allocated to job
#  MOAB_PARTITION	Partition name the job is running in
#  MOAB_PROCCOUNT	Number of processors allocated to job
#  MOAB_SUBMITDIR	Directory of job submission
#  MOAB_USER		User name

# to show all environment variables set at the cluster node, uncomment the following line:
#   printenv
# (the output is written to the standard output, and should appear in the output log file)

# load necessary modules
# module load [module]
# (list available modules using: "module avail")
# e.g.:
#   module load compiler/gnu
#   module load devel/python/3.3.3
#   module load math/matlab
#   module load math/R


# configuration
# e.g.:
#   config_program_input="data.in"
#   config_program_output="program-${MOAB_JOBID}.out"


# prepare data, setup experiments, ...
# TODO


# run program(s)
# TODO: Add the application that you want to run


# Note: The job exits when the end of this script is reached.
#       If you start several independent programs on a single cluster node,
#       you need to wait for them:
#       (This does nothing if there are no background processes left.)
wait
