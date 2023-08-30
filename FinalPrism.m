clc;clear vars;
L1=Link('prismatic','theta',0,'a',0,'alpha',-pi/2,'qlim',[0,10],'offset',0) 
L2=Link('prismatic','theta',pi/2,'a',0,'alpha',pi/2,'qlim',[0,10],'offset',0)
L3=Link('prismatic','theta',-pi/2,'a',0,'alpha',0,'qlim',[0,10],'offset',0)
L4=Link('prismatic','theta',pi,'a',0,'alpha',-pi/2,'qlim',[0,10],'offset',0)
ARM=SerialLink([L1 L2 L3 L4],'name','PPPP')

n=1;
while n > 0
    choice=input("Enter an ALPHABET or any other key to exit : ",'s'); 
    switch choice
    case 'A'
        A(ARM);
    case 'T'
        T(ARM);
    case 'H'
        H(ARM);
    case 'L'
        L(ARM);
    case 'E'
        E(ARM);
    case 'F'
        F(ARM);
    case 'a'
        A(ARM);
    case 't'
        T(ARM);
    case 'h'
        H(ARM);
    case 'l'
        L(ARM);
    case 'e'
        E(ARM);
    case 'f'
        F(ARM);
        otherwise
        disp(" ")
        disp(" --------------------END------------------- ")
        n=0;
    end
end

function Result = A(ARM)
T1 = transl(2,2,2.5);
T2 = transl(8,13,2.5);
T3 = transl(14,2,2.5);
T4 = transl(11.26,7,2.5);
T5 = transl(4.77,7,2.5);

Q0 = [0 0 0 0];
Q1 = ARM.ikine(T1,'q0',Q0,'mask',[1, 1, 1, 1, 0, 0]);
Q2 = ARM.ikine(T2,'q1',Q1,'mask',[1, 1, 1, 1, 0, 0]);
Q3 = ARM.ikine(T3,'q2',Q2,'mask',[1, 1, 1, 1, 0, 0]);
Q4 = ARM.ikine(T4,'q3',Q3,'mask',[1, 1, 1, 1, 0, 0]);
Q5 = ARM.ikine(T5,'q4',Q4,'mask',[1, 1, 1, 1, 0, 0]);

M1 = jtraj(Q1,Q2,20);
M2 = jtraj(Q2,Q3,20);
M3 = jtraj(Q3,Q4,20);
M4 = jtraj(Q4,Q5,20);
MFinal = [M1;M2;M3;M4];
ARM.plot(MFinal,'workspace',[-3 25 -3 25 -3 25],'trail',{'b', 'LineWidth', 10}) 
Result = "Successful!!"
end

function Result = T(ARM)
T1 = transl(2,14,2.5);
T2 = transl(14,14,2.5);
T3 = transl(8,14,2.5);
T4 = transl(8,2,2.5);

Q0 = [0 0 0 0];
Q1 = ARM.ikine(T1,'q0',Q0,'mask',[1, 1, 1, 1, 0, 0]);
Q2 = ARM.ikine(T2,'q1',Q1,'mask',[1, 1, 1, 1, 0, 0]);
Q3 = ARM.ikine(T3,'q2',Q2,'mask',[1, 1, 1, 1, 0, 0]);
Q4 = ARM.ikine(T4,'q3',Q3,'mask',[1, 1, 1, 1, 0, 0]);

M1 = jtraj(Q1,Q2,20);
M2 = jtraj(Q2,Q3,20);
M3 = jtraj(Q3,Q4,20);
MFinal = [M1;M2;M3];
figure(1)
ARM.plot(MFinal,'workspace',[-3 25 -3 25 -3 25],'trail',{'b', 'LineWidth', 10}) 
Result = "Successful!!"
end

function Result = H(ARM)
T1 = transl(6,6,2.5);
T2 = transl(6,22,2.5);
T3 = transl(6,14,2.5);
T4 = transl(14,14,2.5);
T5 = transl(14,22,2.5);
T6 = transl(14,6,2.5);

Q0 = [0 0 0 0];
Q1 = ARM.ikine(T1,'q0',Q0,'mask',[1, 1, 1, 1, 0, 0]);
Q2 = ARM.ikine(T2,'q1',Q1,'mask',[1, 1, 1, 1, 0, 0]);
Q3 = ARM.ikine(T3,'q2',Q2,'mask',[1, 1, 1, 1, 0, 0]);
Q4 = ARM.ikine(T4,'q3',Q3,'mask',[1, 1, 1, 1, 0, 0]);
Q5 = ARM.ikine(T5,'q4',Q4,'mask',[1, 1, 1, 1, 0, 0]);
Q6 = ARM.ikine(T6,'q5',Q5,'mask',[1, 1, 1, 1, 0, 0]);

