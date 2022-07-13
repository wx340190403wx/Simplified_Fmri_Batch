% List of open inputs
global b
% ID list
ID={'00'};

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
