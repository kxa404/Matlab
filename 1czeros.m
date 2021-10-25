f=(0:5:150)
f = [ ]
f(1) = 1

for f=(0:5:150)
    if f==0
        f=1;
    end
    N = 10000*40*(1/f); %400,000
    T=40/f
    t= 0:(40*(1/f))/N:(40*(1/f));
    figure
    plot(t,f*sin(2*pi*f*t),'r');
    str=sprintf('sine wave with frequency of %d',f); 
    title(f)
    t_100 = T/N:T/N:0.1
    Sine_100 = zeros(length(t_100),1)

    hold on
    
end

T=40/f
N=40*(10000/f) %400,000
t_100 = T/N:T/N:0.1
Sine_100 = zeros(length(t_100),1)









