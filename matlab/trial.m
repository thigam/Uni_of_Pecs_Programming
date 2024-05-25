% Define parameters
mu = 0.01;  % Absorption coefficient (cm^-1)
x_values = linspace(0, 10, 100);  % Path length (cm)
I_0 = 1;  % Initial intensity (normalized)

% Calculate final intensity using Beer-Lambert law
I = I_0 * exp(-mu * x_values);

% Plot the graph
figure;
plot(x_values, I, 'LineWidth', 2);
title('Beer-Lambert Law for Glass');
xlabel('Path Length (cm)');
ylabel('Intensity');
grid on;
%% 
% Define parameters
I_0 = 1;    % Initial intensity
mu = 0.01;  % Absorption coefficient
c = 3e8;    % Speed of light (m/s)
n = 1.5;    % Refractive index
t = linspace(0, 10e-6, 100);  % Time (s)

% Calculate power per unit area
P_over_A = I_0 * exp(-mu * c / n * t);

% Plot the graph
figure;
plot(t, P_over_A, 'LineWidth', 2);
title('Power per Unit Area vs Time');
xlabel('Time (s)');
ylabel('Power per Unit Area');
grid on;

%%

% Define parameters
I_0 = 1;    % Initial intensity
mu = 0.01;  % Absorption coefficient
c = 3e8;    % Speed of light (m/s)
n = 1.5;    % Refractive index
t = linspace(0, 10e-6, 1000);  % Time (s)

% Calculate energy per unit area
E_over_A = I_0 * exp(-mu * c / n * t) .* t;


% Plot the graph
figure;
plot(t, E_over_A, 'LineWidth', 2);
title('Energy per Unit Area vs Time');
xlabel('Time (s)');
ylabel('Energy per Unit Area');
grid on;

%%

% Define parameters
E_0 = 1;    % Initial energy
mu = 0.01;  % Absorption coefficient
c = 3e8;    % Speed of light (m/s)
n = 1.5;    % Refractive index
t = linspace(0, 10e-6, 100);  % Time (s)

% Calculate final energy
E = E_0 * exp(-mu * c / n * t);

% Calculate energy lost (or reflected)
E_lost = E_0 - E;

% Plot the graph
figure;
plot(t, E, 'LineWidth', 2, 'DisplayName', 'Final Energy');
hold on;
plot(t, E_lost, '--', 'LineWidth', 2, 'DisplayName', 'Energy Lost (Reflected)');
title('Final Energy and Energy Lost vs Time');
xlabel('Time (s)');
ylabel('Energy (J)');
grid on;
legend('show');
hold off;

%%


% Define parameters
E_0 = 1;    % Initial energy
mu = 0.01;  % Absorption coefficient
c = 3e8;    % Speed of light (m/s)
n = 1.5;    % Refractive index
z = 2;      % Constant parameter
t = linspace(0, 10e-5, 100);  % Time (s)

% Calculate final energy
E = E_0 * (1/z) * (1 - exp(-mu * c / n * t));

% Plot the graph
figure;
plot(t, E, 'LineWidth', 2);
title('Final Energy vs Time');
xlabel('Time (s)');
ylabel('Final Energy');
grid on;

%%
% Define parameters
E0 = 1; % Initial energy
mu = 0.1; % Constant
c = 3e8; % Speed of light
n = 1.5; % Refractive index
f = 4; % Frequency
ft = 10; % Upper limit of summation

% Define the function
z = linspace(0, ft, 1000); % Values of z from 0 to ft
E = E0 * sum(exp(-mu * (c/n) * z / f));

% Plot the function
plot(z, E);
xlabel('z');
ylabel('E');
title('Plot of E(z)');


%%


% Define parameters
I_0 = 1;    % Initial intensity
mu = 0.01;  % Absorption coefficient
c = 3e8;    % Speed of light (m/s)
n = 1.5;    % Refractive index
t = linspace(0, 10e-7, 100);  % Time (s)

% Calculate energy per unit area
E_over_A = I_0 * exp(-mu * c / n * t) .* t;

% Calculate energy per unit area lost
E_lost_over_A = I_0 * t - E_over_A;

% Plot the graph
figure;
plot(t, E_over_A, 'LineWidth', 2, 'DisplayName', 'Energy per Unit Area');
hold on;
plot(t, E_lost_over_A, '--', 'LineWidth', 2, 'DisplayName', 'Energy per Unit Area Lost');
title('Energy per Unit Area vs Time');
xlabel('Time (s)');
ylabel('Energy per Unit Area');
%xline()
grid on;
legend('show');
hold off;

