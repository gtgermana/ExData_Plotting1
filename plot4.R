#
# plot4.R
#

#Set the width, height and margins of the plot
par(mfrow = c(2, 2), pin = c(5, 5), mar = c(4,4,4,2))

# Plot (1,1): Global Active Power
plot(dateTime, epc$Global_active_power, type = "l", lty = "solid",
     xlab = "", ylab = "Global Active Power")

# Plot (1,2): Voltage
plot(dateTime, epc$Voltage, type = "l", lty = "solid", 
     xlab = "datetime", ylab = "Voltage")

# Plot (2,1): Energy sub metering
plot(dateTime, epc$Sub_metering_1, col = "black", type = "l", lty = "solid", 
     xlab = "", ylab = "Energy sub metering")
lines(dateTime, epc$Sub_metering_2, col = "red", type = "l", lty = "solid")
lines(dateTime, epc$Sub_metering_3, col = "blue", type = "l", lty = "solid")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       text.col = c("black", "blue", "red"), col = c("black", "blue", "red"),
       lty = c("solid", "solid", "solid"), bty = "n", inset = c(0.01,0))

# Plot (2,2): Global Reactive Power
plot(dateTime, epc$Global_reactive_power, type = "l", lty = "solid", 
     xlab = "datetime", ylab = "Global_reactive_power")

# Save plot as a PNG file
dev.copy(png, file = "plot4.png")
dev.off()

# Reset the default margins
par(mar = c(5,4,4,2))
