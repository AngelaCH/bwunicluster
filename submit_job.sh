#!/bin/bash
# Description:	Submit script for job.
# 		This script submits a job to the cluster system.
# 		You should specify the resources, which are assigned to the job,
# 		and some arguments that are passed to the run script.
# Author:	Name Surname <TODO@psychologie.uni-freiburg.de>
# Date:		2014-MM-DD


# Configuration
# -> script
#  path to the run script
job_runscript="control/run_job.sh"

#  arguments to pass to the run script
#  Note: Do _not_ use spaces!
# e.g.: job_args="JOB_SEED=23,JOB_VAR1=42,JOB_VAR2=2"

#  output file
#  usually this isn't necessary, because the output is written to:
#    ~/job_uc1_${job_id}.out
#  (used to be: ~/job_uc1_${runscript_name}_${job_id}.out)
#job_output="job-out.log"

#  job name
#  usually this isn't necessary and doesn't have any benefit
#  the default job name is the name of run script
#job_name="JOB"

#  job queue classes
#  queue classes and their maximal resources:
#    develop:		max run time=30 min, #nodes=1, processors=16
#    singlenode:	max run time=3 days, #nodes=1, processors=16
#    multinode:		max run time=2 days, #nodes=8
#    verylong:		max run time=6 days, #nodes=1, processors=16
#    fat:		max run time=1 day,  #node=1 (fat node), processors=32
job_queue="develop" # please use the develop queue class when working on this script
# job_queue="singlenode"


# -> necessary resources
#   format: [#nodes]:ppn=[#processors per node]
#   e.g.: 1 node, 2 processors (per node)
res_nodes="1:ppn=2"

#   maximal running time
#   format: DD:HH:MM:SS
#   e.g.: "2:00:00:00" -> 2 days
#   should be smaller than or equal to the maximal runtime specified by the queue class
#   (Note 1: You cannot extend this time after starting the job. After that time the job is canceled.)
#   (Note 2: This seems to overrule the job queue class)
res_time="1:00:00:00"


# -> status report
#   send emails when job starts, ends, or was aborted?
#   values: "true" or "false"
mail_enable="false"
#   when shall an email be sent?
#   b=begin; e=end; a=abort
mail_when="ea"
#   recipient (optional)
#   default address is the one used to register the account
# mail_rcpt="TODO@psychologie.uni-freiburg.de"


# --- END OF CONFIGURATION ---

# build arguments
# -> optional mail
msub_arg_mail=""
if [[ ${mail_enable} == "true" ]]; then
	msub_arg_mail="-m ${mail_when}"
	if [[ -n ${mail_rcpt} ]]; then
		msub_arg_mail="${msub_arg_mail} -M ${mail_rcpt}"
	fi
fi

# -> optional job name
msub_arg_name=""
if [[ -n ${job_name} ]]; then
	msub_arg_name="-N ${job_name}"
fi

# -> optional job output file
msub_arg_output=""
if [[ -n ${job_output} ]]; then
	msub_arg_output="-o ${job_output}"
fi

# -> optional variables
msub_arg_variables=""
if [[ -n ${job_variable} ]]; then
	msub_arg_variables="-v ${job_variable}"
fi


# submit job
msub "${script_path}" \
    -l nodes=${res_nodes},walltime=${res_time} \
    -q "${job_queue}" \
    ${msub_mail_arg} \
    ${msub_arg_name} \
    ${msub_arg_output} \
    ${msub_arg_variables} 
