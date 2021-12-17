function sol = Euler(f, x0, t0, t1, h)
   ts = t0:h:t1;
   n = length(ts);
   m = length(x0);
   sol = zeros(m,n);
   sol(:,1) = x0;
   for i=1:(n-1)
      sol(:,i+1) = sol(:,i) + h*f(ts(i),sol(:,i)); 
   end  
end