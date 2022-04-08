function pbest_new = personal_best_lat(x,p_best_old,Alat,Blat,Clat,Dlat)


new_val = mysyslat(Alat,Blat,Clat,Dlat,x);
p_best_old_val = mysyslat(Alat,Blat,Clat,Dlat,p_best_old);

if (new_val<p_best_old_val)
    pbest_new = x;
else
    pbest_new = p_best_old;
end

end