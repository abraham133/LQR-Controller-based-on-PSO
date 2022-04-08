function gbest_new = global_best_lat(p,Alat,Blat,Clat,Dlat)

[~,~,part] = size(p);


for i=1:part
    if i==1
        val = mysyslat(Alat,Blat,Clat,Dlat,p(:,1,i));
        gbest_new = p(:,1,i);
    else
        new_val = mysyslat(Alat,Blat,Clat,Dlat,p(:,1,i));
        if new_val<val
            val = new_val;
            gbest_new = p(:,1,i);
        end
    end
end
            
       

end