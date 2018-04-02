?% ��������
clearvars;
close all;
sca;

% ��ʼ��������������
InitializePsychSound(1);

% ����ͨ���Ͳ�����
% �ڹٷ�Demo������Ƶ��(Frequency of the sound)�Ͳ�����(sample rate)����ˣ�����
% ���ｫ�������
nrchannels = 2;
sampleRate = 48000;    % �ٷ�Demo�������������Ϊfreq�ǲ��Ե�
freq = 500;

% ����ϣ�����ż�������
repetitions = 1;

% ��������ʱ��
beepLengthSecs = 1;

% ��������֮��ļ��
beepPauseTime = 1;

% ������ʼ�����������0 = ������ʼ��
startCue = 0;

% �Ƿ�ȴ��豸������ʼ��1 = �ǣ�
% ����鿴 help PsychPortAudio
waitForDeviceStart = 1;

% �� Psych-Audio �˿ڣ�ʹ�����²���
% (1) [] = ʹ��Ĭ���豸��������
% (2) 1 = ����������. �����Ա�����Ϊ2 = ��¼������3 = ���Ų���¼���������ȶ��ᵼ��MATLAB������
% (3) 1 = �����ܵļ������������ӳ٣������Ա�����Ϊ0 = ���������ӳ٣�2 = ��ȫ�ӹ�����װ�ã�
%       �����ܻ����С�ӳ٣���ʹ��˸��������������Ĳ���Ҳ������ϧ���Լ�����3��4��
% (4) ���ò���ʱÿ�벥�Ų������������Ҳ���ǲ�����"�϶���"�����Ĳ�����
% (5) 2 = ˫ͨ��������
pahandle = PsychPortAudio('Open', [], 1, 1, sampleRate, nrchannels);

% ��������
PsychPortAudio('Volume', pahandle, 0.5);

% ������������
myBeep = MakeBeep(500, beepLengthSecs, sampleRate);

% �������������뻺��������Ϊ��˫������Ҫ����2������
PsychPortAudio('FillBuffer', pahandle, [myBeep; myBeep]);

% ��ʼ��������
PsychPortAudio('Start', pahandle, repetitions, startCue, waitForDeviceStart);

% �ȴ�������������������ʹ��һ�ָ���ȷ�ĵ���ʱ��ķ��������������
% https://groups.yahoo.com/neo/groups/psychtoolbox/conversations/messages/20863
[actualStartTime, ~, ~, estStopTime] = PsychPortAudio('Stop', pahandle, 1, 1);

% ��������һ���������ŵ�ʱ��
startCue = estStopTime + beepPauseTime;

% ��������
PsychPortAudio('Start', pahandle, repetitions, startCue, waitForDeviceStart);

PsychPortAudio('Stop', pahandle, 1, 1);

% �ر������豸
PsychPortAudio('Close', pahandle);