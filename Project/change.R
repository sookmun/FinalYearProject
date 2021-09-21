library(readxl)
data <- read_excel("MATLAB/SookMun_UI_TEST/FinalCodesWithoutUi/HammoucheWithLeshAndGlcm/results_extra_hammouche_lesh_3class.xlsx")
data["Actual Condition"][data["Actual Condition"] == "M"]<-"C"
data["Actual Condition"][data["Actual Condition"] == "B"]<-"C"
write.csv(data,"C:/Users/New Hp/Documents/MATLAB/SookMun_UI_TEST/FinalCodesWithoutUi/HammoucheWithLeshAndGlcm/results_extra_hammouche_lesh_2class.csv", row.names = FALSE)
