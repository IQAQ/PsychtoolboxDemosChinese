%%
% �Ķ�ʱ��ע�����ִ���Window����ĻScreen
%%
% ���������Ļ�ͱ���
sca;
close all;
clearvars;

% �ڹٷ�demo�У�ʹ����Ĭ������ PsychDefaultSetup(2)��������ʱ��ʹ������Ĭ������;
% PsychDefaultSetup(2)

% ������˶����ڱʼǱ���������ɹ�����������ıʼǱ����Բ���ͨ��PTB�ļ�⣬���Ҫ������Щ���
Screen('Preference', 'SkipSyncTests', 1);

% ��⵱ǰ���ڵ��Ե���Ļ������һ�����飬��������¼�˵�ǰ��Ļ�ı�ţ����ֻ��һ����Ļ����Ĭ�ϱ��Ϊ0
screens = Screen('Screens');

% ѡ����Ļ
screenNumber = max(screens);

% ��������������ɫֵ������Ĭ�����Ƿֱ�Ϊ0��255
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);

% �����ɫ����ɫֵ
grey = white / 2;
%% 
% ��һ�����ڣ�����������Ϊ��ɫ��rectָ���˴򿪵Ĵ�������Ļ�е�λ�ã�ǰ����ֵΪ���Ͻǵ�X��ˮƽ����Y����ֱ�����꣬������ֵΪ���½ǵ�����
% ����������У�windowRect = [0,0,800,400]
rect = [200,200,1000,600];
[window, windowRect] = Screen('OpenWindow', screenNumber, grey, rect);

% ���˴��ڣ����ǿ��Բ�ѯ�������ԣ�

% ����������ص�rect��windowRect��ֵ��ͬ
rect = Screen('Rect', window);

% ��ȡ��Ļ���ڵ�������Ŀ��������ֵ��WindowRect��Rect�ĺ�����ֵ
[screenXpixels, screenYpixels] = Screen('WindowSize', window);

% ��ȡ��Ļ���ĵ�����
% xCenter = screenXpixels / 2;
% yCenter = screenYpixels / 2;
[xCenter, yCenter] = RectCenter(windowRect);

% ��ȡ��Ļ�ڲ�ˢ�¼����inter-frame-interval������������Ļ����ͼ�����С���ʱ��
ifi = Screen('GetFlipInterval', window);

% Ҳ����ȷ����Ļˢ���ʣ���ˢ�¼���Ĺ�ϵΪ ifi = 1 / hertz
hertz = FrameRate(window);

% pixel size���������ص������С������ɫ��ȣ����Ǽ����ͼ��ѧ�ĸ������һ�㲻��Ҫ��
pixelSize = Screen('PixelSize', window);

% ��ȡ��Ļ�����С�����ֵ�ɲ���ϵͳ���棬�������ϵͳû�ܻ����Ļ�������С����������򷵻�0
[width, height] = Screen('DisplaySize', screenNumber);

% ��ȡ�������ֵ��Ӧ��Ϊ255��
% �ڹٷ�demo��ʹ����PsychDefaultSetup(2)�������������һ������Screen('ColorRange', window, 1,
% [], 1)��ʹ���������ֵ�����1����˹ٷ�demo�б�ʾӦ��Ϊ1
maxLum = Screen('ColorRange', window);