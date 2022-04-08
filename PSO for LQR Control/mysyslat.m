function output = mysyslat(Alat,Blat,Clat,Dlat,diag)

%% lateral motion - modern control theory LQR


sys = ss(Alat,Blat,Clat,Dlat);

Q = eye(5);
Q(1,1) = diag(1); 
Q(2,2) = diag(2);
Q(3,3) = diag(3); 
Q(4,4) = diag(4); 
Q(5,5) = diag(5);
R = diag(6);



Klqrlat = lqr(sys,Q,R);

Alqr = Alat-Blat*Klqrlat;
eig(Alqr);


sys = ss(Alqr,Blat,Clat,Dlat);


t = 0:0.01:50;

u_zero = zeros(2,length(t));
u_step = ones(2,length(t));
x0 = [0.1 ; 0.1 ; 0.1 ; 0.1 ; 0.1];


% x = [];
[~ ,t ,x] = lsim(sys,u_step,t,x0);



J =sum(sum(x*Q*transpose(x))) - sum(sum(u_step*R*transpose(u_step)));
output = J;

end


