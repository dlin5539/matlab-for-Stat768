function forwardEuler(A,x0,Tmax, dt)
   n = round(Tmax/dt);
   x = zeros(2,n+1);
   x(:,1) = x0;
   for i=1:n
       x(:,i+1) = x(:,i)+dt*A*x(:,i);
   end
   ts = 0:dt:Tmax;
   figure(1)
   plot(ts, x, 'linewidth', 2)
   xlabel('Time')
   ylabel('Coordinate')
   legend('x(t)','y(t)')
   figure(2)
   plot(x(1,:),x(2,:), 'linewidth', 2)
   hold on
   scatter(x(1,1), x(2,1),80,'r','filled')
   scatter(x(1,end), x(2,end),80,'g','filled')
   hold off
   text(x(1,1), x(2,1), "Starting")
   text(x(1,end), x(2,end), "Terminal")
   title('Orbit')
   xlabel('x')
   ylabel('y')
end