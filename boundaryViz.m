function boundaryViz()
a = [1 1];
b = [100 100];
c = [1 100];
m = [1 1 100 100];
n = [1 100 100 1];
hold on
plot(a,c,'g');
plot(b,c,'g');
plot(c,b,'g');
plot(c,a,'g');
scatter(m,n,'g','o');
end