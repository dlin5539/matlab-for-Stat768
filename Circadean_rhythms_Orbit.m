m = 3;
n = 400;
t0 = 0;
t1 = 20;
h = (t1-t0)/n;
ts = t0:h:t1;
sol = zeros(2*m, n+1);
sol(:,1) = rand(2*m,1);
c1s = 2*rand(m,1);
c2s = 2*rand(m,1);
omega1s = rand(m,1);
omega2s = rand(m,1);
Omegas = abs(omega1s - omega2s);
cs = c1s + c2s;
ks = cs./Omegas;
ks2 = ks;
ks2(1) = 0.5 + 0.4*rand();
ks2(2) = 1;
ks2(3) = 1 + rand();
cs(1:3) = Omegas(1:3).*ks2(1:3);
c1s(1:3) = c1s(1:3).*ks2(1:3)./ks(1:3);
c2s(1:3) = c2s(1:3).*ks2(1:3)./ks(1:3);
ks = ks2;
for i=1:m
    f = @(t,x) [omega1s(i)-c1s(i)*cos(2*pi*(x(2)-x(1))); omega2s(i)+c2s(i)*cos(2*pi*(x(1)-x(2)))];
    sol((2*i-1):(2*i),:) = Euler(f, sol((2*i-1):(2*i),1), t0, t1, h);
end

i = 3;

figure(i)
plot3(ts, sol((2*i-1),:),sol(2*i,:), "linewidth", 2)
xlabel("Time")
ylabel("\theta_1")
zlabel("\theta_2")
title([strcat("c_1 = ", num2str(c1s(i)), ",  c_2 = ", num2str(c2s(i)), ", \omega_1 = ", num2str(omega1s(i)), ",  \omega_2 = ", num2str(omega2s(i))), strcat("c = ", num2str(cs(i)), ", \Omega = ", num2str(Omegas(i)), ", k = ", num2str(ks(i)))])


%%
i = 1;
figure(i);
xd = 2;
h1 = plot(cos(sol((2*i-1),1))-xd, sin(sol((2*i-1),1)), 'o', 'MarkerSize' , 12, 'MarkerFaceColor', 'r');
xlim([-1.5, 1.5]);
ylim([-1.5, 1.5]);

h2 = plot(cos(sol(2*i,1))+xd, sin(sol(2*i,1)), 'o', 'MarkerSize' , 12, 'MarkerFaceColor', 'g');
xlim([-1.5, 1.5]);
ylim([-1.5, 1.5]);


% Animation loop
i=3;
r = 0.2;
m = 270;
xd = 0.25;
for j = 1:length(ts)
    plot(-xd, 0, 'ro', 'MarkerSize', m);
    daspect([1 1 1])
    hold on
    plot(xd, 0, 'go', 'MarkerSize', m);
    plot(r*cos(sol((2*i-1),j))-xd, r*sin(sol((2*i-1),j)), 'o', 'MarkerSize' , 12, 'MarkerFaceColor', 'r');
    plot(r*cos(sol(2*i,j))+xd, r*sin(sol(2*i,j)), 'o', 'MarkerSize' , 12, 'MarkerFaceColor', 'g');
    xlim([-xd-r-0.2, xd+r+0.2]);
    ylim([-1.2*r, 1.2*r]);
    text(-xd,0,"\theta_1",'Color','r')
    text(xd,0,"\theta_2", 'Color', 'g')
    title([strcat("c_1 = ", num2str(c1s(i)), ",  c_2 = ", num2str(c2s(i)), ", \omega_1 = ", num2str(omega1s(i)), ",  \omega_2 = ", num2str(omega2s(i))), strcat("c = ", num2str(cs(i)), ", \Omega = ", num2str(Omegas(i)), ", k = ", num2str(ks(i)))])
    hold off
    drawnow;
end

