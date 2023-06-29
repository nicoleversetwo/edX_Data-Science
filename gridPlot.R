my_plots <- lapply(names(data_frame), function(var_x){
  p <- 
    ggplot(data_frame) +
    aes_string(var_x)
  if(is.numeric(data_frame[[var_x]])) {
    p <- p + geom_density()
  } else {
    p <- p + geom_bar()
  } 
})
plot_grid(plotlist = my_plots)
