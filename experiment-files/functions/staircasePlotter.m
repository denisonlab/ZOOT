function staircasePlotter(threshold)

plot(abs(threshold.staircase1(:,11)),'LineWidth',2);
hold on
plot(abs(threshold.staircase2(:,11)),'LineWidth',2);
title('Staircase accuracies','FontSize',18);
xlabel('Trial','FontSize',14);
ylabel('Orientation','FontSize',14)