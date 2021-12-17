function Rand_Phase_Per()
  while 1
      disp("Input the type: 1: Saddle Point; 2: Center; 3: Stable Node; 4: Unstable Node; 5: Stable Spiral;");
      type = input("6: Unstable Spiral; 7: Star; 8: Degenerate Node:");
      names = ["Saddle Point","Center","Stable Node","Unstable Node","Stable Spiral","Unstable Spiral","Star","Degenerate Node"];
      alpha = rand();
      gamma = rand();
      A= zeros(2,2);
      if type == 1
          A(1,1) = 0.5+1*1.5;
          A(2,2) = -0.5-1*1.5;
          while (2 + alpha) * (-2 + gamma) >= 0
              alpha = rand();
              gamma = rand();
          end
      elseif type == 2   
          A(1,2) = 4*1-2;
          A(2,1) = -A(1,2);  
          while (alpha + gamma ~= 0) || (alpha * gamma + 4 <= 0)
              alpha = rand();
              gamma = -alpha;
          end
      elseif type == 3  
          A(1,1) = -0.5-1*1.5;
          A(2,2) = -0.5-1*1.5-2;  
          while (alpha + gamma - 6 >= 0) || ((alpha - 2) * (gamma - 4) <= 0) || ((alpha + gamma - 6)^2 - 4 * (alpha - 2) * (gamma - 4) <= 0)
              alpha = rand();
              gamma = rand();
          end
      elseif type == 4
          A(1,1) = 0.5+1*1.5;
          A(2,2) = 0.5+1*1.5+2;
          while (alpha + gamma + 6 <= 0) || ((alpha + 2) * (gamma + 4) <= 0) || ((alpha + gamma + 6)^2 - 4 * (alpha + 2) * (gamma + 4) <= 0)
              alpha = rand();
              gamma = rand();
          end
      elseif type == 5      
          A(1,2) = 4*1-2;
          A(2,1) = -A(1,2);
          A(1,1) = -0.5-1*1.5;
          A(2,2) = A(1,1);
          while (alpha + gamma - 4 >= 0) || ((alpha - 2) * (gamma - 2) + 4 <= 0) || ((alpha + gamma - 4)^2 - 4 * ((alpha - 2) * (gamma - 2) + 4) >= 0)
              alpha = rand();
              gamma = rand();
          end
      elseif type == 6
          A(1,2) = 4*1-2;
          A(2,1) = -A(1,2);
          A(1,1) = 0.5+1*1.5;
          A(2,2) = A(1,1);
          while (alpha + gamma + 4 <= 0) || ((alpha + 2) * (gamma + 2) + 4 <= 0) || ((alpha + gamma + 4)^2 - 4 * ((alpha + 2) * (gamma + 2) + 4) >= 0)
              alpha = rand();
              gamma = rand();
          end
      elseif type == 7
          A(1,1) = 4*1-2;
          A(2,2) = A(1,1);
          if ((2 + alpha) * (2 + gamma) >= 0) || ((alpha + gamma + 4)^2 + 4 * (alpha + 2) * (gamma + 2) ~= 0)
              while (2 + alpha) * (2 + gamma) >= 0
                  alpha = rand();
                  syms x
                  gamma = double(solve((alpha + x + 4)^2 + 4 * (alpha + 2) * (x + 2) == 0,x));
                  gamma = gamma(2);
              end
          end
      elseif type == 8
          A(1,1) = 4*1-2;
          A(2,2) = 0;
          if (2 + alpha) * gamma ~= 0
              alpha = rand();
              syms x
              gamma = double(solve((2 + alpha) * x == 0,x));  
          end
      else
          disp("Wrong Type. The type should be one of 1~8.");
          return;     
      end
      dA = [alpha,0;0,gamma];
      B = A;
      A = A + dA;
      [x,y] = meshgrid(-1:.1:1,-1:.1:1);
      px = B(1,1)*x+B(1,2)*y;
      py = B(2,1)*x+B(2,2)*y;
      px2 = A(1,1)*x+A(1,2)*y;
      py2 = A(2,1)*x+A(2,2)*y;
      quiver(x,y,px,py,"g")
      hold on
      quiver(x,y,px2,py2,"r")
      hold off
      xlim([-1,1.2])
      ylim([-1,1.3])
      xlabel("x")
      ylabel("y")
      text(-0.4,1.2,strcat("|",num2str(round(B(1,:),3)),"|"))
      text(-0.4,1.1,strcat("|",num2str(round(B(2,:),3)),"|"))
      text(-0.45,1.15,"A=")
      text(0.4,1.2,strcat("|",num2str(round(dA(1,:),3)),"|"))
      text(0.4,1.1,strcat("|",num2str(round(dA(2,:),3)),"|"))
      text(0.3,1.15,"\delta A=")
      title(names(type))
      legend("Original","Perturbated","location","northwest")
  end
end