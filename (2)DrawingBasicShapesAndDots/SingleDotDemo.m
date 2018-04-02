%%
% ������д��ںͱ���
sca;
close all;
clearvars;

% �����������
rand('seed', sum(100 * clock));

% ��⵱ǰ���ڵ��Ե���Ļ������һ�����飬��������¼�˵�ǰ��Ļ�ı�ţ����ֻ��һ����Ļ������Ϊ0
screens = Screen('Screens');
screenNumber = max(screens);

% ��ð�ɫ�ͺ�ɫ����ɫֵ������Ĭ�����Ƿֱ�Ϊ0��255
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);

% �����ɫ����ɫֵ
grey = white / 2;

% ��һ�����ڣ�����������Ϊ��ɫ�����ش��ھ���ʹ��ڴ�С
[window, windowRect] = Screen('OpenWindow', screenNumber, black);

% ��ȡ���ڴ�С
[screenXpixels, screenYpixels] = Screen('WindowSize', window);

% ��ȡ������������
[xCenter, yCenter] = RectCenter(windowRect);

%%
% ����alphaͨ��������ݣ�ԭ�ľ�����ô˵��...��
% �������Screen BlendFunction? ��鿴������OpenGL���ָ��
Screen('BlendFunction', window, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

% �������ɫ����Ϊ��ɫ�����������ɫ��������ԭɫ��϶��ɡ��������ʹ������Ԫ�ص�����ֱ��ʾ
% ������������ɫ����ʹ�ø���������ʾ��ɫʱ����ɫֵΪ0��1֮�������ֵ����ʹ��8λ������ʾ��ɫ
% ʱ��ʹ�ð�λ�Ķ��������ֱ�ʾ��ɫ������ת��Ϊʮ��������������2^8 = 256�����������ʹ�ð�λ
% ����ʱҪ����ɫֵ��λ��0��255֮�������ֵ��PTB��Ĭ��ʹ��0��255����ɫֵ��
dotColor = [1 0 0] * white;

% ������ɵ������ֵ�����һ��С�ĵ㱻����������Ļ�ı�Ե������ȱʧһ���֣�
dotXpos = rand * screenXpixels;
dotYpos = rand * screenYpixels;

% ��Ĵ�С
dotSizePix = 20;

% ����Ļ�л��Ƶ㣬���ڲ�������Ϣ���ѯScreen DrawDots?
% �������һ����������ƽ�����Ƶ�ı�Ե
Screen('DrawDots', window, [dotXpos dotYpos], dotSizePix, dotColor, [], 2);

% ��ת��Ļ��
Screen('Flip', window);

% �������������ִ�г���
KbStrokeWait;

% �ر����д���
sca;