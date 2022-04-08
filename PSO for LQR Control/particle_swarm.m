clc;
clear;

%% F16 matrice ~ 20000 ft 600 ft/sec  xcg = 0.3
% x = [Va    ;   h   ;   alpha   ; theta   ;   q    ;  power ;    beta  ;    phi   ;    p     ;   r  ;  psi]
A =[-0.0131    0.0000   21.6813  -31.6936   -0.8206    0.2280    0.0000   -0.0000   -0.0000   -0.0000   0
    -0.0000         0 -591.0404  591.0404         0         0         0    0.0000         0         0   0
    -0.0002    0.0000   -0.7485   -0.0000    0.9482   -0.0000   -0.0000         0    0.0000    0.0000   0
          0         0         0         0    1.0000         0         0         0         0         0   0
     0.0000   -0.0000   -1.4588         0   -0.8897         0   -0.0000         0         0   -0.0029   0
          0         0         0         0         0   -1.0000         0         0         0         0   0
     0.0000   -0.0000    0.0000   -0.0000   -0.0000    0.0000   -0.1967    0.0527    0.0594   -0.9941   0
          0         0         0         0         0         0         0         0    1.0000    0.0595   0
    -0.0000    0.0000    0.0000         0    0.0003         0  -19.6461         0   -2.3178    0.4926   0
    -0.0000    0.0000    0.0000         0    0.0025         0    7.5107         0   -0.0294   -0.3191   0
          0         0         0         0         0         0         0         0         0         1   0];





% u = [throttle ; elevator ; aileron ; rudder]
B = [    0     0.1094        0         0  
         0         0         0         0
         0   -0.0014         0         0
         0         0         0         0
         0   -0.1389         0         0
   34.3908         0         0         0
         0    0.0000    0.0002    0.0005
         0         0         0         0
         0         0   -0.5624    0.0983
         0         0   -0.0246   -0.0491
         0         0         0         0];



%output y = [an ; q ; alpha]
C = [    0.0033   -0.0000   14.3292    0    0.9659         0         0         0         0         0
         0         0         0         0    1.0000         0         0         0         0         0
         0         0   57.2958         0         0         0         0         0         0         0];

%output y = [Va ;   h    ;  alpha   ; theta   ;  q    ;  power ;   beta  ;    phi   ;    p     ;   r    ;   psi]
C = [    1.0000    0         0         0         0         0         0         0         0         0         0
         0    1.0000         0         0         0         0         0         0         0         0         0
         0         0   57.2958         0         0         0         0         0         0         0         0
         0         0         0   57.2958         0         0         0         0         0         0         0
         0         0         0         0   57.2958         0         0         0         0         0         0
         0         0         0         0         0         1         0         0         0         0         0
         0         0         0         0         0         0   57.2958         0         0         0         0
         0         0         0         0         0         0         0   57.2958         0         0         0
         0         0         0         0         0         0         0         0   57.2958         0         0
         0         0         0         0         0         0         0         0         0  57.2958          0 
         0         0         0         0         0         0         0         0         0         0   57.2958];

% bunu kullanacak mıyız???
D = [    0    0.0254         0         0
         0         0         0         0
         0         0         0         0];
     

D = [    0         0         0         0
         0         0         0         0
         0         0         0         0
         0         0         0         0
         0         0         0         0
         0         0         0         0
         0         0         0         0
         0         0         0         0
         0         0         0         0
         0         0         0         0
         0         0         0         0];  




Alat = A(7:11,7:11);
Blat = B(7:11,3:4);
Clat = C(7:11,7:11);
Dlat = D(7:11,3:4);

Along = A(1:6,1:6);
Blong = B(1:6,1:2);
Clong = C(1:6,1:6);
Dlong = D(1:6,1:2);



%% PSO for lateral

