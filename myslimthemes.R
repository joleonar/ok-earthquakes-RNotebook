
is.extrafont.installed <- function(){
  if(is.element("extrafont", installed.packages()[,1])){
    library(extrafont)
    # probably need something here to run font_import()
    return(T)
  }else{
    warning("Library extrafont installed; using system sans/serif libraries as fallback fonts.
    To enable full font support, run:
      install.packages('extrafont')
      font_import()")
    return(F)
  }
}


dan_base_font <- function(){
  if(is.extrafont.installed()){
    require(extrafont)
    bfont <- choose_font(c("Gill Sans MT", "Gill Sans", "GillSans", "Verdana", "serif"), quiet = FALSE)
  }else{
    bfont <- "Helvetica"
  }
  return(bfont)
}




theme_dan <- function(){
  require(ggplot2)
  require(grid)
  theme_minimal(base_family = dan_base_font()) +
  theme(
    axis.text = element_text(colour = "#555555"),
    axis.line = element_line(size = 0.1, linetype = "solid", color = "#444444"),
    axis.ticks = element_blank(),
    axis.title = element_blank(),
    legend.position = "right",
    legend.key.width = unit(0.1, 'cm'),
    legend.title = element_blank(),
    panel.background = element_blank(),
    panel.grid.major = element_line(size = 0.3, colour = "#666666",
      linetype = "dotted"),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    plot.title = element_text(size = 15, vjust = 2, hjust = 0.5)
  )
}



theme_dan_map <- function(){
    theme_dan() + theme(
      axis.line = element_blank(),
      axis.text.x = element_blank(),
      axis.text.y = element_blank(),
      panel.grid.major = element_blank()
    )
}




theme_dan_grid <- function(){
    theme_dan() + theme(
      plot.margin = unit(c(0, 0, 0, 0), "cm"),
      panel.margin = unit(0, "cm"),
      strip.text.x = element_text(size = rel(1.2)),
      axis.text.x = element_blank(),
      panel.grid.major = element_blank()
    )
}
