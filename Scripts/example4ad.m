s = daq.createSession('digilent');
ch_in = s.addAnalogInputChannel('ad1',1,'Voltage');
ch_out = s.addAnalogOutputChannel('ad1',1,'Voltage');

r = 1e5;
tstep = 1/r;
t = (0:tstep:1)';
generated = sin(2*pi*1000*t);
s.Rate = r;
s.queueOutputData(generated);

[collected,timestamps] = s.startForeground;
plot(timestamps,collected,t,generated);
grid on;
xlim([0 2e-3]);
xlabel('Time (seconds)');ylabel('Voltage (Volts)');
legend('collected','generated');