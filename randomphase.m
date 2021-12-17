function randomphase()
  disp("Input the type: 1: Saddle Point; 2: Center; 3: Stable Node; 4: Unstable Node; 5: Stable Spiral;");
  type = input("6: Unstable Spiral; 7: Star; 8: Degenerate Node:");
  names = ["Saddle Point","Center","Stable Node","Unstable Node","Stable Spiral","Unstable Spiral","Star","Degenerate Node"];
  A= zeros(2,2);
  if type == 1
      A(1,1) = 0.5+rand()*1.5;
      A(2,2) = -0.5-rand()*1.5;
  elseif type == 2
      A(1,2) = 4*rand()-2;
      A(2,1) = -A(1,2);      
  elseif type == 3
      A(1,1) = -0.5-rand()*1.5;
      A(2,2) = -0.5-rand()*1.5;     
  elseif type == 4
      A(1,1) = 0.5+rand()*1.5;
      A(2,2) = 0.5+rand()*1.5;
  elseif type == 5
      A(1,2) = 4*rand()-2;
      A(2,1) = -A(1,2);
      A(1,1) = -0.5-rand()*1.5;
      A(2,2) = A(1,1);        
  elseif type == 6
      A(1,2) = 4*rand()-2;
      A(2,1) = -A(1,2);
      A(1,1) = 0.5+rand()*1.5;
      A(2,2) = A(1,1);  
  elseif type == 7
      A(1,1) = 4*rand()-2;
      A(2,2) = A(1,1);
  elseif type == 8
      A(1,1) = 4*rand()-2;
      A(2,2) = 0;
  else
      disp("Wrong Type. The type should be one of 1~8.");
      return;     
  end
  P = 2*rand(2)-1;
  A = (P\A)*P;
  [x,y] = meshgrid(-1:.1:1,-1:.1:1);
  px = A(1,1)*x+A(1,2)*y;
  py = A(2,1)*x+A(2,2)*y;
  quiver(x,y,px,py)
  xlabel("x")
  ylabel("y")
  title(names(type))  
end