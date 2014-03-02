function[] = Eigenpicture(A,k,shape)
%The function Eigenpicture(A,k,shape) plots the eigenpicture of a 
%2x2 matrix A by plotting k (80 by default) unit circle vectors and their
%images under multiplication by A, head to tail. The boolean shape (false
%by defaul) indicates whether to plot a line connecting the heads of the
%image vectors.
if nargin<3
    shape=false;
    if nargin<2
        k=80;
    end
end
base_vectors = zeros(k,2);
colours = hsv(k);
hold on
axis equal

for i=(1:k)
    base_vectors(i,1)=cos(2*i*pi/k);
    base_vectors(i,2)=sin(2*i*pi/k);
end
trans_vectors=(A*(base_vectors.')).';
for i=(1:k)
    plot([0,base_vectors(i,1)],[0,base_vectors(i,2)],'color', colours(i,:))
    plot([base_vectors(i,1),trans_vectors(i,1)],[base_vectors(i,2),trans_vectors(i,2)],'color',colours(i,:))
    if (shape && i<k)
        plot([trans_vectors(i,1),trans_vectors(i+1,1)],[trans_vectors(i,2),trans_vectors(i+1,2)],'color', 'black')
    end
end
if shape 
    plot([trans_vectors(k,1),trans_vectors(1,1)],[trans_vectors(k,2),trans_vectors(1,2)], 'color', 'black')
end
hold off
end
    

