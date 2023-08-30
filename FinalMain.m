clc;clear vars;
% The first link has a joint offset of 0, a link length of 0, and a twist angle of pi/2.
% The second link has a joint offset of 0, a link length of 15, and a twist angle of 0.
% The third link has a joint offset of 0, a link length of 15, and a twist angle of -pi/2
a1 = 0;
a2 = 15;
a3 = 15;
L1 = Link('revolute','d',0, 'a',a1,'alpha',pi/2)
L2 = Link('revolute','d',0, 'a',a2,'alpha',0)
L3 = Link('revolute','d',0, 'a',a3,'alpha',-pi/2)
OnePiece = SerialLink([L1 L2 L3],'name', 'Onepiece')
OnePiece.teach
            
n=1;
while n > 0
    disp("choose alphabet from this set (A,T,H,L,E,F)")
    choice=input("Enter an ALPHABET or any other key to exit : ",'s'); 
    switch choice
    case 'A'
        draw_A(OnePiece);
    case 'T'
        draw_T(OnePiece);
    case 'H'
        draw_H(OnePiece);
    case 'L'
        draw_L(OnePiece);
    case 'E'
        draw_E(OnePiece);
    case 'F'
        draw_F(OnePiece);
    case 'a'
        draw_A(OnePiece);
    case 't'
        draw_T(OnePiece);
    case 'h'
        draw_H(OnePiece);
    case 'l'
        draw_L(OnePiece);
    case 'e'
        draw_E(OnePiece);
    case 'f'
        draw_F(OnePiece);
        otherwise
        disp(" ")
        disp(" --------------------END------------------- ")
        n=0;
    end
end
function  draw_A(OnePiece)

 xlim([-50 50]);
 ylim([-50 50]); 
 zlim([-50 50]);

    start = [10,5,20];
    points = [10 5 20;10 10 0;10 5 20;10 0 0;10 3 10;10 7 10;10 10 0];

    point0 = transl(start);
    q00 = OnePiece.ikine(point0,'q0',[0 1 0],'mask', [1 1 1 0 0 0]);
    plot(OnePiece, q00)

    for i=1:size(points)
        if i==1
            p1 = start;
        else
            p1 = [10,points(i-1,2),points(i-1,3)];
        end

        p2 = [10,points(i,2),points(i,3)];
        T1 = transl(p1);
        T2 = transl(p2);
        t1 = OnePiece.ikine(T1,'q0',q00,'mask', [1 1 1 0 0 0]); 
        t2 = OnePiece.ikine(T2,'q0',q00,'mask', [1 1 1 0 0 0]);
        JT = jtraj(t1,t2,5);
        plot(OnePiece,JT)

        hold on
        x = [p1(1) ; p2(1)];
        y = [p1(2) ; p2(2)];
        z = [p1(3) ; p2(3)];
        figure(1)
        plot3(x,y,z,'LineWidth',5,'color','k')
        

    end
end

function draw_T(OnePiece)

 xlim([-50 50]);
 ylim([-50 50]); 
 zlim([-50 50]);

    start = [10,10,20];
    points = [10 10 20;10 0 20;10 5 20;10 5 10];
    point0 = transl(start);
    q00 = OnePiece.ikine(point0,'q0',[0 1 0],'mask', [1 1 1 0 0 0]);
    plot(OnePiece, q00)

    for i=1:size(points)
        if i==1
            p1 = start;
        else
            p1 = [10,points(i-1,2),points(i-1,3)];
        end

        p2 = [10,points(i,2),points(i,3)];
        T1 = transl(p1);
        T2 = transl(p2);
        t1 = OnePiece.ikine(T1,'q0',q00,'mask', [1 1 1 0 0 0]); 
        t2 = OnePiece.ikine(T2,'q0',q00,'mask', [1 1 1 0 0 0]);
        JT = jtraj(t1,t2,5);
        plot(OnePiece,JT)

        hold on
        x = [p1(1) ; p2(1)];
        y = [p1(2) ; p2(2)];
        z = [p1(3) ; p2(3)];
        figure(2)
        plot3(x,y,z,'LineWidth',5,'color','k')

    end

end

