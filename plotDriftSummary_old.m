function plotDriftSummary_old(plot_3D, sn, tn, track_type, rn, round_num, ...
  track_ref, err_orig, err_gf)

%%

err_type = 'rms';

%% 3D track plot
ax1 = subplot(4,5,[1,2,6,7,11,12,16,17]);
title(['tracks - ' track_type{tn} ' round ' num2str(rn)])
hold on
if plot_3D == 1
  plot3(ax1, ...
    err_orig{tn}.seq{sn}.track_fit{rn}(1, :), ...
    err_orig{tn}.seq{sn}.track_fit{rn}(2, :), ...
    err_orig{tn}.seq{sn}.track_fit{rn}(3, :), '-o')
  plot3(ax1, ...
    err_gf{tn}.seq{sn}.track_fit{rn}(1, :), ...
    err_gf{tn}.seq{sn}.track_fit{rn}(2, :), ...
    err_gf{tn}.seq{sn}.track_fit{rn}(3, :), '-x')
  plot3(ax1, ...
    track_ref(:, 2), ...
    track_ref(:, 3), ...
    track_ref(:, 4), '-*')
  axis equal
  view([5,5,5])
else
  plot(ax1, ...
    err_orig{tn}.seq{sn}.track_fit{rn}(1, :), ...
    err_orig{tn}.seq{sn}.track_fit{rn}(3, :), '-o')
  plot(ax1, ...
    err_gf{tn}.seq{sn}.track_fit{rn}(1, :), ...
    err_gf{tn}.seq{sn}.track_fit{rn}(3, :), '-x')
  plot(ax1, ...
    track_ref(:, 2), ...
    track_ref(:, 4), '-*')
  axis equal
end
legend({'orb-slam'; 'gf-orb-slam'; 'ground truth'; });

%% error trend
ax2 = subplot(4,5,[3,4]);
title(['abs transition err (m) - ' track_type{tn} ' round ' num2str(rn)])
hold on
plot(ax2, ...
  err_orig{tn}.seq{sn}.abs_drift{rn}(:, 1), ...
  err_orig{tn}.seq{sn}.abs_drift{rn}(:, 2), '-o')
plot(ax2, ...
  err_gf{tn}.seq{sn}.abs_drift{rn}(:, 1), ...
  err_gf{tn}.seq{sn}.abs_drift{rn}(:, 2), '-x')
legend({'orb-slam'; 'gf-orb-slam';});
% ylim([0 1])
ax3 = subplot(4,5,[8,9]);
title(['abs rotation err (deg) - ' track_type{tn} ' round ' num2str(rn)])
hold on
plot(ax3, ...
  err_orig{tn}.seq{sn}.abs_orient{rn}(:, 1), ...
  err_orig{tn}.seq{sn}.abs_orient{rn}(:, 2), '-o')
plot(ax3, ...
  err_gf{tn}.seq{sn}.abs_orient{rn}(:, 1), ...
  err_gf{tn}.seq{sn}.abs_orient{rn}(:, 2), '-x')
legend({'orb-slam'; 'gf-orb-slam';});
%
ax4 = subplot(4,5,[13,14]);
title(['rel transition err (m/sec) - ' track_type{tn} ' round ' num2str(rn)])
hold on
plot(ax4, ...
  err_orig{tn}.seq{sn}.rel_drift{rn}(:, 1), ...
  err_orig{tn}.seq{sn}.rel_drift{rn}(:, 2), '-o')
plot(ax4, ...
  err_gf{tn}.seq{sn}.rel_drift{rn}(:, 1), ...
  err_gf{tn}.seq{sn}.rel_drift{rn}(:, 2), '-x')
legend({'orb-slam'; 'gf-orb-slam';});
% ylim([0 0.8])
%
ax5 = subplot(4,5,[18,19]);
title(['rel rotation err (deg/sec) - ' track_type{tn} ' round ' num2str(rn)])
hold on
plot(ax5, ...
  err_orig{tn}.seq{sn}.rel_orient{rn}(:, 1), ...
  err_orig{tn}.seq{sn}.rel_orient{rn}(:, 2), '-o')
plot(ax5, ...
  err_gf{tn}.seq{sn}.rel_orient{rn}(:, 1), ...
  err_gf{tn}.seq{sn}.rel_orient{rn}(:, 2), '-x')
legend({'orb-slam'; 'gf-orb-slam';});
% ylim([0 30])

%% error box plot
% abs drift
err_box_orig = [];
for i=1:round_num
  valid_idx = ~isinf(err_orig{tn}.seq{sn}.abs_drift{i}(:, 2));
  err_arr = err_orig{tn}.seq{sn}.abs_drift{i}(valid_idx, 2);
  switch err_type
    case 'rms'
      err_sum = sqrt(sum(err_arr .* err_arr) / length(err_arr));
    case 'mean'
      err_sum = mean(err_arr);
    case 'median'
      err_sum = median(err_arr);
    case 'max'
      err_sum = max(abs(err_arr));
  end
  err_box_orig(i) = err_sum;
