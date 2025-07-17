function [mX,mZ,Phi]=import_data_local(filename)

l=3000;
n=1000;

% L=0.003;
L=1;

fid=fopen(filename);

% Nh=1;
% nn=(l+1)*(n+1)+Nh;

% rubbish = fgetl(fid);
% 
% mm=nn-Nh;
% 
% X=0*(1:mm);
% Z=0*(1:mm);
% U=0*(1:mm);
% W=0*(1:mm);
% P=0*(1:mm);
% 
% 
% Phi=0*(1:mm);
% 
% for i=1:mm
%     c1=fgetl(fid);
%     x_vec_temp=sscanf(c1,'%f,');
%     x_temp=x_vec_temp(1)/L;
%     z_temp=x_vec_temp(3)/L;
%     u_temp=x_vec_temp(4);
%     w_temp=x_vec_temp(6);
%     phi_temp=x_vec_temp(7);
% 
%         X(i)=x_temp;
%         Z(i)=z_temp;
%         U(i)=u_temp;
%          W(i)=w_temp;
%         Phi(i)=phi_temp;
% 
%     
% %     if(mod(i,10000)==0)
% %         display(strcat('opening file: ',num2str(floor((i/mm)*100)),'% done'))
% %     end
% end

T=readtable(filename);
T=table2array(T);

X=T(:,1)/L;
Z=T(:,3)/L;
Phi=T(:,7);

mx = linspace(min(X),max(X),l+1);
mz = linspace(min(Z),max(Z),n+1);
[mX, mZ] = meshgrid(mx',mz');
newPhi = griddata(X,Z,Phi,mX,mZ,'cubic');
size(newPhi)
Phi = newPhi;
fclose(fid);


end