function draw_H(OnePiece)

 xlim([-50 50]);
 ylim([-50 50]); 
 zlim([-50 50]);

    start = [10,10,20];
    points = [10 10 20;10 10 0;10 10 10;10 0 10;10 0 20;10 0 0];
    point0 = transl(start);
    q00 = OnePiece.ikine(point0,'q0',[0 1 0],'mask', [1 1 1 0 0 0]);
    plot(OnePiece, q00)

    for i=1:size(points)
        if i==1
            p1 = start;
        else
            p1 = [10,points(i-1,2),points(i-1,3)];
        end

        p2 = [10,points(i,2),points(i,3)];
        T1 = transl(p1);
        T2 = transl(p2);
        t1 = OnePiece.ikine(T1,'q0',q00,'mask', [1 1 1 0 0 0]); 
        t2 = OnePiece.ikine(T2,'q0',q00,'mask', [1 1 1 0 0 0]);
        JT = jtraj(t1,t2,5);
        plot(OnePiece,JT)

        hold on
        x = [p1(1) ; p2(1)];
        y = [p1(2) ; p2(2)];
        z = [p1(3) ; p2(3)];
        figure(3)
        plot3(x,y,z,'LineWidth',5,'color','k')

    end

end

function draw_E(OnePiece)

 xlim([-50 50]);
 ylim([-50 50]);
 zlim([-50 50]);

    start = [10,10,20];
    points = [10 10 20;10 10 0;10 10 20;10 0 20;10 10 20;10 10 10;10 0 10;
        10 10 10; 10 10 0;10 0 0];
    point0 = transl(start);
    q00 = OnePiece.ikine(point0,'q0',[0 1 0],'mask', [1 1 1 0 0 0]);
    plot(OnePiece, q00)

    for i=1:size(points)
        if i==1
            p1 = start;
        else
            p1 = [10,points(i-1,2),points(i-1,3)];
        end

        p2 = [10,points(i,2),points(i,3)];
        T1 = transl(p1);
        T2 = transl(p2);
        t1 = OnePiece.ikine(T1,'q0',q00,'mask', [1 1 1 0 0 0]); 
        t2 = OnePiece.ikine(T2,'q0',q00,'mask', [1 1 1 0 0 0]);
        JT = jtraj(t1,t2,5);
        plot(OnePiece,JT)

        hold on
        x = [p1(1) ; p2(1)];
        y = [p1(2) ; p2(2)];
        z = [p1(3) ; p2(3)];
        figure(4)
        plot3(x,y,z,'LineWidth',5,'color','k')

    end

end

function draw_L(OnePiece)

 xlim([-50 50]);
 ylim([-50 50]);
 zlim([-50 50]);

    start = [10,10,20];
    points = [10 10 20;10 10 0;10 0 0];
    point0 = transl(start);
    q00 = OnePiece.ikine(point0,'q0',[0 1 0],'mask', [1 1 1 0 0 0]);
    plot(OnePiece, q00)

    for i=1:size(points)
        if i==1
            p1 = start;
        else
            p1 = [10,points(i-1,2),points(i-1,3)];
        end

        p2 = [10,points(i,2),points(i,3)];
        T1 = transl(p1);
        T2 = transl(p2);
        t1 = OnePiece.ikine(T1,'q0',q00,'mask', [1 1 1 0 0 0]); 
        t2 = OnePiece.ikine(T2,'q0',q00,'mask', [1 1 1 0 0 0]);
        JT = jtraj(t1,t2,5);
        plot(OnePiece,JT)

        hold on
        x = [p1(1) ; p2(1)];
        y = [p1(2) ; p2(2)];
        z = [p1(3) ; p2(3)];
        figure(5)
        plot3(x,y,z,'LineWidth',5,'color','k')

    end

end
function draw_F(OnePiece)

 xlim([-50 50]);
 ylim([-50 50]);
 zlim([-50 50]);

    start = [10,10,20];
    points = [10 10 20;10 10 0;10 10 20;10 0 20;10 10 20;10 10 10;10 0 10];
    point0 = transl(start);
    q00 = OnePiece.ikine(point0,'q0',[0 1 0],'mask', [1 1 1 0 0 0]);
    plot(OnePiece, q00)

    for i=1:size(points)
        if i==1
            p1 = start;
        else
            p1 = [10,points(i-1,2),points(i-1,3)];
        end

        p2 = [10,points(i,2),points(i,3)];
        T1 = transl(p1);
        T2 = transl(p2);
        t1 = OnePiece.ikine(T1,'q0',q00,'mask', [1 1 1 0 0 0]); 
        t2 = OnePiece.ikine(T2,'q0',q00,'mask', [1 1 1 0 0 0]);
        JT = jtraj(t1,t2,5);
        plot(OnePiece,JT)

        hold on
        x = [p1(1) ; p2(1)];
        y = [p1(2) ; p2(2)];
        z = [p1(3) ; p2(3)];
        figure(6)
        plot3(x,y,z,'LineWidth',5,'color','k')

    end

end