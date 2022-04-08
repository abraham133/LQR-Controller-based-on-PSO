function output = mysyslong(Along,Blong,Clong,Dlong,diag)

%% lateral motion - modern control theory LQR


sys = ss(Along,Blong,Clong,Dlong);

Q = eye(6);
Q(1,1) = diag(1); 
Q(2,2) = diag(2);
Q(3,3) = diag(3); 
Q(4,4) = diag(4); 
Q(5,5) = diag(5);
Q(6,6) = diag(6);

R = diag(7);


Klqrlong = lqr(sys,Q,R);

Alqr = Along-Blong*Klqrlong;
% eig(Alqr)


sys = ss(Alqr,Blong,Clong,Dlong);


t = 0:0.01:50;

u_zero = zeros(2,length(t));
u_step = ones(2,length(t));
x0 = [0.1 ; 0.1 ; 0.1 ; 0.1 ; 1 ; 0.1];


% x = [ beta  ;    phi   ;    p     ;   r ;  psi];
[~ ,t ,x] = lsim(sys,u_step,t,x0);


%klqr (2,6)
% x'(6,time)
u = Klqrlong*transpose(x);%(2,time)

% stepinfo
J =sum(sum(x*Q*transpose(x))) - 100*sum(sum(u*R*transpose(u)));% BKx


output = J;
end


