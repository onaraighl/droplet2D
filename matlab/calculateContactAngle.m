function [t,triple_point]=calculateContactAngle()

clf

% l=640;
% n=320;

% L=0.003;
% Lx=12*L;
% Lz=3*L;
% cellsize = Lz/n;



casename = "test";
files=dir(strcat(casename, '_*.csv'));
% klim=numel(files);
klim1=3;
klim2=numel(files);
dt=0.001748743541957; %% CHANGE THIS AS NECESSARY
t=(1:(klim2-klim1))*dt;
length(t)
triple_point = zeros(1,klim2-klim1);

for ctr=1:klim2-klim1

    filename=files(ctr+klim1-1).name
    [X,Z,Phi] = import_data_local(filename);
    zz=contour(X,Z,Phi,[0.5 0.5]);
    xx=zz(1,:);
    yy=zz(2,:);

    yy1=yy(yy<2);
    xx1=xx(yy<2);

    [xx2,ix]=sort(xx1);
    yy2=yy1(ix);

    xx3=xx2(20:end);
    yy3=yy2(20:end);

    plot(xx3,yy3,'-o','Color','blue')
    drawnow

    xx3(end)
    triple_point(ctr)=xx3(end);
    
    
end

end


% plot(1:115, contact_angle)
%     set(gca,'fontsize',16,'fontname','times new roman')
%     ylabel('\theta(t)')
%     xlabel('t')
%     set(gca,'xtick',[0:20:120])
%     set(gca,'ytick',[0:10:numel(files)])
%     set(gca, 'XGrid', 'on')
%     set(gca, 'Layer', 'top')
%     set(gca, 'YGrid', 'on')
% 	set(gca, 'Layer', 'top')
%     axis equal
%     xlim([ 0 115])
%     ylim([ 0 120])

% *************************************************************************

% % OPTION 1
    % 
    % yy1=yy(yy<2);
    % xx1=xx(yy<2);
    % 
    % yy2=yy(xx>0.95*max(xx));
    % xx2=xx(xx>0.95*max(xx));
    % 
    % % p = polyfit(yy2,xx2-max(xx2),2);
    % % dxdy=p(2);
    % % dydx=1/dxdy;
    % 
    % % theta=atan(abs(dydx));
    % % theta=pi-atan2(abs(dydx),-1);
    % % theta_deg=theta*360/(2*pi);
    % 
    % % theta_deg=dydx;
    % 
    % nc=2;
    % dydx_num=(yy2(nc)-yy2(1))/(xx2(nc)-xx2(1));
    % theta_num1=pi-atan2(abs(dydx_num),-1);
    % 
    % nc=5;
    % dydx_num=(yy2(nc)-yy2(1))/(xx2(nc)-xx2(1));
    % theta_num2=pi-atan2(abs(dydx_num),-1);
    % 
    % plot(xx1,yy1,'o')
    % hold on
    % plot(xx2,yy2,'-x')
    % plot(xx,dydx_num*(xx-max(xx)),'color','red','linewidth',3)
    % plot(xx,-tan(pi/3)*(xx-max(xx)),'color','blue','linewidth',3,'linestyle','--')
    % ylim([0 0.3])
    % xlim([0.8*max(xx),1.2*max(xx)])
    % hold off
    % drawnow
    % 
    % contact_angle1(ctr) = theta_num1;
    % contact_angle2(ctr) = theta_num2;
    % triple_point(ctr) = max(xx);
    % 
    % string = sprintf("Contact angle at iteration %d is %0.2f", ctr, contact_angle1(ctr)*360/(2*pi));
    % disp(string);



