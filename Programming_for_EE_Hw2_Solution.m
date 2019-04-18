clc
clear all
close all
%% Question#1
N=50
x=linspace(-4*pi,4*pi,N)
f=(exp(x)-exp(-x))/2; %sine hyperbolic function
g=(exp(x)+exp(-x))/2; %cosine hyperbolic function
plot(x,f,'--g*','LineWidth',2,'Color', 'b') %sine function plotting
hold on
plot(x,g,'--bs','LineWidth',2,'Color', 'r') %cosine function plotting
xlabel('Time')
ylabel('sinh(x) and cosh(x) functions')
title('Hyperbolic trigonometric functions plotting')
legend('sinh(x)','cosh(x)')
%% Question#2
E=8.85*10^-12; %Air permeability (Epsilon)
a=30*10^(-2) % a side of the capasitor
b=40*10^(-2) % b side of the capasitor
d=0.002:0.00001:0.01; % distance between two conductor plates
A=a*b; % Area of a conductor plate
C=E*A./d; %Capasitor
plot(d,C,'LineWidth',2,'Color', 'g')
xlabel('Distance btw two conductor plates')
ylabel('Capasitor')
title('Capasitor vs. Distance')
%% Question#3
A = [ -7 8 16; 11 -9 48; 6 -25 -13];
B = [4 3 81; -5 7 11; 12 -9 -32]
C = [ -3 -4 1; 9 2 6; 13 11 15];
Asorted = sort(A); 
Bsorted = sort(B,2)
Csumofcolumn = sum(C);
Csumofrow = sum(C,2);
Atranz = transpose(A);
%%islem = A+B(2:3,2:3) + C; B(2:3,2:3) islemi B matrisini [7 11 ; -9 -32]
%%kismini alip yeni bir 2x2 matris olusturacaktir. Yani her satirin 2. ve 3.elemanini aliyor.
%%Matrislerde islem yaparken boyutlarinin birbirlerine uygun olmasi gerektigi icin verilen
%%islemi yapmak istedigimizde Error using  + Matrix dimensions must agree.
%%hatasi verecektir yani 3x3 matrisle 2x2 matrisi boyutlari uygun olmadigi
%%icin toplanamaz.
ResultedMat = A - (B/4) - (2*C);
%% Question#4
clc
clear all
close all
L=[-1.38 0.57 1.22;0.09 1.62 0.78] %locations of the beacons
r=[2.1034 0.8205 0.6203] %radius
syms x y
y1=@(x,y)(x-L(1,1))^2+(y-L(2,1))^2-r(1,1)^2; %distance btw beacon#1 and mobile phone
y2=@(x,y)(x-L(1,2))^2+(y-L(2,2))^2-r(1,2)^2; %distance btw beacon#2 and mobile phone
y3=@(x,y)(x-L(1,3))^2+(y-L(2,3))^2-r(1,3)^2; %distance btw beacon#3 and mobile phone
eq1=y1(x,y)-y3(x,y) 
eq2=y1(x,y)-y2(x,y)
eq3=y2(x,y)-y3(x,y)
[A,B] = equationsToMatrix([eq1 eq2 eq3], [x, y])
X = linsolve(A,B)
ezplot(y1)
hold on
ezplot(y2)
hold on
ezplot(y3)
