function [pictures] = eigenpicture_return(A,k,shape)
if nargin<3
    shape=false;
    if nargin<2
        k=80;
    end
end
base_vectors = zeros(k,2);
colours = hsv(k);
if shape
    pictures = zeros(1,k+2);
else
    pictures = zeros(1,3);
end

for i=(1:k)
    base_vectors(i,1)=cos(2*i*pi/k);
    base_vectors(i,2)=sin(2*i*pi/k);
end
trans_vectors=(A*(base_vectors.')).';
for i=(1:k)
    pictures(1,1)=plot([0,base_vectors(i,1)],[0,base_vectors(i,2)],'color', colours(i,:));
    pictures(1,2)=plot([base_vectors(i,1),trans_vectors(i,1)],[base_vectors(i,2),trans_vectors(i,2)],'color',colours(i,:));
    if (shape && i<k)
        pictures(1,i+2)=plot([trans_vectors(i,1),trans_vectors(i+1,1)],[trans_vectors(i,2),trans_vectors(i+1,2)],'color', 'black');
    end
end
if shape 
    pictures(1,k+2)=plot([trans_vectors(k,1),trans_vectors(1,1)],[trans_vectors(k,2),trans_vectors(1,2)], 'color', 'black');
end
return pictures;
end