%%
% KbCheck����������ڼ��"��ǰʱ��"�Ƿ��а������£�Ҳ����˵���ڸ����ӵ�ѭ�����棬ÿһ��
% �Ż���һ���Ƿ��а������£��������ǰһ�����һ�μ����м䰴����ĳ������������Ҳ��
% �ͻ���Ϊ�㲢û�а�����Ҳ�Ͳ����˳�������һֱ��סĳ�������˳����򣩡�
%%
% ������д��ںͱ���
sca;
close all;
clearvars;

% ����ͬ���Լ��
Screen('Preference', 'SkipSyncTests', 1);

% ��⵱ǰ���ڵ��Ե���Ļ������һ�����飬��������¼�˵�ǰ��Ļ�ı�ţ����ֻ��һ����Ļ������Ϊ0
screens = Screen('Screens');

% ѡ����Ļ
screenNumber = max(screens);

% ��ð�ɫ�ͺ�ɫ����ɫֵ������Ĭ�����Ƿֱ�Ϊ0��255
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);

% �����ɫ����ɫֵ
grey = white / 2;

% ��һ�����ڣ�����������Ϊ��ɫ�����ش��ھ���ʹ��ڴ�С
[window, windowRect] = Screen('OpenWindow', screenNumber, grey);

% ����ˢ�¼��
ifi = Screen('GetFlipInterval', window);

% ��ȡ������������ȼ�
topPriorityLevel = MaxPriority(window);
Priority(topPriorityLevel);

%% 
% ��������waitframes�ȴ�֡ʹ�ô��ڵ�ˢ���ʲ�������ʾ������Ļ����ˢ���ʣ������������
% ��ÿ��һ�ε�Ƶ��ˢ�´���
flipSecs = 1;
waitframes = round(flipSecs / ifi);

% ��ת���ڻ�ó�ʼʱ���
vbl = Screen('Flip', window);

% �任������ɫֱ���������ⰴ��
% KbCheck���ڼ�⵱ǰʱ���Ƿ��а��������£�������򷵻�1��û���򷵻�0
while ~KbCheck

    % Color the screen a random color
    Screen('FillRect', window, rand(1, 3)*white                  );

    % Flip to the screen
    vbl = Screen('Flip', window, vbl + (waitframes - 0.5) * ifi);

end

% �ر����д���
sca;