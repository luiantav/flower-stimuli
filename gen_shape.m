function q = gen_shape(rho, nSpikes, R,color)

%%GEN_SHAPE is function to generate perceptually linear 'spiky' shapes parameterised by 
% spikiness parameter rho, number of spikes, and full shape radius R, as 
% defined in van Dam & Ernst (2015), PloS Comp Biol
% (https://doi.org/10.1371/journal.pcbi.1004172)
%   set 'spikiness' parameter rho using values between 0.01 and 1 [surface area is constant]
%   in vD & E, nSpikes=5, and R=12.5(mm)


%%define outer (r_o) and inner (r_i) radii based on shape param rho 
%rho = 1 is round
if rho<1 && rho>0
    r_o = R * sqrt( (2*log(rho)) / (rho^2 - 1) );     
else
    r_o = R; %if rho 1 then draw complete circle with r_o = r_i
end
r_o
if rho<0
    r_i = r_o - abs(rho*r_o)
else 
    r_i = rho*r_o;
end 
r_i    
%%draw shape based distance from centre of polar coordinates:
theta_i=1; 
theta_o=theta_i + (360/(2*nSpikes));
theta_o = round(theta_o)

for a=1:nSpikes
      
    for theta_deg = theta_i:theta_o
        
        r_deg(theta_deg) = r_i * exp( (theta_deg - theta_i)/(theta_i - theta_o) * log(r_i/r_o) );
        
    end
    
    theta_i = theta_i + (360/nSpikes);
    theta_i = round(theta_i)
    
    for theta_deg = theta_o:theta_i 
        
        r_deg(theta_deg) = r_i * exp( (theta_deg - theta_i)/(theta_i - theta_o) * log(r_i/r_o) );
        
    end
    
    theta_o=theta_o + (360/nSpikes);
    theta_o=round(theta_o)

end

theta = (1:length(r_deg)).*(pi/180);
r = r_deg.*(pi/180);

q=figure;
set(q,'Resize','off')
p=polar(theta, r);

ax=gca;
%set(ax,'Position',[0.,0,0.55,0.55])
set(ax,'Xlim',[-0.65,0.65])
set(ax,'Ylim',[-0.65,0.65])

z = findall(gcf,'type','patch');
z(q == z) = [];
delete(z);

set(p, 'Color',  [color])
j=patch(get(p,'XData'), get(p,'YData'), [color]);
set(j, 'LineStyle', 'none')

h = findall(gcf,'type','line');
h(h == q) = [];
delete(h);

t = findall(gcf,'type','text');
delete(t);


end

