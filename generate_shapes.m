%% 
clear
clc
%%
addpath("/Users/verra/Documents/shape_exp/Test") %adapt to your path. 

% we created 200 stimuli x condition (where condition = color of the flower)

%rho = 0.005; %step size (how different stimuli are from each other, expressed by rho)

%rho = 20; %step size (how different stimuli are from each other, expressed by rho)
%cs_plus = 0.5; % central cs + 


%% small ones first
ns = [5] %number of spikes of the flower (we played around with this, 5 looks best and discriminability is also better) 

%set color of the flower 
colors_rgb = [142   152   255; 0   198   255; 0   206   195; 122   189    51; 255   140    62; 255    95   192; 0 0 0]/255

z = -1:0.05:-0.01

for i = 1: length(ns)
    for r=1:length(z)
        ii = ns(i)
        rr = z(r)
        gen_shape(rr, ii, 12.5,colors_rgb(7,:) )
        
        fname = sprintf('F%d_S%d.png', r,ii);
        set(gcf, 'InvertHardCopy', 'off'); 
        set(gcf, 'PaperPosition', [0 0 10 10],'Color',[211/255 211/255 211/255]);
        
        saveas(gcf,sprintf('F%d_S%d.png', r,22))
        if r == 50
           savefig(sprintf('F%d_S%d.fig', r, 22))
        end
            
    end 
end

close all

%% big ones second

z = 0.01:0.05:1
for i = 1: length(ns)
    for r=1:length(z)
        ii = ns(i)
        rr = z(r)
        gen_shape(rr, ii, 12.5,colors_rgb(7,:) )
        
        fname = sprintf('F%d_S%d.png', r,ii);
        set(gcf, 'InvertHardCopy', 'off'); 
        set(gcf, 'PaperPosition', [0 0 10 10],'Color',[211/255 211/255 211/255]);
        
        saveas(gcf,sprintf('F%d_S%d.png', 399-r,22))
        if r == 50
           savefig(sprintf('F%d_S%d.fig', 399-r, 22))
        end
            
    end 
end

close all