% % dimension of the function
% n = 6;
% 
% 
% 
% % record the global minimum point at each iteration
% global_points = zeros(n,1);
% 
% 
%  part = 5;
%     
%     
%     
%     % random initial values
%     %x(n,i,part)~n dimension, ith iteration, part is the number of the particle
%     x = zeros(n,1);
%     v = zeros(n,1);
%     for i=1:part
%         for m=1:n
%             x(m,1,i) = 4*randn + 100;
%             v(m,1,i) = randn;
%         end
%     end
%     
%     
%     % Implement Particle Swarm Optimization
%     
%     % initial parameters
%     w = 0.8;
%     c1 = 2;
%     c2 = 2;
%     
%     % the number of iteration
%     iter = 50;
%     
%     
%     % random parameters
%     r = zeros(n,1,part);
%     s = zeros(n,1,part);
%     
%     
%     % personal bests
%     p = zeros(n,1,part);
%     
%     % global bests
%     g = zeros(n,iter);
%     
%     % cost
%     cost = zeros(1,iter);
%     
%     for k=1:iter
%         k
%         for ii=1:part
%             for j=1:n
%                 r(j,k,ii) = rand;
%                 s(j,k,ii) = rand;
%             end
%         end
%         
%         % assign personal bests
%         if ~(k==1)
%             for ii=1:part
%                 p(:,k,ii) = personal_best_lat(x(:,k,ii),p(:,k-1,ii),Alat,Blat,Clat,Dlat);
%             end
%         else
%             p(:,k,:) = x(:,k,:);
%         end
%         
%         % assign global best
%         g(:,k) = global_best_lat(p(:,k,:),Alat,Blat,Clat,Dlat);
%          
%         J = mysyslat(Alat,Blat,Clat,Dlat,g(:,k))
%         cost(1,k)= J; 
% 
%         for ii=1:part
%             v(:,k+1,ii) = w.*v(:,k,ii) + c1.*r(:,k,ii).*(p(:,k,ii) - x(:,k,ii)) ...
%                 + c2.*s(:,k,ii).*(g(:,k) - x(:,k,ii));
%             
%             if v(:,k+1,ii)>=5
%                 v(:,k+1,ii)=5;
%             end
% 
%             if v(:,k+1,ii)<=-5
%                 v(:,k+1,ii)=-5;
%             end
%             
%             x(:,k+1,ii) = x(:,k,ii) + v(:,k+1,ii);
% 
%             if (sum((x(:,k+1,ii)<=0))>0)
%                 x(:,k+1,ii) = x(:,k,ii);
%             end
%         end
%         
%     end
%         
%  global_points = g;
 


%% PSO for longitudinal

% dimension of the function
n = 7;



% record the global minimum point at each iteration
global_points = zeros(n,1);

% #particle
 part = 20;
% the number of iteration
 iter = 10;    
    
    
    % random initial values
    %x(n,i,part)~n dimension, ith iteration, part is the number of the particle
    x = zeros(n,1);
    v = zeros(n,1);
    for i=1:part
        for m=1:n
            x(m,1,i) = 4*randn + 20;
            v(m,1,i) = randn;
        end
    end
    
 
    
    % Implement Particle Swarm Optimization
    
    % initial parameters
    w = 0.8;
    c1 = 2;
    c2 = 2;
    
       
    
    % random parameters
    r = zeros(n,1,part);
    s = zeros(n,1,part);
    

    
    % personal bests
    p = zeros(n,1,part);
    
    % global bests
    g = zeros(n,iter);
    
    
    for k=1:iter
        
        for ii=1:part
            for j=1:n
                r(j,k,ii) = rand;
                s(j,k,ii) = rand;
            end
        end
        
        % assign personal bests
        if ~(k==1)
            for ii=1:part
                p(:,k,ii) = personal_best_long(x(:,k,ii),p(:,k-1,ii),Along,Blong,Clong,Dlong);
            end
        else
            p(:,k,:) = x(:,k,:);
        end
        
        % assign global best
        g(:,k) = global_best_long(p(:,k,:),Along,Blong,Clong,Dlong);

        J = mysyslat(Alat,Blat,Clat,Dlat,g(:,k))
        cost(1,k)= J; 
        
        for ii=1:part

            v(:,k+1,ii) = w.*v(:,k,ii) + c1.*r(:,k,ii).*(p(:,k,ii) - x(:,k,ii)) ...
                + c2.*s(:,k,ii).*(g(:,k) - x(:,k,ii));

            x(:,k+1,ii) = x(:,k,ii) + v(:,k+1,ii);


            if (sum((x(:,k+1,ii)<=0))>0)
                x(:,k+1,ii) = x(:,k,ii);
            end
            
        end
        
    end
        
 global_points = g;
 


