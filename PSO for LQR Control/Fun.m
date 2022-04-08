function output = Fun(x)

output =3*(1-x(1))^2*exp(-x(1)^2-(x(2)+1)^2)-10*(0.2*x(1)-x(1)^3-x(2)^5)...
    *exp(-x(1)^2-x(2)^2)-exp(-(x(1)+1)^2-x(2)^2)/3;
end