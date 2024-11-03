function hullViz(hull)
disp('Figure 1 displays the scaled hull biofouling distribution in three dimensions (A) and as a heatmap (B)')
figure
subplot(2,1,1)
s = surf(hull.F);
s.EdgeColor = 'interp';
title('A');
subplot(2,1,2)
eight = NaN(1,8);
nine = NaN(1,9);
ruler = [1 eight 10 nine 20 nine 30 nine 40 nine 50 nine 60 nine 70 nine 80 nine 90 nine 100];
test = heatmap(hull.F);
test.Colormap = summer;
test.GridVisible = 'off';
test.YDisplayLabels = ruler;
test.XDisplayLabels = ruler;
title('B');