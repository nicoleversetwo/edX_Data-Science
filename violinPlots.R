#~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*
# Make Violin Plot of Regions - All Samples - Sort by Median
#~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*-*-*
​
redo <- retG
redo <- as.data.frame(t(redo))
redo$Tumor <- rownames(redo)
redo$Type = c(rep("ESCC", 12), rep("EAC", 5))
​
​
library(tidyr)
data <- gather(tibble::as_tibble(redo), region, value,-Type,-Tumor)
​
library(ggpubr)
p <- ggboxplot(data, 
               x = "Tumor", 
               y = "value",
               color = "Type", 
               palette =c("#00AFBB", "#E7B800", "#FC4E07"),
               order = c(names(sort(rowMeans(redo[redo$Type == "ESCC",1:(ncol(redo)-2)],na.rm = T))),
                         names(sort(rowMeans(redo[redo$Type != "ESCC",1:(ncol(redo)-2)],na.rm = T)))),
               x.text.angle = 90)
​
p + font("xy.text", size = 24, color = "black", face = "bold")
​
p
         
#ggbarplot(data, "Tumor", "value", rotate_x_text(angle = 90))
         
#~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*
# Make Violin Plot of Regions from ret Obj - EAC vs ESCC
#~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*-*-*
​
ESCC <- as.data.frame(rowMeans(retB[,1:12]))
colnames(ESCC) <- "ESCC"
​
EAC <- as.data.frame(rowMeans(retB[,13:17]))
colnames(EAC) <- "EAC"
​
​
merged2 <- cbind(ESCC,EAC)
merged3 <- as.data.frame(merged2[(!is.na(merged2)),])
​
ESCC3 <- gather(merged3, EAC=EAC, ESCC=ESCC)
colnames(ESCC3) <- c('Tumor-Type', 'Beta-Value')
​
​
​
library(ggplot2)
# Basic violin plot
p <- ggplot(ESCC3, aes(x=ESCC3$`Tumor-Type`,y = ESCC3$`Beta-Value`)) + 
  geom_violin(aes(color = ESCC3$`Tumor-Type`))
​
q <- p + geom_boxplot(width = 0.2) + labs(title = "Methylation Levels at HNF4a overlapped with ESCA-specific ATAC-seq Peaks" ,x = "ESCA Tumor Type",y = "Beta Value") +
  theme_grey(base_size = 22)
​
q + labs(colour='Tumor Type') 
