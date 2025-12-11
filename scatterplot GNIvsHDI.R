> corrplot(cor_matrix, method = "color", addCoef.col = "black",
           +          tl.col = "black", tl.srt = 45, number.cex = 0.8,
           +          title = "Correlation Heatmap", mar = c(0,0,2,0))
> 
  > ggplot(df_main, aes(x = GNI, y = HDI, color = Continent)) +
  +     geom_point(alpha = 0.7) +
  +     scale_x_log10() +  # log scale for income
  +     labs(title = "Gross National Income vs HDI", x = "GNI (log scale)", y = "HDI")
> 
  > 