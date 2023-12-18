% Genetic Algorithm Code for ANN (1 Hidden Layer) based Input
% Update m, n, mp, Scale a1, Constraints
clc;
clear all;
m=7; % BitSize of each variable
n=2; % # of Input Variables without bias unit
mp=0.075; % Mutation Probability
w1=[struct2cell(load("w1.mat")){:}];
w2=[struct2cell(load("w2.mat")){:}];
X=round(rand(4*n,n*m)); % Initializing String
SS=0;
S=0;
NSD=0;
for i=1:(4*n)
  a1=zeros(n+1,1);
  a1(1,1)=1;
  temp=0; % Penalty if mean porosity =/ 0.95
  for j=1:n
    for k=1:m
      a1(j+1,1)=a1(j+1,1)+(2^(k-1))*X(i,((j-1)*m+k)); % String to Value
    endfor
    a1(j+1,1)=1-0.001*a1(j+1,1); % Scaling a1 between 1 and 0.873
    temp=temp+a1(j+1,1);
  endfor
  if temp>1.95 | temp<1.85 % Constraint
    Y(i)=0;
  else
    z2=w1'*a1; % Computation of output
    a2=(1+e.^(-z2)).^(-1);
    a2(1)=1;
    z3=w2'*a2;
    Y(i)=(1+e^(-z3))^(-1);
  endif
  SS=SS+(Y(i))^2;
  S=S+Y(i);
endfor
RMS=(SS/(4*n))^0.5;
for i=1:(4*n)
  NSD=NSD+ abs(1-(Y(i)/RMS)^2);
endfor
NSD=(NSD/(4*n))^0.5;
niter=0;
while NSD>(10^-4) % Loop Starts
  niter=niter+1;
  NSD=0;
  p(1)=Y(1)/S; % Reproduction Stage
  for i=2:(4*n)
    p(i)=p(i-1)+Y(i)/S;
  endfor
  for i=1:(4*n)
    temp=rand(1);
    for j=1:(4*n)
      if temp<p(j)
        temp_X(i,:)=X(j,:);
        break;
      endif
    endfor
  endfor
  for i=1:(4*n) % Crosscover Stage
    temp=round((4*n-1)*rand(1)+0.5);
    temp2=round(n*m*rand(1)+0.5);
    if temp<i
      X(i,1:temp2)=temp_X(i,1:temp2);
      X(i,temp2:(n*m))=temp_X(temp,temp2:(n*m));
    else
      X(i,1:temp2)=temp_X(i,1:temp2);
      X(i,temp2:(n*m))=temp_X((temp+1),temp2:(n*m));
    endif
  endfor
  for i=1:(4*n) % Mutation Stage
    for j=1:(n*m)
      if rand(1)<mp
        if X(i,j)==1
          X(i,j)=0;
        elseif X(i,j)==0
          X(i,j)=1;
        else
          err=err+1;
        endif
      endif
    endfor
  endfor
  S=0;
  SS=0;
  for i=1:(4*n)
  a1=zeros(n+1,1);
  a1(1,1)=1;
  temp=0; % Penalty if mean porosity =/ 0.95
  for j=1:n
    for k=1:m
      a1(j+1,1)=a1(j+1,1)+(2^(k-1))*X(i,((j-1)*m+k)); % String to Value
    endfor
    a1(j+1,1)=1-0.001*a1(j+1,1);%
    temp=temp+a1(j+1,1);
  endfor
 if temp>1.95 | temp<1.85 % Constraint
    Y(i)=0;
  else
    z2=w1'*a1; % Computation of output
    a2=(1+e.^(-z2)).^(-1);
    a2(1)=1;
    z3=w2'*a2;
    Y(i)=(1+e^(-z3))^(-1);
  endif
  SS=SS+(Y(i))^2;
  S=S+Y(i);
endfor
RMS=(SS/(4*n))^0.5;
for i=1:(4*n)
  NSD=NSD+ abs(1-(Y(i)/RMS)^2);
endfor
NSD=(NSD/(4*n))^0.5;
X;
endwhile