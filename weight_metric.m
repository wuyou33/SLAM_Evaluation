clear all

weight = [
  182;
  150;
  132;
  99;
  111;
  143;
  84;
  105;
  112;
  115;
  115;
  ]' ;


metric = [ 0.0055 0.0067 0.0158 0.0470 0.0283 0.0107 0.0239 NaN NaN NaN NaN ]
% metric = [ 0.0416 0.0522 0.0399 4.485 2.098 1.249 1.059 3.594 NaN 4.814 NaN ]
% metric = [ 1.298 0.622 1.867 4.434 2.582 1.120 0.818 3.591 NaN 5.665 NaN ] 
% metric = [   1.229  0.447  1.724 4.333 1.831 1.052 1.065  2.846  NaN 4.531 NaN ]
% metric = [   1.339  0.563  1.787 4.385 1.631 1.195 1.117  3.398 NaN  5.070 NaN ]

% metric = [ 4.394 3.268 5.336 4.093 4.196 2.586 0.875 1.722 2.701 2.488 5.546 ]
% metric = [   4.356  3.493  5.295 4.059 3.924 2.544 0.870  1.829  2.701 2.379 4.889 ]
% metric = [ 4.343 3.491 5.376 4.257 4.031 2.540 0.880 1.760 2.559 2.277 5.264 ]
% metric = [   4.537  3.421  5.440 4.074 4.094 2.608 0.899  1.854  2.582 2.346 4.724 ]

% metric = [ 0.026 0.022 0.055 0.316 0.242 0.047 0.056 0.308 NaN 0.194 NaN ]

% metric = [ 0.024439 0.026778 0.049016 0.19906 0.14681 0.044201 0.061619 0.12888 NaN 0.09692 NaN ]
% metric = [ 0.022602 0.026238 0.048247 0.18878 0.12196 0.043238 0.060161 0.13746 NaN 0.093918 NaN ]

% metric = [ 0.26094 1.4325 0.64115 2.1178 2.3354 0.64933 1.6826 5.0652 NaN 2.6801 NaN ]
% metric = [ 0.24801 1.2921 0.61241 2.0621 2.2657 0.58631 1.4496 4.8312 NaN 2.6016 NaN ]

% metric = [ 0.024439 0.026778 0.049016 0.19906 0.14681 0.044201 0.061619 0.12888 NaN 0.09692 NaN ]
% metric = [ 0.022559 0.026957 0.048911 0.17292 0.1091 0.043474 0.057041 0.13329 NaN 0.10473 NaN ]

% metric = [ 0.26094 1.4325 0.64115 2.1178 2.3354 0.64933 1.6826 5.0652 NaN 2.6801 NaN ]
% metric = [ 0.23299 1.4666 0.59402 1.983 2.3129 0.59959 1.4189 5.1605 NaN 3.0123 NaN ]

% metric = [ 0.024439 0.026778 0.049016 0.19906 0.14681 0.044201 0.061619 0.12888 NaN 0.09692 NaN ]
% metric = [ 0.022732 0.027775 0.048412 0.20031 0.11264 0.043211 0.05719 0.13966 NaN 0.088672 NaN ]

% metric = [ 0.26094 1.4325 0.64115 2.1178 2.3354 0.64933 1.6826 5.0652 NaN 2.6801 NaN ]
% metric = [ 0.23894 1.5075 0.63216 2.1027 2.2758 0.62374 1.4985 5.0193 NaN 2.7535 NaN ]

% metric = [ 0.16568 0.50734 0.49893 0.61399 0.48489 0.69096 0.79189 NaN 0.86493 1.2015 NaN ]
% metric = [ 0.15884 NaN 0.48985 0.6107 0.46995 0.69857 0.80746 NaN 1.0428 1.1838 NaN ]

% metric = [ 0.33665 1.2993 0.7264 2.0769 2.3725 0.79072 2.1283 8.925 3.607 6.4606 16.7031 ]
% metric = [0.33424 1.3964 0.71635 2.069 2.4128 0.8059 2.1932 8.9371 3.6029 6.4315 16.3874]
% metric = [ 0.18313 0.20434 0.56988 0.70418 0.59182 0.84133 0.94442 2.2224 0.81669 1.3946 7.9262 ]
% metric = [ 0.17867 0.19377 0.57554 0.70189 0.58307 0.82521 0.94939 2.1555 0.81527 1.3245 7.849 ]

% metric = [0.024954 0.027656 0.051155 0.23305 0.21852 0.043744 0.076503 0.19598 0.04697 0.1346 0.58997]
% metric = [ 0.023227 0.028109 0.049259 0.22441 0.23491 0.043928 0.074115 0.2013 0.050972 0.13279 0.58238]
% metric = [0.022342 0.018023 0.038481 0.11528 0.079364 0.049068 0.045068 0.089112 0.026727 0.07004 0.28564]
% metric = [0.021938 0.017945 0.038865 0.11553 0.077401 0.048693 0.044816 0.090062 0.026608 0.066305 0.28191]
% metric = [0.037163 0.038549 0.060286 0.15583 0.17177 0.080621 0.12484 0.61979 0.035269 0.16635 0.36908]
% metric = [6.8661 7.2658 0.94321 7.2978 7.5052 1.9973 8.8297 25.1305 1.0763 11.228 17.9401]

% metric = [ 0.037 0.039 0.060 0.156 0.172 0.081 0.125 NaN 0.035 NaN NaN ]
% metric = [ 6.866 7.266 0.943 7.298 7.505 1.997 8.830 NaN 1.076 NaN NaN ]

% metric = [ 0.023 0.027 0.049 0.171 0.109 0.043 0.057 0.133 NaN 0.105 NaN ]
% metric = [ 0.023 0.028 0.048 0.193 0.113 0.043 0.057 0.140 NaN 0.089 NaN ]
% metric = [ 0.022 0.018 0.038 0.115 0.076 0.049 0.046 0.088 0.027 0.070 0.266 ]
% metric = [ 0.022 0.018 0.038 0.114 0.075 0.049 0.046 0.087 0.026 0.069 0.276 ]

% metric = [0.233 1.467 0.594 1.983 2.313 0.600 1.419 5.171 NaN 3.012 NaN]
% metric = [ 0.239 1.508 0.632 2.103 2.276 0.624 1.498 5.019 NaN 2.754 NaN ]
% metric = [0.176 0.192 0.578 0.702 0.563 0.842 0.961 2.170 0.804 1.364 7.675]
% metric = [ 0.176 0.192 0.582 0.702 0.572 0.864 0.982 2.206 0.812 1.364 7.605 ]


% weight = [
%   182;
%   150;
%   132;
%   99;
%   111;
%   143;
%   112;
%   115;
%   ]' ;

% metric = [ 0.0416 0.0522 0.0399 0.0641 0.0697 0.0423 ]
% metric = [ 0.0213 1.8963 0.0255 0.5659 0.0568 0.0453 0.2147 0.6422 ]
% metric = [ 0.0697 0.5201 0.2762 0.2056 0.1751 0.4592 0.2205 0.6243 ]
% metric = [ 0.0089 0.0207 0.0328 0.0408 0.0246 0.0375 0.0094 0.0549 ]


vld_idx = ~isnan(metric)

avg_metric_weighted = sum( weight(vld_idx) .* metric(vld_idx) ) / sum( weight(vld_idx) )