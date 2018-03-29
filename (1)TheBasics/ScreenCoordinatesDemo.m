%%
% ������д��ںͱ���
sca;
close all;
clearvars;

% ����ͬ���Լ��
Screen('Preference', 'SkipSyncTests', 1);

% ��⵱ǰ���ڵ��Ե���Ļ������һ�����飬��������¼�˵�ǰ��Ļ�ı�ţ����ֻ��һ����Ļ����Ĭ�ϱ��Ϊ0
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

% ��ȡ���ڴ�С
[screenXpixels, screenYpixels] = Screen('WindowSize', window);

%%
% ����Ĭ�ϵ���������ִ�С
Screen('TextFont', window, 'Arial');    % �ٷ�Demos�����'Arial'ƴ����'Ariel'
Screen('TextSize', window, 50); 

% ��ȡ������������
[xCenter, yCenter] = RectCenter(windowRect);

% ����������ĳ�ʼλ��
SetMouse(round(rand * screenXpixels), round(rand * screenYpixels), window);

% ��������ڴ��ڵ����Ͻ�
SetMouse(0, 0, window);

% ѭ��ֱ��ĳ������������
while ~KbCheck
    % ��ȡ���ĵ�ǰ�����밴�µİ���
    % buttonΪ��ά����
    [x, y, buttons] = GetMouse(window);
    
    % ��һ����Ϊ�˷�ֹ���г�������ж����ʾ������x��y�����ڴ�����
    x = min(x, screenXpixels);
    y = min(y, screenYpixels);
    
    % ������Ļ����ʾ�����֣���ʾ��ǰ��������
    textString = ['Mouse at X pixel ' num2str(round(x))...
        ' and Y pixel ' num2str(round(y))];
    
    % �����ֻ�������Ļ�ϣ�����ʹ��Screen('DrawText')���������ƫ�ײ㣩
    DrawFormattedText(window, textString, 'center', 'center', white);
    
    % ��������λ�û���һ����ɫԲ��
    % �����ڶ�������Ϊ[x,y]ԭ�����꣬���û��ʹ��Ĭ��ֵ������㽫�������Ե����ڶ�������
    % ��ָ����λ��Ϊ����ϵ��[x,y]λ�ã�û�д��������ʹ��Ĭ�ϵĴ�������ϵ��[x,y]��Ϊ
    % ��ͼλ�á�
    % ������һ������ָ������Բ�����ͣ�������0��4������ֵ��2ʹ�����Բ����ݣ���������Բ��
    Screen('DrawDots', window, [x y], 10, white, [], 2);
    
    % Flip to the screen
    Screen('Flip', window);
end

% �ر����д���
sca;