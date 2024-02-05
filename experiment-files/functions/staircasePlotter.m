function staircasePlotter(threshold)

plot(abs(staircase.staircase1val),'LineWidth',2); % staircase 1
hold on
plot(abs(staircase.staircase2val),'LineWidth',2);
title('Staircase accuracies','FontSize',18);
xlabel('Trial','FontSize',14);
xlim([0 130])
ylabel('Orientation','FontSize',14)