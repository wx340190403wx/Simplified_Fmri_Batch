%-----------------------------------------------------------------------
% Job saved on 11-Jul-2022 22:52:12 by cfg_util (rev $Rev: 6134 $)
% spm SPM - SPM12 (6225)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
%%
global b
inputpath=['D:\fmri_data_process\raw_data\' 'sub0' num2str(b)];
outputpath =['D:\fmri_data_process\result\' 'sub0' num2str(b)];

% regret_task raw data
pathname1=[inputpath '\regret_task_raw\'];
sdir1=dir([pathname1,'*.dcm']);
for i=1:length(sdir1)
    imgfile1{i,1}=[pathname1 sdir1(i).name];
end

% T1 raw data
pathnameT1=[inputpath '\T1_raw'];
sdirT1=dir([pathnameT1,'*.dcm']);
for i=1:length(sdirT1)
    imgfileT1{i,1}=[pathnameT1 sdirT1(i).name];
end

% dcm2nii
matlabbatch{1}.spm.util.import.dicom.data = imgfile1     
%%
matlabbatch{1}.spm.util.import.dicom.root = 'flat';
matlabbatch{1}.spm.util.import.dicom.outdir = {[outputpath '\Fun\']};
matlabbatch{1}.spm.util.import.dicom.protfilter = '.*';
matlabbatch{1}.spm.util.import.dicom.convopts.format = 'nii';
matlabbatch{1}.spm.util.import.dicom.convopts.icedims = 0;
%%
matlabbatch{2}.spm.util.import.dicom.data = imgfileT1
%%
matlabbatch{2}.spm.util.import.dicom.root = 'flat';
matlabbatch{2}.spm.util.import.dicom.outdir = {[outputpath '\T1\']};
matlabbatch{2}.spm.util.import.dicom.protfilter = '.*';
matlabbatch{2}.spm.util.import.dicom.convopts.format = 'nii';
matlabbatch{2}.spm.util.import.dicom.convopts.icedims = 0;
matlabbatch{3}.spm.temporal.st.scans{1}(1) = cfg_dep('DICOM Import: Converted Images', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{3}.spm.temporal.st.nslices = 32;
matlabbatch{3}.spm.temporal.st.tr = 2;
matlabbatch{3}.spm.temporal.st.ta = 1.9375;
matlabbatch{3}.spm.temporal.st.so = [2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 1 3 5 7 9 11 13 15 17 19 21 23 25 27 29 31];
matlabbatch{3}.spm.temporal.st.refslice = 32;
matlabbatch{3}.spm.temporal.st.prefix = 'a';
matlabbatch{4}.spm.spatial.realign.estwrite.data{1}(1) = cfg_dep('Slice Timing: Slice Timing Corr. Images (Sess 1)', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{1}, '.','files'));
matlabbatch{4}.spm.spatial.realign.estwrite.eoptions.quality = 0.9;
matlabbatch{4}.spm.spatial.realign.estwrite.eoptions.sep = 4;
matlabbatch{4}.spm.spatial.realign.estwrite.eoptions.fwhm = 5;
matlabbatch{4}.spm.spatial.realign.estwrite.eoptions.rtm = 1;
matlabbatch{4}.spm.spatial.realign.estwrite.eoptions.interp = 2;
matlabbatch{4}.spm.spatial.realign.estwrite.eoptions.wrap = [0 0 0];
matlabbatch{4}.spm.spatial.realign.estwrite.eoptions.weight = '';
matlabbatch{4}.spm.spatial.realign.estwrite.roptions.which = [2 1];
matlabbatch{4}.spm.spatial.realign.estwrite.roptions.interp = 4;
matlabbatch{4}.spm.spatial.realign.estwrite.roptions.wrap = [0 0 0];
matlabbatch{4}.spm.spatial.realign.estwrite.roptions.mask = 1;
matlabbatch{4}.spm.spatial.realign.estwrite.roptions.prefix = 'r';
matlabbatch{5}.spm.spatial.coreg.estwrite.ref(1) = cfg_dep('Realign: Estimate & Reslice: Mean Image', substruct('.','val', '{}',{4}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','rmean'));
matlabbatch{5}.spm.spatial.coreg.estwrite.source(1) = cfg_dep('DICOM Import: Converted Images', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{5}.spm.spatial.coreg.estwrite.other = {''};
matlabbatch{5}.spm.spatial.coreg.estwrite.eoptions.cost_fun = 'nmi';
matlabbatch{5}.spm.spatial.coreg.estwrite.eoptions.sep = [4 2];
matlabbatch{5}.spm.spatial.coreg.estwrite.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
matlabbatch{5}.spm.spatial.coreg.estwrite.eoptions.fwhm = [7 7];
matlabbatch{5}.spm.spatial.coreg.estwrite.roptions.interp = 4;
matlabbatch{5}.spm.spatial.coreg.estwrite.roptions.wrap = [0 0 0];
matlabbatch{5}.spm.spatial.coreg.estwrite.roptions.mask = 0;
matlabbatch{5}.spm.spatial.coreg.estwrite.roptions.prefix = 'r';
matlabbatch{6}.spm.spatial.preproc.channel.vols(1) = cfg_dep('DICOM Import: Converted Images', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{6}.spm.spatial.preproc.channel.biasreg = 0.001;
matlabbatch{6}.spm.spatial.preproc.channel.biasfwhm = 60;
matlabbatch{6}.spm.spatial.preproc.channel.write = [1 1];
matlabbatch{6}.spm.spatial.preproc.tissue(1).tpm = {'D:\Matlab2020\toolbox\work\spm12\tpm\TPM.nii,1'};
matlabbatch{6}.spm.spatial.preproc.tissue(1).ngaus = 1;
matlabbatch{6}.spm.spatial.preproc.tissue(1).native = [1 0];
matlabbatch{6}.spm.spatial.preproc.tissue(1).warped = [0 0];
matlabbatch{6}.spm.spatial.preproc.tissue(2).tpm = {'D:\Matlab2020\toolbox\work\spm12\tpm\TPM.nii,2'};
matlabbatch{6}.spm.spatial.preproc.tissue(2).ngaus = 1;
matlabbatch{6}.spm.spatial.preproc.tissue(2).native = [1 0];
matlabbatch{6}.spm.spatial.preproc.tissue(2).warped = [0 0];
matlabbatch{6}.spm.spatial.preproc.tissue(3).tpm = {'D:\Matlab2020\toolbox\work\spm12\tpm\TPM.nii,3'};
matlabbatch{6}.spm.spatial.preproc.tissue(3).ngaus = 2;
matlabbatch{6}.spm.spatial.preproc.tissue(3).native = [1 0];
matlabbatch{6}.spm.spatial.preproc.tissue(3).warped = [0 0];
matlabbatch{6}.spm.spatial.preproc.tissue(4).tpm = {'D:\Matlab2020\toolbox\work\spm12\tpm\TPM.nii,4'};
matlabbatch{6}.spm.spatial.preproc.tissue(4).ngaus = 3;
matlabbatch{6}.spm.spatial.preproc.tissue(4).native = [1 0];
matlabbatch{6}.spm.spatial.preproc.tissue(4).warped = [0 0];
matlabbatch{6}.spm.spatial.preproc.tissue(5).tpm = {'D:\Matlab2020\toolbox\work\spm12\tpm\TPM.nii,5'};
matlabbatch{6}.spm.spatial.preproc.tissue(5).ngaus = 4;
matlabbatch{6}.spm.spatial.preproc.tissue(5).native = [1 0];
matlabbatch{6}.spm.spatial.preproc.tissue(5).warped = [0 0];
matlabbatch{6}.spm.spatial.preproc.tissue(6).tpm = {'D:\Matlab2020\toolbox\work\spm12\tpm\TPM.nii,6'};
matlabbatch{6}.spm.spatial.preproc.tissue(6).ngaus = 2;
matlabbatch{6}.spm.spatial.preproc.tissue(6).native = [0 0];
matlabbatch{6}.spm.spatial.preproc.tissue(6).warped = [0 0];
matlabbatch{6}.spm.spatial.preproc.warp.mrf = 1;
matlabbatch{6}.spm.spatial.preproc.warp.cleanup = 1;
matlabbatch{6}.spm.spatial.preproc.warp.reg = [0 0.001 0.5 0.05 0.2];
matlabbatch{6}.spm.spatial.preproc.warp.affreg = 'eastern';
matlabbatch{6}.spm.spatial.preproc.warp.fwhm = 0;
matlabbatch{6}.spm.spatial.preproc.warp.samp = 3;
matlabbatch{6}.spm.spatial.preproc.warp.write = [1 1];
matlabbatch{7}.spm.spatial.normalise.write.subj.def(1) = cfg_dep('Segment: Forward Deformations', substruct('.','val', '{}',{6}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','fordef', '()',{':'}));
matlabbatch{7}.spm.spatial.normalise.write.subj.resample(1) = cfg_dep('Realign: Estimate & Reslice: Realigned Images (Sess 1)', substruct('.','val', '{}',{4}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{1}, '.','cfiles'));
matlabbatch{7}.spm.spatial.normalise.write.woptions.bb = [-90 -126 -72
                                                          90 90 108];
matlabbatch{7}.spm.spatial.normalise.write.woptions.vox = [2 2 2];
matlabbatch{7}.spm.spatial.normalise.write.woptions.interp = 4;
matlabbatch{8}.spm.spatial.smooth.data(1) = cfg_dep('Normalise: Write: Normalised Images (Subj 1)', substruct('.','val', '{}',{7}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('()',{1}, '.','files'));
matlabbatch{8}.spm.spatial.smooth.fwhm = [6 6 6];
matlabbatch{8}.spm.spatial.smooth.dtype = 0;
matlabbatch{8}.spm.spatial.smooth.im = 0;
matlabbatch{8}.spm.spatial.smooth.prefix = 's';
matlabbatch{9}.spm.stats.fmri_spec.dir = {'D:\fmri_data_process\result'};
matlabbatch{9}.spm.stats.fmri_spec.timing.units = 'secs';
matlabbatch{9}.spm.stats.fmri_spec.timing.RT = 2;
matlabbatch{9}.spm.stats.fmri_spec.timing.fmri_t = 16;
matlabbatch{9}.spm.stats.fmri_spec.timing.fmri_t0 = 8;
matlabbatch{9}.spm.stats.fmri_spec.sess.scans(1) = cfg_dep('Smooth: Smoothed Images', substruct('.','val', '{}',{8}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{9}.spm.stats.fmri_spec.sess.cond.name = 'event';
%% depend on the Behavioral data
matlabbatch{9}.spm.stats.fmri_spec.sess.cond.onset = [0
                                                      4
                                                      14
                                                      26
                                                      34
                                                      42
                                                      54
                                                      60
                                                      70
                                                      78
                                                      90
                                                      100
                                                      110
                                                      118
                                                      122
                                                      128
                                                      134
                                                      146
                                                      152
                                                      156
                                                      160
                                                      166
                                                      178
                                                      186
                                                      192
                                                      202
                                                      208
                                                      218
                                                      226
                                                      234
                                                      244
                                                      250
                                                      260
                                                      272
                                                      276
                                                      288
                                                      292
                                                      304
                                                      308
                                                      312
                                                      320
                                                      328
                                                      334
                                                      342
                                                      346
                                                      356
                                                      360
                                                      370
                                                      380
                                                      384
                                                      396
                                                      408
                                                      420
                                                      430
                                                      436
                                                      448
                                                      454
                                                      462
                                                      468
                                                      472];
%%
matlabbatch{9}.spm.stats.fmri_spec.sess.cond.duration = 0;
matlabbatch{9}.spm.stats.fmri_spec.sess.cond.tmod = 0;
matlabbatch{9}.spm.stats.fmri_spec.sess.cond.pmod = struct('name', {}, 'param', {}, 'poly', {});
matlabbatch{9}.spm.stats.fmri_spec.sess.cond.orth = 1;
matlabbatch{9}.spm.stats.fmri_spec.sess.multi = {''};
matlabbatch{9}.spm.stats.fmri_spec.sess.regress = struct('name', {}, 'val', {});
matlabbatch{9}.spm.stats.fmri_spec.sess.multi_reg(1) = cfg_dep('Realign: Estimate & Reslice: Realignment Param File (Sess 1)', substruct('.','val', '{}',{4}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','sess', '()',{1}, '.','rpfile'));
matlabbatch{9}.spm.stats.fmri_spec.sess.hpf = 128;
matlabbatch{9}.spm.stats.fmri_spec.fact = struct('name', {}, 'levels', {});
matlabbatch{9}.spm.stats.fmri_spec.bases.hrf.derivs = [0 0];
matlabbatch{9}.spm.stats.fmri_spec.volt = 1;
matlabbatch{9}.spm.stats.fmri_spec.global = 'None';
matlabbatch{9}.spm.stats.fmri_spec.mthresh = 0.8;
matlabbatch{9}.spm.stats.fmri_spec.mask = {''};
matlabbatch{9}.spm.stats.fmri_spec.cvi = 'AR(1)';
matlabbatch{10}.spm.stats.fmri_est.spmmat(1) = cfg_dep('fMRI model specification: SPM.mat File', substruct('.','val', '{}',{9}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{10}.spm.stats.fmri_est.write_residuals = 0;
matlabbatch{10}.spm.stats.fmri_est.method.Classical = 1;
matlabbatch{11}.spm.stats.con.spmmat(1) = cfg_dep('Model estimation: SPM.mat File', substruct('.','val', '{}',{10}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{11}.spm.stats.con.consess{1}.tcon.name = 'ON';
matlabbatch{11}.spm.stats.con.consess{1}.tcon.weights = 1;
matlabbatch{11}.spm.stats.con.consess{1}.tcon.sessrep = 'none';
matlabbatch{11}.spm.stats.con.delete = 0;