M1 = jtraj(Q1,Q2,20);
M2 = jtraj(Q2,Q3,20);
M3 = jtraj(Q3,Q4,20);
M4 = jtraj(Q4,Q5,20);
M5 = jtraj(Q5,Q6,20);
MFinal = [M1;M2;M3;M4;M5];
figure(1)
ARM.plot(MFinal,'workspace',[-3 25 -3 25 -3 25],'trail',{'b', 'LineWidth', 10}) 
Result = "Successful!!"
end

function Result = L(ARM)
T1 = transl(8,22,2.5);
T2 = transl(8,4,2.5);
T3 = transl(20,4,2.5);
T4 = transl(8,4,2.5);

Q0 = [0 0 0 0];
Q1 = ARM.ikine(T1,'q0',Q0,'mask',[1, 1, 1, 1, 0, 0]);
Q2 = ARM.ikine(T2,'q1',Q1,'mask',[1, 1, 1, 1, 0, 0]);
Q3 = ARM.ikine(T3,'q2',Q2,'mask',[1, 1, 1, 1, 0, 0]);
Q4 = ARM.ikine(T4,'q3',Q3,'mask',[1, 1, 1, 1, 0, 0]);

M1 = jtraj(Q1,Q2,20);
M2 = jtraj(Q2,Q3,20);
M3 = jtraj(Q3,Q4,20);
MFinal = [M1;M2;M3];
figure(1)
ARM.plot(MFinal,'workspace',[-3 25 -3 25 -3 25],'trail',{'b', 'LineWidth', 10}) 
Result = "Successful!!"
end

function Result = E(ARM)
T1 = transl(16,22,2.5);
T2 = transl(5,22,2.5);
T3 = transl(5,13,2.5);
T4 = transl(15,13,2.5);
T5 = transl(5,13,2.5);
T6 = transl(5,5,2.5);
T7 = transl(15,5,2.5);
T8 = transl(5,5,2.5);

Q0 = [0 0 0 0];
Q1 = ARM.ikine(T1,'q0',Q0,'mask',[1, 1, 1, 1, 0, 0]);
Q2 = ARM.ikine(T2,'q1',Q1,'mask',[1, 1, 1, 1, 0, 0]);
Q3 = ARM.ikine(T3,'q2',Q2,'mask',[1, 1, 1, 1, 0, 0]);
Q4 = ARM.ikine(T4,'q3',Q3,'mask',[1, 1, 1, 1, 0, 0]);
Q5 = ARM.ikine(T5,'q4',Q4,'mask',[1, 1, 1, 1, 0, 0]);
Q6 = ARM.ikine(T6,'q5',Q5,'mask',[1, 1, 1, 1, 0, 0]);
Q7 = ARM.ikine(T7,'q6',Q6,'mask',[1, 1, 1, 1, 0, 0]);
Q8 = ARM.ikine(T8,'q7',Q7,'mask',[1, 1, 1, 1, 0, 0]);


M1 = jtraj(Q1,Q2,20);
M2 = jtraj(Q2,Q3,20);
M3 = jtraj(Q3,Q4,20);
M4 = jtraj(Q4,Q5,20);
M5 = jtraj(Q5,Q6,20);
M6 = jtraj(Q6,Q7,20);
M7 = jtraj(Q7,Q8,20);
MFinal = [M1;M2;M3;M4;M5;M6;M7];
figure(1)
ARM.plot(MFinal,'workspace',[-3 25 -3 25 -3 25],'trail',{'b', 'LineWidth', 10}) 
Result = "Successful!!"
end

function Result = F(ARM)
T1 = transl(16,22,2.5);
T2 = transl(4,22,2.5);
T3 = transl(4,14,2.5);
T4 = transl(15,14,2.5);
T5 = transl(4,14,2.5);
T6 = transl(4,4,2.5);

Q0 = [0 0 0 0];
Q1 = ARM.ikine(T1,'q0',Q0,'mask',[1, 1, 1, 1, 0, 0]);
Q2 = ARM.ikine(T2,'q1',Q1,'mask',[1, 1, 1, 1, 0, 0]);
Q3 = ARM.ikine(T3,'q2',Q2,'mask',[1, 1, 1, 1, 0, 0]);
Q4 = ARM.ikine(T4,'q3',Q3,'mask',[1, 1, 1, 1, 0, 0]);
Q5 = ARM.ikine(T5,'q4',Q4,'mask',[1, 1, 1, 1, 0, 0]);
Q6 = ARM.ikine(T6,'q5',Q5,'mask',[1, 1, 1, 1, 0, 0]);

M1 = jtraj(Q1,Q2,20);
M2 = jtraj(Q2,Q3,20);
M3 = jtraj(Q3,Q4,20);
M4 = jtraj(Q4,Q5,20);
M5 = jtraj(Q5,Q6,20);
MFinal = [M1;M2;M3;M4;M5];
figure(1)
ARM.plot(MFinal,'workspace',[-3 25 -3 25 -3 25],'trail',{'b', 'LineWidth', 10}) 
Result = "Successful!!"
end