end
%
err_box_gf = [];
for i=1:round_num
  valid_idx = ~isinf(err_gf{tn}.seq{sn}.abs_drift{i}(:, 2));
  err_arr = err_gf{tn}.seq{sn}.abs_drift{i}(valid_idx, 2);
  switch err_type
    case 'rms'
      err_sum = sqrt(sum(err_arr .* err_arr) / length(err_arr));
    case 'mean'
      err_sum = mean(err_arr);
    case 'median'
      err_sum = median(err_arr);
    case 'max'
      err_sum = max(abs(err_arr));
  end
  err_box_gf(i) = err_sum;
end
%
ax6 = subplot(4,5,5);
title(['abs transition err (m) - ' track_type{tn}])
hold on
origin{1} = ['ORB-SLAM'];
origin{2} = ['GF'];
boxplot(ax6, [err_box_orig; err_box_gf]', origin)

% abs rotation
err_box_orig = [];
for i=1:round_num
  valid_idx = ~isinf(err_orig{tn}.seq{sn}.abs_orient{i}(:, 2));
  err_arr = err_orig{tn}.seq{sn}.abs_orient{i}(valid_idx, 2);
  switch err_type
    case 'rms'
      err_sum = sqrt(sum(err_arr .* err_arr) / length(err_arr));
    case 'mean'
      err_sum = mean(err_arr);
    case 'median'
      err_sum = median(err_arr);
    case 'max'
      err_sum = max(abs(err_arr));
  end
  err_box_orig(i) = err_sum;
end
%
err_box_gf = [];
for i=1:round_num
  valid_idx = ~isinf(err_gf{tn}.seq{sn}.abs_orient{i}(:, 2));
  err_arr = err_gf{tn}.seq{sn}.abs_orient{i}(valid_idx, 2);
  switch err_type
    case 'rms'
      err_sum = sqrt(sum(err_arr .* err_arr) / length(err_arr));
    case 'mean'
      err_sum = mean(err_arr);
    case 'median'
      err_sum = median(err_arr);
    case 'max'
      err_sum = max(abs(err_arr));
  end
  err_box_gf(i) = err_sum;
end
%
ax7 = subplot(4,5,10);
title(['abs rotation err (deg) - ' track_type{tn}])
hold on
origin{1} = ['ORB-SLAM'];
origin{2} = ['GF'];
boxplot(ax7, [err_box_orig; err_box_gf]', origin)

% rel transition
err_box_orig = [];
for i=1:round_num
  valid_idx = ~isinf(err_orig{tn}.seq{sn}.rel_drift{i}(:, 2));
  err_arr = err_orig{tn}.seq{sn}.rel_drift{i}(valid_idx, 2);
  switch err_type
    case 'rms'
      err_sum = sqrt(sum(err_arr .* err_arr) / length(err_arr));
    case 'mean'
      err_sum = mean(err_arr);
    case 'median'
      err_sum = median(err_arr);
    case 'max'
      err_sum = max(abs(err_arr));
  end
  err_box_orig(i) = err_sum;
end
%
err_box_gf = [];
for i=1:round_num
  valid_idx = ~isinf(err_gf{tn}.seq{sn}.rel_drift{i}(:, 2));
  err_arr = err_gf{tn}.seq{sn}.rel_drift{i}(valid_idx, 2);
  switch err_type
    case 'rms'
      err_sum = sqrt(sum(err_arr .* err_arr) / length(err_arr));
    case 'mean'
      err_sum = mean(err_arr);
    case 'median'
      err_sum = median(err_arr);
    case 'max'
      err_sum = max(abs(err_arr));
  end
  err_box_gf(i) = err_sum;
end
%
ax8 = subplot(4,5,15);
title(['rel transition err (m/sec) - ' track_type{tn}])
hold on
origin{1} = ['ORB-SLAM'];
origin{2} = ['GF'];
boxplot(ax8, [err_box_orig; err_box_gf]', origin)

% rel rotation
err_box_orig = [];
for i=1:round_num
  valid_idx = ~isinf(err_orig{tn}.seq{sn}.rel_orient{i}(:, 2));
  err_arr = err_orig{tn}.seq{sn}.rel_orient{i}(valid_idx, 2);
  switch err_type
    case 'rms'
      err_sum = sqrt(sum(err_arr .* err_arr) / length(err_arr));
    case 'mean'
      err_sum = mean(err_arr);
    case 'median'
      err_sum = median(err_arr);
    case 'max'
      err_sum = max(abs(err_arr));
  end
  err_box_orig(i) = err_sum;
end
%
err_box_gf = [];
for i=1:round_num
  valid_idx = ~isinf(err_gf{tn}.seq{sn}.rel_orient{i}(:, 2));
  err_arr = err_gf{tn}.seq{sn}.rel_orient{i}(valid_idx, 2);
  switch err_type
    case 'rms'
      err_sum = sqrt(sum(err_arr .* err_arr) / length(err_arr));
    case 'mean'
      err_sum = mean(err_arr);
    case 'median'
      err_sum = median(err_arr);
    case 'max'
      err_sum = max(abs(err_arr));
  end
  err_box_gf(i) = err_sum;
end
%
ax9 = subplot(4,5,20);
title(['rel rotation err (deg/sec) - ' track_type{tn}])
hold on
origin{1} = ['ORB-SLAM'];
origin{2} = ['GF'];
boxplot(ax9, [err_box_orig; err_box_gf]', origin)