function pbest_new = personal_best_long(x,p_best_old,Along,Blong,Clong,Dlong)


new_val = mysyslong(Along,Blong,Clong,Dlong,x);
p_best_old_val = mysyslong(Along,Blong,Clong,Dlong,p_best_old);

if (new_val<p_best_old_val)
    pbest_new = x;
else
    pbest_new = p_best_old;
end

end