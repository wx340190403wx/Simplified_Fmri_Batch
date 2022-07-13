% List of open inputs
global b
% ID={'03' '04' '05' '06' '07' '08' '09' '10' '11' '12' '13' '15' '20' '21' '22' '23' '26' '30'};
% ID = { '31' '32' '33' '34' '35' '36' '37' '38' '39' '40' '41' '42' '43' '46' '47' '48' '49' '50' '51' '53' '55' '56' '57' '58' '59' '62' '63' '65' '66' '67'};
ID={'70' '75' '81'};

for i=1:length(ID)
    b = ID{i};
nrun = 1; % enter the number of runs here
jobfile = {'D:\fmri_data_process\script\batch_sample_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(0, nrun);
for crun = 1:nrun
end
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
end