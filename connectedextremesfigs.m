%Figures (diagrams) for Connected Extremes Perspective, Raymond et al. 2020

figloc='~/Library/Mobile Documents/com~apple~CloudDocs/General_Academics/Research/Correlated_Extremes_Perspective/';

makefig2=0;
makefig3=1;

if makefig2==1
    fid=fopen('figure2data.txt');

    linec=1;
    tline=fgetl(fid);newtline=strrep(tline,',','');
    while ischar(tline)
        %disp(newtline);disp(str2num(newtline));

        colofnewarray=rem(linec,5);if colofnewarray==0;colofnewarray=5;end
        rowofnewarray=round2(linec/5,1,'ceil');
        newarray(rowofnewarray,colofnewarray)=str2num(newtline);

        linec=linec+1;
        tline=fgetl(fid);newtline=strrep(tline,',','');
    end
    fclose(fid);


    figure(201);clf;hold on;curpart=1;highqualityfiguresetup;
    plot(newarray(:,1),newarray(:,2)./10^9,'color','#75f58b','linewidth',2); %TC
    plot(newarray(:,1),newarray(:,3)./10^9,'color','#4cb1e0','linewidth',2); %flooding
    plot(newarray(:,1),newarray(:,4)./10^9,'color','#f2690e','linewidth',2); %drought
    plot(newarray(:,1),newarray(:,5)./10^9,'color','#990b04','linewidth',2); %wildfire
    xlim([1980 2018]);
    set(gca,'fontsize',15,'fontname','arial','fontweight','bold');
    ylabel('Estimated Economic Losses (Billions, 2019 USD)','fontsize',18,'fontname','arial','fontweight','bold');
    xlabel('Year','fontsize',18,'fontname','arial','fontweight','bold');


    %Add annotations as described in the comments below
    x=[2015 2017];y=[330 322];[xaf,yaf]=ds2nfu(x,y);
    a=annotation('textarrow',xaf,yaf,'string',{'\fontsize{13}Hurricanes Harvey, Maria, and Irma\fontsize{11}',...
        '{\ittemporal compounding, concurrence}','{\iturbanization, resource allocations}'});
    set(a,'fontweight','bold','fontname','arial','horizontalAlignment','left');a.LineWidth=1.5;

    x=[2003 2005];y=[265 253];[xaf,yaf]=ds2nfu(x,y);
    a=annotation('textarrow',xaf,yaf,'string',{'\fontsize{13}Hurricanes Katrina, Wilma, and Rita\fontsize{11}',...
        '{\ittemporal compounding, concurrence}','{\itlevee failures}'});
    set(a,'fontsize',10,'fontweight','bold','fontname','arial','horizontalAlignment','left');a.LineWidth=1.5;

    x=[2002.5 2009.8];y=[140 134];[xaf,yaf]=ds2nfu(x,y);
    a=annotation('textarrow',xaf,yaf,'string',{'\fontsize{13}Pakistan\fontsize{11}','{\ittemporal compounding}','{\itwater, power, & road failures}',...
        '\fontsize{13}China\fontsize{11}','{\ittemporal compounding}','{\itdeforestation}'});
    set(a,'fontsize',10,'fontweight','bold','fontname','arial','horizontalAlignment','left');a.LineWidth=1.5;

    x=[2011 2011];y=[170 124];[xaf,yaf]=ds2nfu(x,y);
    a=annotation('textarrow',xaf,yaf,'string',{'\fontsize{13}Thailand\fontsize{11}','{\ittemporal compounding}','{\itgroundwater extraction causing subsidence}'});
    set(a,'fontsize',10,'fontweight','bold','fontname','arial','horizontalAlignment','left');a.LineWidth=1.5;

    x=[1988 1988];y=[90 60];[xaf,yaf]=ds2nfu(x,y);
    a=annotation('textarrow',xaf,yaf,'string',{'\fontsize{13}Central North America\fontsize{11}','{\itspatial compounding, concurrent heat waves}',...
        '{\itgroundwater depletion}'});
    set(a,'fontsize',10,'fontweight','bold','fontname','arial','horizontalAlignment','left');a.LineWidth=1.5;

    x=[2018.3 2017.1];y=[70 29];[xaf,yaf]=ds2nfu(x,y);
    a=annotation('textarrow',xaf,yaf,'string',{'\fontsize{13}California\fontsize{11}','{\itpreconditioning}',...
        '{\itelectrical ignitions}'});
    set(a,'fontsize',10,'fontweight','bold','fontname','arial','horizontalAlignment','left');a.LineWidth=1.5;

    figname='figure2';width=16;curpart=2;highqualityfiguresetup;

    %TCs
    %2017 -- Hurricanes Harvey, Maria, and Irma (physical: temporal compounding, concurrence; societal: urbanization, resource allocations)
    %2005 -- Hurricanes Katrina, Wilma, and Rita (physical: temporal compounding, concurrence; societal: levee failures)

    %Floods
    %2010 -- Pakistan (physical: temporal compounding; societal: water, power, & road failures), China (physical: temporal compounding; societal: deforestation)
    %2011 -- Thailand (physical: temporal compounding; societal: groundwater extraction leading to land subsidence)

    %Drought
    %1988 -- Central North America (physical: spatial compounding, concurrent heat waves; societal: groundwater depletion)

    %Fire
    %2017 -- California wildfires (physical: preconditioning; societal: electrical-grid fire ignitions)

    %Figure 2. Snapshot of destruction caused by connected extremes.
    %Annotations indicate largest events contributing to category total,
    %followed by several of the (first row) physical and (second row) societal drivers that shaped the total impacts. 
    %Insured-loss data from Aon Catastrophe Insight Division.
