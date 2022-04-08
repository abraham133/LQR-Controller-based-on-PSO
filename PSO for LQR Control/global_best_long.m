function gbest_new = global_best_long(p,Along,Blong,Clong,Dlong)

[~,~,part] = size(p);


for i=1:part
    if i==1
        val = mysyslong(Along,Blong,Clong,Dlong,p(:,1,i));
        gbest_new = p(:,1,i);
    else
        new_val = mysyslong(Along,Blong,Clong,Dlong,p(:,1,i));
        if new_val<val
            val = new_val;
            gbest_new = p(:,1,i);
        end
    end
end
            
       

end