#
# plot3.R
#
################################################
# Read in the Electric Power Consumption Data

library(readr)


#Read in the first row to get the column names
nam = read_delim("household_power_consumption.txt", 
                 delim = ";",
                 na = "?",
                 n_max = 1)

# Read in the days of interest. Note that there are 1440 minutes/day and 46 full days 
# until Feb 1, 2007. The first day is a partial day with 395 minutes in it. The total minutes from
# the beginning of the file until Feb 1, 2007 are then 66,637, so these are skipped.
epc = read_delim("household_power_consumption.txt", 
                 delim = ";",
                 col_names = FALSE,
                 na = "?",
                 skip = 66637,
                 n_max = 2880)
names(epc) = names(nam)
rm(nam)

epc$Date = as.Date(epc$Date, "%d/%m/%Y")

dateTimeString = paste(as.character(epc$Date), as.character(epc$Time))
dateTime = strptime(dateTimeString, "%Y-%m-%d %H:%M:%S")
rm(dateTimeString)

#################################################

#Set the width and height of the plot
par(mfrow = c(1,1), pin = c(4.5, 4.5))

plot(dateTime, epc$Sub_metering_1, col = "black", type = "l", lty = "solid", 
     xlab = "", ylab = "Energy sub metering")

lines(dateTime, epc$Sub_metering_2, col = "red", type = "l", lty = "solid")

lines(dateTime, epc$Sub_metering_3, col = "blue", type = "l", lty = "solid")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       text.col = c("black", "blue", "red"), col = c("black", "blue", "red"),
       lty = c("solid", "solid", "solid"))

# Save plot as a PNG file
dev.copy(png, file = "plot3.png")
dev.off()