end


%Figure III: Conceptual illustration of conditional drivers, joint drivers,
%compounding in time (sequential), compounding in space (concurrent)
if makefig3==1
    figure(3);clf;curpart=1;highqualityfiguresetup;hold on;

    x=[1;2;3;4;5];
    y=[1;2;3;4;5];
    plot(x,y,'color',colors('ghost white'));
    xticks([1 2 3 4 5]);
    yticks([1 2 3 4 5]);
    xticklabels({'1 km','10 km','100 km','1000 km','Global'});
    yticklabels({'1 day','1 week','1 month','1 year','1 decade'});
    set(gca,'fontsize',16,'fontweight','bold','fontname','arial');
    xlabel('Spatial Scale','fontsize',24,'fontweight','bold','fontname','arial');
    ylabel('Temporal Scale','fontsize',24,'fontweight','bold','fontname','arial');
    
    %Event space for pluvial+fluvial flooding
    a=1.25; % horizontal radius
    b=0.5; % vertical radius
    x0=3; % x0,y0 ellipse centre coordinates
    y0=1.25;
    t=-pi:0.01:pi;
    x_patch2=x0+a*cos(t);
    y_patch2=y0+b*sin(t);
    f=fill(x_patch2,y_patch2,'b');alpha(f,0.2);
    
    %Event space for multi-breadbasket failure
    %a=0.5; % horizontal radius
    %b=0.5; % vertical radius
    %x0=4.5; % x0,y0 ellipse centre coordinates
    %y0=4.5;
    %t=-pi:0.01:pi;
    x_event2=[4;5;5;4];
    y_event2=[5;5;4;4];
    %f=fill(x_patch3,y_patch3,colors('very pale blue'));
    f=fill(x_event2,y_event2,'b');alpha(f,0.2);
    
    %Decision space for actor #1
    a=0.5; % horizontal radius
    b=1; % vertical radius
    x0=2; % x0,y0 ellipse centre coordinates
    y0=2.5;
    t=-pi:0.01:pi;
    x_patch1=x0+a*cos(t);
    y_patch1=y0+b*sin(t);
    f=fill(x_patch1,y_patch1,'g');alpha(f,0.2);
    
    %Decision space for actor #2, with 'cutout' for event 2
    x_actor2=[2;4;4;5;5;4;3;2];
    y_actor2=[5;5;4;4;2.5;3.33;4.16;5];
    f=fill(x_actor2,y_actor2,'g');alpha(f,0.2);
   
    
    %Labels
    text(4.2,4.6,{'Multiple','Breadbasket','Failure'},'fontsize',18,'fontweight','bold','fontname','arial','fontangle','italic');
    text(2.4,1.3,{'Pluvial+Fluvial Flooding'},'fontsize',18,'fontweight','bold','fontname','arial','fontangle','italic');
    text(1.6,2.5,{'Decision Space','Actor 1'},'fontsize',18,'fontweight','bold','fontname','arial','fontangle','italic');
    text(3.1,4.3,{'Decision Space','Actor 2'},'fontsize',18,'fontweight','bold','fontname','arial','fontangle','italic');
    
    %Meters indicating each actor's relative characteristics
    %Meter 1, actor 1
    a=0.04;b=0.3;
    x0=1.2;y0=4;
    t=-pi:0.01:pi;
    x_patch1=x0+a*cos(t);y_patch1=y0+b*sin(t);
    f=fill(x_patch1,y_patch1,colors('ghost white'),'linewidth',2);alpha(f,0.2);
    x_meterfill=[f.Vertices(1:end/2,1);f.Vertices(2,1)];
    y_meterfill=[f.Vertices(1:end/2,2);f.Vertices(2,2)];
    f2=fill(x_meterfill,y_meterfill,colors('gray'),'linewidth',2);alpha(f2,0.8);
    
    %Meter 2, actor 1
    %If more than half full, need to change the limits of t
    a=0.04;b=0.3;
    x0=1.3;y0=4;
    t=pi/2:0.01:5*pi/2;
    x_patch1=x0+a*cos(t);y_patch1=y0+b*sin(t);
    f=fill(x_patch1,y_patch1,colors('ghost white'),'linewidth',2);alpha(f,0.2);
    sz=size(f.Vertices,1);
    x_meterfill=[f.Vertices(1*end/8:7*end/8,1);f.Vertices(round(7*sz/8),1)];
    y_meterfill=[f.Vertices(1*end/8:7*end/8,2);f.Vertices(round(7*sz/8),2)];
    f2=fill(x_meterfill,y_meterfill,colors('gray'),'linewidth',2);alpha(f2,0.8);
    
    %Meter 3, actor 1
    a=0.04;b=0.3;
    x0=1.4;y0=4;
    t=-pi:0.01:pi;
    x_patch1=x0+a*cos(t);y_patch1=y0+b*sin(t);
    f=fill(x_patch1,y_patch1,colors('ghost white'),'linewidth',2);alpha(f,0.2);
    sz=size(f.Vertices,1);
    x_meterfill=[f.Vertices(1*end/8:3*end/8,1);f.Vertices(round(1*sz/8),1)];
    y_meterfill=[f.Vertices(1*end/8:3*end/8,2);f.Vertices(round(3*sz/8),2)];
    f2=fill(x_meterfill,y_meterfill,colors('gray'),'linewidth',2);alpha(f2,0.8);
    
    text(1.13,4.5,'Actor 1','fontsize',16,'fontweight','bold','fontname','arial');
    text(1.17,3.6,'T','fontsize',16,'fontweight','bold','fontname','arial');
    text(1.27,3.6,'K','fontsize',16,'fontweight','bold','fontname','arial');
    text(1.37,3.6,'S','fontsize',16,'fontweight','bold','fontname','arial');
    
    %Meters indicating each actor's relative characteristics
    %Meter 1, actor 2
    a=0.04;b=0.3;
    x0=1.7;y0=4;
    t=-pi:0.01:pi;
    x_patch1=x0+a*cos(t);y_patch1=y0+b*sin(t);
    f=fill(x_patch1,y_patch1,colors('gray'),'linewidth',2);alpha(f,0.8);
    
    %Meter 2, actor 2
    a=0.04;b=0.3;
    x0=1.8;y0=4;
    t=-pi:0.01:pi;
    x_patch1=x0+a*cos(t);y_patch1=y0+b*sin(t);
    f=fill(x_patch1,y_patch1,colors('ghost white'),'linewidth',2);alpha(f,0.2);
    x_meterfill=[f.Vertices(1*end/8:3*end/8,1);f.Vertices(round(1*sz/8),1)];
    y_meterfill=[f.Vertices(1*end/8:3*end/8,2);f.Vertices(round(3*sz/8),2)];
    f2=fill(x_meterfill,y_meterfill,colors('gray'),'linewidth',2);alpha(f2,0.8);
    
    %Meter 3, actor 2
    a=0.04;b=0.3;
    x0=1.9;y0=4;
    t=-pi:0.01:pi;
    x_patch1=x0+a*cos(t);y_patch1=y0+b*sin(t);
    f=fill(x_patch1,y_patch1,colors('gray'),'linewidth',2);alpha(f,0.8);
    
    text(1.63,4.5,'Actor 2','fontsize',16,'fontweight','bold','fontname','arial');
    text(1.67,3.6,'T','fontsize',16,'fontweight','bold','fontname','arial');
    text(1.77,3.6,'K','fontsize',16,'fontweight','bold','fontname','arial');
    text(1.87,3.6,'S','fontsize',16,'fontweight','bold','fontname','arial');
    
    figname='figure3';curpart=2;highqualityfiguresetup;
end
